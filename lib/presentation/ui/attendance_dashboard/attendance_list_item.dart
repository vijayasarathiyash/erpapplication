import 'package:erpapplication/presentation/ui/attendance_dashboard/rounded_card_widget.dart';
import 'package:flutter/material.dart';

class AttendanceItem extends StatelessWidget {
  final String initials;
  final String name;
  final String time;
  final String status;
  final String location;

  const AttendanceItem({
    super.key,
    required this.initials,
    required this.name,
    required this.time,
    required this.status,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.deepPurple.shade200,
            child: Text(initials, style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(time, style: TextStyle(color: Colors.grey[700])),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(location),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(status, style: TextStyle(color: Colors.green)),
          )
        ],
      ),
    );
  }
}