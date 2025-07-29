import 'package:flutter/material.dart';

class NotificationListScreen extends StatelessWidget {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Machine Approved',
      description:
          'Your machine request has been approved and is ready for use',
      status: NotificationStatus.approved,
      time: '2 hours ago',
    ),
    NotificationItem(
      title: 'Certificate Ready',
      description: 'Your safety certificate is ready for download',
      status: NotificationStatus.ready,
      time: '4 hours ago',
    ),
    NotificationItem(
      title: 'Application Rejected',
      description:
          'Your application has been rejected. Please review the requirements',
      status: NotificationStatus.rejected,
      time: '1 day ago',
    ),
    NotificationItem(
      title: 'Verification Pending',
      description: 'Your document verification is currently in progress',
      status: NotificationStatus.pending,
      time: '2 days ago',
    ),
    NotificationItem(
      title: 'License Approved',
      description: 'Your operating license has been approved successfully',
      status: NotificationStatus.approved,
      time: '3 days ago',
    ),
    NotificationItem(
      title: 'Inspection Scheduled',
      description: 'Machine inspection has been scheduled for next week',
      status: NotificationStatus.scheduled,
      time: '4 days ago',
    ),
    NotificationItem(
      title: 'Payment Failed',
      description: 'Your payment could not be processed. Please try again',
      status: NotificationStatus.failed,
      time: '5 days ago',
    ),
    NotificationItem(
      title: 'Maintenance Complete',
      description: 'Scheduled maintenance has been completed successfully',
      status: NotificationStatus.completed,
      time: '1 week ago',
    ),
  ];

  NotificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo[600],
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.more_vert, color: Colors.white),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationCard(notification: notifications[index]);
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: () {
            // Handle notification tap
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Tapped: ${notification.title}'),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: notification.status.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(
                    notification.status.icon,
                    color: notification.status.color,
                    size: 24,
                  ),
                ),
                SizedBox(width: 16.0),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and Status Badge
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              notification.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            decoration: BoxDecoration(
                              color: notification.status.color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              notification.status.label,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: notification.status.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0),

                      // Description
                      Text(
                        notification.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.0),

                      // Time
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey[400],
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            notification.time,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String description;
  final NotificationStatus status;
  final String time;

  NotificationItem({
    required this.title,
    required this.description,
    required this.status,
    required this.time,
  });
}

enum NotificationStatus {
  approved,
  rejected,
  pending,
  ready,
  scheduled,
  failed,
  completed,
}

extension NotificationStatusExtension on NotificationStatus {
  String get label {
    switch (this) {
      case NotificationStatus.approved:
        return 'Approved';
      case NotificationStatus.rejected:
        return 'Rejected';
      case NotificationStatus.pending:
        return 'Pending';
      case NotificationStatus.ready:
        return 'Ready';
      case NotificationStatus.scheduled:
        return 'Scheduled';
      case NotificationStatus.failed:
        return 'Failed';
      case NotificationStatus.completed:
        return 'Completed';
    }
  }

  Color get color {
    switch (this) {
      case NotificationStatus.approved:
        return Colors.green[600]!;
      case NotificationStatus.rejected:
        return Colors.red[600]!;
      case NotificationStatus.pending:
        return Colors.orange[600]!;
      case NotificationStatus.ready:
        return Colors.blue[600]!;
      case NotificationStatus.scheduled:
        return Colors.purple[600]!;
      case NotificationStatus.failed:
        return Colors.red[700]!;
      case NotificationStatus.completed:
        return Colors.teal[600]!;
    }
  }

  IconData get icon {
    switch (this) {
      case NotificationStatus.approved:
        return Icons.check_circle;
      case NotificationStatus.rejected:
        return Icons.cancel;
      case NotificationStatus.pending:
        return Icons.hourglass_empty;
      case NotificationStatus.ready:
        return Icons.file_download;
      case NotificationStatus.scheduled:
        return Icons.schedule;
      case NotificationStatus.failed:
        return Icons.error;
      case NotificationStatus.completed:
        return Icons.check_circle_outline;
    }
  }
}
