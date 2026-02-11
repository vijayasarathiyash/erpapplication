import 'package:flutter/material.dart';

import '../model/Employee.dart';

class OnLeavePage extends StatelessWidget {
  final List<Leave> leaves;

  const OnLeavePage({super.key, required this.leaves});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees On Leave (${leaves.length})'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: leaves.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return OnLeaveTile(leave: leaves[index]);
        },
      ),
    );
  }
}

class OnLeaveTile extends StatelessWidget {
  final Leave leave;

  const OnLeaveTile({super.key, required this.leave});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.orange.shade100,
            child: const Icon(Icons.person, color: Colors.orange),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  leave.employeeName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${leave.leaveType} • ${leave.totalDays} day(s)',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 4),
                Text(
                  '${_fmt(leave.fromDate)} → ${_fmt(leave.toDate)}',
                ),
                const SizedBox(height: 4),
                Text(
                  'Reason: ${leave.reason}',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
          Chip(
            label: Text(leave.status),
            backgroundColor: Colors.green.shade50,
          ),
        ],
      ),
    );
  }

  String _fmt(DateTime d) => '${d.day}/${d.month}/${d.year}';
}
