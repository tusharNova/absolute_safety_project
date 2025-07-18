import 'package:absolute_safety/screen/dashboard/DownloadCertificatePage.dart';
import 'package:absolute_safety/screen/dashboard/RenewalRemindersPage.dart';
import 'package:absolute_safety/screen/dashboard/ScanQRCodePage.dart';
import 'package:absolute_safety/screen/dashboard/machine_submit.dart';
import 'package:absolute_safety/screen/dashboard/CertificateStatusHistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutBack,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    SizedBox(height: 30),
                    _buildDashboardOptions(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Machine Inspection',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2C3E50),
                letterSpacing: 1.2,
              ),
            ),
            Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF7F8C8D),
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF667EEA).withOpacity(0.25),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Icon(
            Icons.notifications_outlined,
            color: Colors.white,
            size: 24,
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardOptions() {
    final options = [
      {
        'title': 'Submit Machine Inspection',
        'subtitle': 'Request new inspection',
        'icon': Icons.add_task,
        'color': Color(0xFF667EEA),
        'route': MachineInspectionRequestPage(),
      },
      {
        'title': 'Certificate Status & History',
        'subtitle': 'Track your certificates',
        'icon': Icons.history,
        'color': Color(0xFF764BA2),
        'route': CertificateStatusHistoryPage(),
      },
      {
        'title': 'Renewal Reminders',
        'subtitle': 'Stay updated on renewals',
        'icon': Icons.notification_important,
        'color': Color(0xFF11998E),
        'route': RenewalRemindersPage(),
      },
      {
        'title': 'Download Certificate',
        'subtitle': 'Get your PDF certificate',
        'icon': Icons.download,
        'color': Color(0xFFE056FD),
        'route': DownloadCertificatePage(),
      },
      {
        'title': 'Scan QR Code',
        'subtitle': 'Verify certificate authenticity',
        'icon': Icons.qr_code_scanner,
        'color': Color(0xFFFF6B6B),
        'route': ScanQRCodePage(),
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.79,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        return _buildOptionCard(
          title: option['title'] as String,
          subtitle: option['subtitle'] as String,
          icon: option['icon'] as IconData,
          color: option['color'] as Color,
          route: option['route'],
          delay: Duration(milliseconds: 100 * index),
        );
      },
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required var route,
    required Duration delay,
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 600) + delay,
      curve: Curves.easeOutBack,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              // Navigator.pushNamed(context, route);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => route),
              );
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFE8E8E8), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.08),
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: color.withOpacity(0.1),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [color, color.withOpacity(0.7)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(icon, color: Colors.white, size: 28),
                  ),
                  SizedBox(height: 15),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 11, color: Color(0xFF7F8C8D)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Placeholder screens for navigation
class SubmitInspectionScreen extends StatelessWidget {
  const SubmitInspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(
      context,
      'Submit Machine Inspection',
      Icons.add_task,
      Color(0xFF667EEA),
    );
  }
}

class CertificateStatusScreen extends StatelessWidget {
  const CertificateStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(
      context,
      'Certificate Status & History',
      Icons.history,
      Color(0xFF764BA2),
    );
  }
}

class RenewalRemindersScreen extends StatelessWidget {
  const RenewalRemindersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(
      context,
      'Renewal Reminders',
      Icons.notification_important,
      Color(0xFF11998E),
    );
  }
}

class DownloadCertificateScreen extends StatelessWidget {
  const DownloadCertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(
      context,
      'Download Certificate',
      Icons.download,
      Color(0xFFE056FD),
    );
  }
}

class ScanQRScreen extends StatelessWidget {
  const ScanQRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildPlaceholderScreen(
      context,
      'Scan QR Code',
      Icons.qr_code_scanner,
      Color(0xFFFF6B6B),
    );
  }
}

Widget _buildPlaceholderScreen(
  BuildContext context,
  String title,
  IconData icon,
  Color color,
) {
  return Scaffold(
    backgroundColor: Color(0xFFF8F9FA),
    appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Color(0xFF2C3E50)),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF2C3E50),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: Icon(icon, color: Colors.white, size: 60),
          ),
          SizedBox(height: 30),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2C3E50),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            'This screen will contain the functionality for $title',
            style: TextStyle(fontSize: 16, color: Color(0xFF7F8C8D)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}
