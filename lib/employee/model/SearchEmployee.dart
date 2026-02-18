import 'package:equatable/equatable.dart';

import 'EmployeeModel.dart';

abstract class EmployeeEvent {}

class LoadEmployees extends EmployeeEvent {}

class SearchEmployee extends EmployeeEvent {
  final String query;

  SearchEmployee(this.query);
}

class AddEmployee extends EmployeeEvent {
  final EmployeeModel employee;

  AddEmployee(this.employee);
}
