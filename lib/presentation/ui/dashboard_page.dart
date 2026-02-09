import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _HeaderSection(),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                child: _StriteGrid(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 540),
              child: AttendanceChart(),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 850, start: 15,bottom:20,end: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Quick Actions",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  QuickActionsGrid(),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 1200, start: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recent Activity",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  RecentActivityList(),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E5BFF), Color(0xFF1E88FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Today's overview",
            style: TextStyle(color: Colors.white60),
          ),
          const SizedBox(height: 6),
          const Text(
            "Thursday 5",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(
                child: _TopInfoCard(
                  title: "Total Staff",
                  value: "7000",
                  subTitle: "Active Today",
                  icon: Icons.people,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: _TopInfoCard(
                  title: "Avg Hours",
                  value: "9H",
                  subTitle: "This Week",
                  icon: Icons.access_time,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StriteGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 1.6,
        childAspectRatio: 1.6,
        children: const [
          _StatCard(title: "Check-in", value: "142", subTitle: "+8"),
          _StatCard(title: "Check-out", value: "12", subTitle: "+8"),
          _StatCard(title: "Late Arrival", value: "5", subTitle: "+8"),
          _StatCard(title: "Remote", value: "8", subTitle: "+8"),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subTitle;

  const _StatCard({
    required this.title,
    required this.value,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                subTitle,
                style: const TextStyle(fontSize: 12, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String subTitle;
  final IconData icon;

  const _TopInfoCard({
    required this.title,
    required this.value,
    required this.subTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white),
              SizedBox(width: 5),
              Text(title, style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            subTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceChart extends StatelessWidget {
  const AttendanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "This Week",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Attendance trend",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const Text(
                "94%",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),
          SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 4,
                  minY: 88,
                  maxY: 96,

                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),

                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, meta) {
                          if (value % 1 != 0) {
                            return const SizedBox.shrink();
                          }

                          const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

                          if (value < 0 || value > 4) {
                            return const SizedBox.shrink();
                          }

                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              days[value.toInt()],
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 90),
                        FlSpot(1, 92),
                        FlSpot(2, 91),
                        FlSpot(3, 94),
                        FlSpot(4, 93),
                      ],
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 3,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 5,
                            color: Colors.white,
                            strokeWidth: 3,
                            strokeColor: Colors.blue,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.6,
      children: const [
        QuickActionCard(
          title: "Check In",
          icon: Icons.access_time,
          color: Color(0xFFEFF5FF),
          iconColor: Colors.blue,
        ),
        QuickActionCard(
          title: "Team",
          icon: Icons.group,
          color: Color(0xFFF6F0FF),
          iconColor: Colors.purple,
        ),
        QuickActionCard(
          title: "Tasks",
          icon: Icons.radio_button_checked,
          color: Color(0xFFEFFAF3),
          iconColor: Colors.green,
        ),
        QuickActionCard(
          title: "Payroll",
          icon: Icons.attach_money,
          color: Color(0xFFFFF6EB),
          iconColor: Colors.orange,
        ),
      ],
    );
  }
}

class QuickActionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Color iconColor;

  const QuickActionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor, size: 28),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w600, color: iconColor),
          ),
        ],
      ),
    );
  }
}

class RecentActivityList extends StatelessWidget {
  const RecentActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ActivityTile(
          icon: Icons.access_time,
          iconBg: Color(0xFFE6F4EA),
          title: "Sarah Johnson checked in",
          time: "2 minutes ago",
          iconColor: Colors.green,
        ),
        ActivityTile(
          icon: Icons.person_add,
          iconBg: Color(0xFFEFF5FF),
          title: "New employee added",
          time: "1 hour ago",
          iconColor: Colors.blue,
        ),
        ActivityTile(
          icon: Icons.radio_button_checked,
          iconBg: Color(0xFFF6F0FF),
          title: "Leave request approved",
          time: "3 hours ago",
          iconColor: Colors.purple,
        ),
      ],
    );
  }
}

class ActivityTile extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String time;

  const ActivityTile({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(
        start: 10,
        end: 10,
        top: 5,
        bottom: 5,
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black12.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: iconBg,
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
