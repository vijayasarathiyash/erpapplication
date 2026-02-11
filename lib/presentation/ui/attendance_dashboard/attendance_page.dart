import 'package:erpapplication/presentation/ui/attendance_dashboard/rounded_card_widget.dart';
import 'package:erpapplication/presentation/ui/attendance_dashboard/summary_item_widget.dart';
import 'package:erpapplication/presentation/ui/attendance_dashboard/weekely_progress_bar_item.dart';
import 'package:flutter/material.dart';

import 'attendance_list_item.dart';

class AttendanceManagementPage extends StatelessWidget {
  const AttendanceManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),

            SizedBox(height: 16),
            _buildSummary(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("This Week",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),

            _buildWeeklyList(),

            _buildAttendanceList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF0A6BFF), Color(0xFF116BFF)]),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Text("Current Time", style: TextStyle(color: Colors.white70)),
          Text("11:39 AM",
              style:
              TextStyle(fontSize: 42, fontWeight: FontWeight.bold, color: Colors.white)),
          Text("Thursday, February 5, 2026", style: TextStyle(color: Colors.white70)),
          SizedBox(height: 24),
          _todayHoursCard(),
          SizedBox(height: 16),
          _checkInButton(),
        ],
      ),
    );
  }

  Widget _todayHoursCard() {
    return RoundedCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Today's Hours"),
              Text("7h 45m", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: 0.65,
            color: Colors.white,
            backgroundColor: Colors.white24,
            minHeight: 8,
          ),
        ],
      ),
    );
  }

  Widget _checkInButton() {
    return RoundedCard(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.access_time),
            SizedBox(width: 8),
            Text("Check In"),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Today's Summary",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: SummaryItem(
                    icon: Icons.check_circle,
                    iconColor: Colors.green,
                    count: "143",
                    label: "Present")),
            SizedBox(width: 12),
            Expanded(
                child: SummaryItem(
                    icon: Icons.error_outline,
                    iconColor: Colors.orange,
                    count: "5",
                    label: "Late")),
            SizedBox(width: 12),
            Expanded(
                child: SummaryItem(
                    icon: Icons.cancel_outlined,
                    iconColor: Colors.red,
                    count: "7",
                    label: "Absent")),
          ],
        ),
      ]),
    );
  }

  Widget _buildWeeklyList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          WeekProgressItem(
            day: "Mon",
            value: 142,
            late: "5 late",
            absent: "8 absent",
          ),
          WeekProgressItem(
            day: "Tue",
            value: 145,
            late: "3 late",
            absent: "5 absent",
          ),
          WeekProgressItem(
            day: "Wed",
            value: 148,
            late: "6 late",
            absent: "4 absent",
          ),
          WeekProgressItem(
            day: "Thu",
            value: 143,
            late: "5 late",
            absent: "7 absent",
          ),
          WeekProgressItem(
            day: "Fri",
            value: 140,
            late: "8 late",
            absent: "10 absent",
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceList() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Today's Attendance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("View All", style: TextStyle(color: Colors.blue)),
          ],
        ),
        SizedBox(height: 16),
        AttendanceItem(
          initials: "SJ",
          name: "Sarah Johnson",
          time: "09:00 AM",
          status: "Present",
          location: "Office",
        ),
        SizedBox(height: 12),
        AttendanceItem(
          initials: "MC",
          name: "Michael Chen",
          time: "08:45 AM → 05:30 PM",
          status: "Present",
          location: "Office",
        ),
      ]),
    );
  }
}