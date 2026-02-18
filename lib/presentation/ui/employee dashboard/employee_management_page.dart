import 'package:erpapplication/presentation/ui/employee%20dashboard/searchBar_component.dart';
import 'package:flutter/material.dart';

import '../../../data/model/employee_model.dart';
import 'department_filter.dart';
import 'employee_list.dart';
import 'header_section.dart';

class EmployeeManagementPage extends StatefulWidget {
  const EmployeeManagementPage({super.key});

  @override
  State<EmployeeManagementPage> createState() =>
      _EmployeesDashboardScreenState();
}

class _EmployeesDashboardScreenState extends State<EmployeeManagementPage> {
  String selectedDepartment = 'Engineering';

  final departments = ['All', 'Engineering', 'Sales', 'Marketing', 'Design'];

  final employees = [
    Employee(
      id: 'EMP001',
      name: 'Shardullya Singh',
      email: 'shardullya@yash.com',
      phone: '+1 (555) 123-4567',
      address: 'Bangalore, India',
      department: 'Engineering',
      designation: 'Software Engineer',
      managerId: 'EMP100',
      managerName: 'Ravi Kumar',
      joiningDate: DateTime(2022, 6, 15),
      employmentType: 'Full-time',
      status: true,
      // Active
      skills: ['Flutter', 'Dart', 'Firebase'],
      experience: 3,
      isOnLeave: false,
    ),

    Employee(
      id: 'EMP001',
      name: 'Shardullya Singh',
      email: 'shardullya@yash.com',
      phone: '+1 (555) 123-4567',
      address: 'Bangalore, India',
      department: 'Engineering',
      designation: 'Software Engineer',
      managerId: 'EMP100',
      managerName: 'Ravi Kumar',
      joiningDate: DateTime(2022, 6, 15),
      employmentType: 'Full-time',
      status: true,
      // Active
      skills: ['Flutter', 'Dart', 'Firebase'],
      experience: 3,
      isOnLeave: false,
    ),

    Employee(
      id: 'EMP001',
      name: 'Shardullya Singh',
      email: 'shardullya@yash.com',
      phone: '+1 (555) 123-4567',
      address: 'Bangalore, India',
      department: 'Engineering',
      designation: 'Software Engineer',
      managerId: 'EMP100',
      managerName: 'Ravi Kumar',
      joiningDate: DateTime(2022, 6, 15),
      employmentType: 'Full-time',
      status: true,
      // Active
      skills: ['Flutter', 'Dart', 'Firebase'],
      experience: 3,
      isOnLeave: false,
    ),

    Employee(
      id: 'EMP001',
      name: 'Shardullya Singh',
      email: 'shardullya@yash.com',
      phone: '+1 (555) 123-4567',
      address: 'Bangalore, India',
      department: 'Engineering',
      designation: 'Software Engineer',
      managerId: 'EMP100',
      managerName: 'Ravi Kumar',
      joiningDate: DateTime(2022, 6, 15),
      employmentType: 'Full-time',
      status: true,
      // Active
      skills: ['Flutter', 'Dart', 'Firebase'],
      experience: 3,
      isOnLeave: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSection(totalEmployees: employees.length),
                const SizedBox(height: 16),
                const EmployeeSearchBar(),
                const SizedBox(height: 16),
                DepartmentFilterList(
                  departments: departments,
                  selected: selectedDepartment,
                  onSelected: (value) {
                    setState(() => selectedDepartment = value);
                  },
                ),
                const SizedBox(height: 16),
                EmployeeList(employees: employees),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
