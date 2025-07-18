import 'package:flutter/material.dart';

class RenewalRemindersPage extends StatefulWidget {
  @override
  _RenewalRemindersPageState createState() => _RenewalRemindersPageState();
}

class _RenewalRemindersPageState extends State<RenewalRemindersPage> {
  List<RenewalItem> renewalItems = [
    RenewalItem(
      title: 'Netflix Subscription',
      description: 'Monthly streaming service',
      amount: '\$15.99',
      dueDate: DateTime(2025, 7, 15),
      category: 'Entertainment',
      icon: Icons.play_circle_fill,
      color: Colors.red,
      isUrgent: true,
    ),
    RenewalItem(
      title: 'Adobe Creative Cloud',
      description: 'Design and creative tools',
      amount: '\$52.99',
      dueDate: DateTime(2025, 7, 20),
      category: 'Software',
      icon: Icons.design_services,
      color: Colors.purple,
      isUrgent: false,
    ),
    RenewalItem(
      title: 'Car Insurance',
      description: 'Vehicle protection coverage',
      amount: '\$127.50',
      dueDate: DateTime(2025, 8, 5),
      category: 'Insurance',
      icon: Icons.directions_car,
      color: Colors.blue,
      isUrgent: false,
    ),
    RenewalItem(
      title: 'Gym Membership',
      description: 'Fitness center access',
      amount: '\$49.99',
      dueDate: DateTime(2025, 7, 18),
      category: 'Health',
      icon: Icons.fitness_center,
      color: Colors.green,
      isUrgent: true,
    ),
    RenewalItem(
      title: 'Domain Registration',
      description: 'Website domain renewal',
      amount: '\$12.99',
      dueDate: DateTime(2025, 8, 12),
      category: 'Web Services',
      icon: Icons.language,
      color: Colors.orange,
      isUrgent: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Renewal Reminders',
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.filter_list, color: Colors.grey[600]),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.search, color: Colors.grey[600]),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Column(
        children: [
          // List Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Upcoming Renewals',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  '${renewalItems.length} items',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          // Renewal Items List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: renewalItems.length,
              itemBuilder: (context, index) {
                final item = renewalItems[index];
                return RenewalItemCard(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RenewalItemCard extends StatelessWidget {
  final RenewalItem item;

  const RenewalItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final daysUntilDue = item.dueDate.difference(DateTime.now()).inDays;

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: item.isUrgent
            ? Border.all(color: Colors.red.withOpacity(0.3), width: 1)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Handle tap
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: item.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(item.icon, color: item.color, size: 24),
                ),
                SizedBox(width: 16),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                          Text(
                            item.amount,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        item.description,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              item.category,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.schedule,
                                size: 14,
                                color: daysUntilDue <= 3
                                    ? Colors.red
                                    : Colors.grey[600],
                              ),
                              SizedBox(width: 4),
                              Text(
                                daysUntilDue <= 0
                                    ? 'Due today'
                                    : daysUntilDue == 1
                                    ? 'Due tomorrow'
                                    : 'Due in $daysUntilDue days',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: daysUntilDue <= 3
                                      ? Colors.red
                                      : Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
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

class RenewalItem {
  final String title;
  final String description;
  final String amount;
  final DateTime dueDate;
  final String category;
  final IconData icon;
  final Color color;
  final bool isUrgent;

  RenewalItem({
    required this.title,
    required this.description,
    required this.amount,
    required this.dueDate,
    required this.category,
    required this.icon,
    required this.color,
    required this.isUrgent,
  });
}
