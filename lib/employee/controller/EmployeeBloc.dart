import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/Employee.dart';
import '../model/EmployeeRepository.dart';
import '../model/EmployeeState.dart';
import '../model/SearchEmployee.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeRepository repository;
  List<Employee> _allEmployees = [];

  EmployeeBloc(this.repository) : super(EmployeeInitial()) {
    on<LoadEmployees>(_onLoadEmployees);
    on<SearchEmployee>(_onSearchEmployee);
  }

  void _onLoadEmployees(
      LoadEmployees event, Emitter<EmployeeState> emit) {
    emit(EmployeeLoading());
    _allEmployees = repository.fetchEmployees();
    emit(EmployeeLoaded(_allEmployees));
  }

  void _onSearchEmployee(
      SearchEmployee event, Emitter<EmployeeState> emit) {
    final filtered = _allEmployees
        .where((e) =>
    e.name.toLowerCase().contains(event.query.toLowerCase()) ||
        e.department.toLowerCase().contains(event.query.toLowerCase()))
        .toList();

    emit(EmployeeLoaded(filtered));
  }
}
