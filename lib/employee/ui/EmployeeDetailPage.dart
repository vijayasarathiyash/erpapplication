import 'package:flutter/material.dart';

import '../model/Employee.dart';

class EmployeeDetailPage extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailPage({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _ProfileHeader(employee: employee),
            const SizedBox(height: 12),
            _OrganizationSection(employee: employee),
            _ExpertiseSection(employee: employee),
            _PersonalInfoSection(employee: employee),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final Employee employee;

  const _ProfileHeader({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo.shade400, Colors.indigo.shade700],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Text(
              employee.name[0],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                employee.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                employee.designation,
                style: const TextStyle(color: Colors.white70),
              ),
              Text(
                employee.department,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          )
        ],
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
        _DetailRow(
          'Status',
          employee.isOnLeave ? 'On Leave' : 'Active',
        ),
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
          children: employee.skills
              .map(
                (skill) => Chip(
              label: Text(skill),
              backgroundColor: Colors.blue.shade50,
            ),
          )
              .toList(),
        ),
        const SizedBox(height: 8),
        _DetailRow(
          'Experience',
          '${employee.experience} Years',
        ),
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

class _DetailCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _DetailCard({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
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
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade600,
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

