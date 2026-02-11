import 'package:flutter/material.dart';

class WeekProgressItem extends StatelessWidget {
  final String day;
  final int value;
  final int maxValue;
  final String late;
  final String absent;

  const WeekProgressItem({
    super.key,
    required this.day,
    required this.value,
    this.maxValue = 150,
    required this.late,
    required this.absent,
  });

  @override
  Widget build(BuildContext context) {
    final percent = value / maxValue;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(day, style: TextStyle(fontWeight: FontWeight.w600)),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: percent,
                  minHeight: 10,
                  color: Colors.green,
                  backgroundColor: Colors.grey[300],
                ),
              ),
            ),
            SizedBox(width: 12),
            Text(value.toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        SizedBox(height: 4),
        Text("$late • $absent", style: TextStyle(color: Colors.grey[600])),
      ]),
    );
  }
}