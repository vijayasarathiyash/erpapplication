import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/EmployeeBloc.dart';
import '../model/EmployeeRepository.dart';
import '../model/LeaveRepository.dart';
import '../model/SearchEmployee.dart';
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
        backgroundColor: const Color(0xffF8F9FB),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _HeaderSection(),
              SizedBox(height: 12),

              /// ✅ Animated Info Section Added Here
              _TopAnimatedSection(),
              SizedBox(height: 12),
              _SearchBar(),
              //_DepartmentTabs(),
              Expanded(child: EmployeeList()),
            ],
          ),
        ),
      ),
    );
  }
}

class _TopAnimatedSection extends StatelessWidget {
  const _TopAnimatedSection();

  @override
  Widget build(BuildContext context) {
    final todayLeaves = LeaveRepository().getTodayLeaves();
    final names = todayLeaves.isEmpty
        ? ['No one on leave']
        : todayLeaves.map((e) => e.employeeName).toList();

    final notifications = [
      'Company holiday on Friday 🎉',
      'New leave policy updated',
      'Timesheet reminder',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _ModernAnimatedCard(
              title: "On Leave Today",
              icon: Icons.beach_access,
              names: names,
              gradient: const [Color(0xffF59E0B), Color(0xffD97706)],
              onTap: todayLeaves.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => OnLeavePage(leaves: todayLeaves),
                        ),
                      );
                    },
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _ModernAnimatedCard(
              title: "Notifications",
              icon: Icons.notifications_active_outlined,
              names: notifications,
              gradient: const [Color(0xff3B82F6), Color(0xff1D4ED8)],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NotificationPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ModernAnimatedCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<String> names;
  final List<Color> gradient;
  final VoidCallback? onTap;

  const _ModernAnimatedCard({
    required this.title,
    required this.icon,
    required this.names,
    required this.gradient,
    this.onTap,
  });

  @override
  State<_ModernAnimatedCard> createState() => _ModernAnimatedCardState();
}

class _ModernAnimatedCardState extends State<_ModernAnimatedCard> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  void initState() {
    super.initState();

    if (widget.names.length > 1) {
      Future.delayed(const Duration(seconds: 2), autoScroll);
    }
  }

  void autoScroll() {
    if (!mounted) return;

    _index = (_index + 1) % widget.names.length;

    _controller.animateToPage(
      _index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );

    Future.delayed(const Duration(seconds: 2), autoScroll);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: widget.gradient),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: widget.gradient.last.withOpacity(0.35),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(widget.icon, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 24,
                    child: widget.names.length == 1
                        ? Text(
                            widget.names.first,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : PageView.builder(
                            controller: _controller,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.names.length,
                            itemBuilder: (_, index) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  widget.names[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Employees",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "8 team members",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: const [
                Icon(Icons.add, color: Colors.white, size: 18),
                SizedBox(width: 6),
                Text(
                  "Add",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: (value) {
          context.read<EmployeeBloc>().add(SearchEmployee(value));
        },
        decoration: InputDecoration(
          hintText: "Search employees...",
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: const Color(0xffEFF1F5),
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class _DepartmentTabs extends StatelessWidget {
  const _DepartmentTabs();

  @override
  Widget build(BuildContext context) {
    final tabs = ["All", "Engineering", "Sales", "Marketing", "Design"];

    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 16),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = index == 0;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xff2563EB)
                  : const Color(0xffEFF1F5),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              tabs[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
