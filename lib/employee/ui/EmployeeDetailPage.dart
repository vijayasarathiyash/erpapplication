import 'package:flutter/material.dart';
import '../model/Employee.dart';

class EmployeeDetailPage extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailPage({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ModernTopHeader(employee: employee),
            const SizedBox(height: 16),
            _OrganizationSection(employee: employee),
            _ExpertiseSection(employee: employee),
            _PersonalInfoSection(employee: employee),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _OrganizationSection extends StatelessWidget {
  final Employee employee;

  const _OrganizationSection({required this.employee});

  @override
  Widget build(BuildContext context) {
    return _DetailCard(
      title: 'Organization Details',
      children: [
        _DetailRow('Employee ID', employee.id),
        _DetailRow('Department', employee.department),
        _DetailRow('Designation', employee.designation),
        _DetailRow('Reporting Manager', employee.managerId),
        _DetailRow('Status', employee.isOnLeave ? 'On Leave' : 'Active'),
      ],
    );
  }
}

class _ExpertiseSection extends StatelessWidget {
  final Employee employee;

  const _ExpertiseSection({required this.employee});

  @override
  Widget build(BuildContext context) {
    return _DetailCard(
      title: 'Expertise',
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: employee.skills.map((skill) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xffEFF6FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                skill,
                style: const TextStyle(
                  color: Color(0xff2563EB),
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        _DetailRow('Experience', '${employee.experience} Years'),
      ],
    );
  }
}

class _PersonalInfoSection extends StatelessWidget {
  final Employee employee;

  const _PersonalInfoSection({required this.employee});

  @override
  Widget build(BuildContext context) {
    return _DetailCard(
      title: 'Personal Information',
      children: [
        _DetailRow('Email', employee.email),
        _DetailRow('Phone', employee.phone),
        _DetailRow('Address', employee.address),
      ],
    );
  }
}

class _ModernTopHeader extends StatelessWidget {
  final Employee employee;

  const _ModernTopHeader({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff2563EB), Color(0xff1D4ED8)],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          /// Back + Title Row
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Employee Details",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// Profile Info
          Row(
            children: [
              CircleAvatar(
                radius: 36,
                backgroundColor: Colors.white,
                child: Text(
                  employee.name[0],
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2563EB),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      employee.designation,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      employee.department,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              /// Status Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: employee.isOnLeave
                      ? Colors.orange.shade100
                      : Colors.green.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  employee.isOnLeave ? "On Leave" : "Active",
                  style: TextStyle(
                    color: employee.isOnLeave ? Colors.orange : Colors.green,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _DetailCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
