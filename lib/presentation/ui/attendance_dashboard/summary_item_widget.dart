import 'package:erpapplication/presentation/ui/attendance_dashboard/rounded_card_widget.dart';
import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String count;
  final String label;

  const SummaryItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor, size: 28),
          SizedBox(height: 8),
          Text(
            count,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(label, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}
