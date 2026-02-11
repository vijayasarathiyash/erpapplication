import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      AppNotification(
        title: 'Holiday Announcement',
        description: 'Company holiday on Friday due to festival',
        time: DateTime.now().subtract(const Duration(hours: 2)),
        type: NotificationType.announcement,
      ),
      AppNotification(
        title: 'Leave Policy Updated',
        description: 'New leave policy effective from March',
        time: DateTime.now().subtract(const Duration(days: 1)),
        type: NotificationType.leave,
      ),
      AppNotification(
        title: 'Timesheet Reminder',
        description: 'Please submit your timesheet before EOD',
        time: DateTime.now().subtract(const Duration(hours: 5)),
        type: NotificationType.attendance,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return NotificationTile(notification: notifications[index]);
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final AppNotification notification;

  const NotificationTile({super.key, required this.notification});

  IconData getIcon() {
    switch (notification.type) {
      case NotificationType.leave:
        return Icons.beach_access;
      case NotificationType.attendance:
        return Icons.access_time;
      case NotificationType.announcement:
        return Icons.campaign;
      default:
        return Icons.notifications;
    }
  }

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue.shade100,
            child: Icon(getIcon(), color: Colors.blue),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notification.description,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  _formatTime(notification.time),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          if (!notification.isRead)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.day}/${time.month}/${time.year}';
  }
}

enum NotificationType { announcement, leave, attendance, general }

class AppNotification {
  final String title;
  final String description;
  final DateTime time;
  final NotificationType type;
  final bool isRead;

  AppNotification({
    required this.title,
    required this.description,
    required this.time,
    required this.type,
    this.isRead = false,
  });
}


