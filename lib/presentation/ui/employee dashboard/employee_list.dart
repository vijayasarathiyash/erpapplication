import 'package:flutter/cupertino.dart';

import '../../../data/model/employee_model.dart';
import 'employee_card.dart';

class EmployeeList extends StatelessWidget {
  final List<Employee> employees;

  const EmployeeList({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: employees.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return EmployeeCard(employee: employees[index]);
      },
    );
  }
}