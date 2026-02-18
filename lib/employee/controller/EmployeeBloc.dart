import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/EmployeeModel.dart';
import '../model/EmployeeRepository.dart';
import '../model/EmployeeState.dart';
import '../model/SearchEmployee.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository repository;
  List<EmployeeModel> _allEmployees = [];

  EmployeeBloc(this.repository) : super(EmployeeInitial()) {
    on<LoadEmployees>(_onLoadEmployees);
    on<SearchEmployee>(_onSearchEmployee);
    on<AddEmployee>(_onAddEmployee);
  }

  Future<void> _onLoadEmployees(
    LoadEmployees event,
    Emitter<EmployeeState> emit,
  ) async {
    emit(EmployeeLoading());
    _allEmployees = await repository.fetchEmployees();
    emit(EmployeeLoaded(_allEmployees));
  }

  void _onSearchEmployee(SearchEmployee event, Emitter<EmployeeState> emit) {
    final filtered = _allEmployees
        .where(
          (e) =>
              e.name.toLowerCase().contains(event.query.toLowerCase()) ||
              e.department.toLowerCase().contains(event.query.toLowerCase()),
        )
        .toList();

    emit(EmployeeLoaded(filtered));
  }

  Future<void> _onAddEmployee(
      AddEmployee event,
      Emitter<EmployeeState> emit,
      ) async {
    try {
      emit(EmployeeLoading());

      await repository.addEmployee(event.employee);

      _allEmployees = await repository.fetchEmployees();

      emit(EmployeeLoaded(_allEmployees));
    } catch (e) {
      emit(EmployeeError('Failed to add employee'));
    }
  }
}
