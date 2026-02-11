import 'package:flutter/material.dart';

import '../../employee/ui/EmployeePage.dart';
import 'dashboard_page.dart';
import 'employee dashboard/employee_management_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    DashboardPage(),
    EmployeePage(),
    AttendanceManagementPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.badge), label: 'Employee'),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class AttendanceManagementPage extends StatelessWidget {
  const AttendanceManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("AttendanceManagement Page"));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Settings"));
  }
}
