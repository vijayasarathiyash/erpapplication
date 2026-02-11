import 'package:equatable/equatable.dart';

abstract class EmployeeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadEmployees extends EmployeeEvent {}

class SearchEmployee extends EmployeeEvent {
  final String query;

  SearchEmployee(this.query);

  @override
  List<Object?> get props => [query];
}
