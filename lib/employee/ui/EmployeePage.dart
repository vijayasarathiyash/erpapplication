import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/EmployeeBloc.dart';
import '../model/EmployeeRepository.dart';
import '../model/LeaveRepository.dart';
import '../model/SearchEmployee.dart';
import 'AnimatedInfoCard.dart';
import 'EmployeeList.dart';
import 'NotificationPage.dart';
import 'OnLeavePage.dart';

class EmployeePage extends StatelessWidget {
  const EmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmployeeBloc(EmployeeRepository())..add(LoadEmployees()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Employees')),
        body: Column(
          children: [
            const SizedBox(height: 12),

            /// Leave + Notification Row
            const TopInfoSection(),

            /// Search
            const _SearchBar(),

            /// Employee List
            const Expanded(child: EmployeeList()),
          ],
        ),
      ),
    );
  }
}

class TopInfoSection extends StatelessWidget {
  const TopInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: const [
          Expanded(child: OnLeaveSection()),
          SizedBox(width: 12),
          Expanded(child: CompanyNotificationBox()),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 8),
      child: TextField(
        onChanged: (value) {
          context.read<EmployeeBloc>().add(SearchEmployee(value));
        },
        decoration: InputDecoration(
          hintText: 'Search employee by name, department, skill',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class OnLeaveSection extends StatelessWidget {
  const OnLeaveSection({super.key});

  @override
  Widget build(BuildContext context) {
    final todayLeaves = LeaveRepository().getTodayLeaves();

    final names = todayLeaves.isEmpty
        ? ['No one on leave']
        : todayLeaves.map((l) => l.employeeName).toList();

    return GestureDetector(
      onTap: () {
        if (todayLeaves.isEmpty) return;

        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => OnLeavePage(leaves: todayLeaves)),
        );
      },
      child: AnimatedInfoCard(
        title: 'On Leave Today',
        icon: Icons.beach_access,
        items: names,
        gradientColors: [Colors.orange.shade400, Colors.orange.shade700],
      ),
    );
  }
}

class CompanyNotificationBox extends StatelessWidget {
  const CompanyNotificationBox({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      'Company holiday on Friday 🎉',
      'New leave policy updated',
      'Timesheet reminder',
    ];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NotificationPage()),
        );
      },
      child: AnimatedInfoCard(
        title: 'Notifications',
        icon: Icons.notifications_active,
        items: notifications,
        gradientColors: [Colors.blue.shade400, Colors.blue.shade700],
      ),
    );
  }
}
