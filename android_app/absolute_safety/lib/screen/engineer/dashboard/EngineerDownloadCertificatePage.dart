import 'package:flutter/material.dart';

class Engineerdownloadcertificatepage extends StatefulWidget {
  @override
  _DownloadCertificatePageState createState() =>
      _DownloadCertificatePageState();
}

class _DownloadCertificatePageState
    extends State<Engineerdownloadcertificatepage> {
  List<CertificateItem> certificates = [
    CertificateItem(
      title: 'Course Completion Certificate',
      description: 'Flutter Development Mastery',
      issueDate: DateTime(2025, 6, 15),
      fileSize: '2.4 MB',
      type: 'Course',
      icon: Icons.school,
      color: Colors.blue,
      isAvailable: true,
      downloadCount: 0,
    ),
    CertificateItem(
      title: 'Achievement Certificate',
      description: 'Mobile App Design Excellence',
      issueDate: DateTime(2025, 5, 20),
      fileSize: '1.8 MB',
      type: 'Achievement',
      icon: Icons.emoji_events,
      color: Colors.amber,
      isAvailable: true,
      downloadCount: 3,
    ),
    CertificateItem(
      title: 'Training Certificate',
      description: 'Advanced UI/UX Design Workshop',
      issueDate: DateTime(2025, 4, 10),
      fileSize: '3.1 MB',
      type: 'Training',
      icon: Icons.psychology,
      color: Colors.green,
      isAvailable: true,
      downloadCount: 1,
    ),
    CertificateItem(
      title: 'Participation Certificate',
      description: 'Tech Conference 2025',
      issueDate: DateTime(2025, 3, 25),
      fileSize: '1.5 MB',
      type: 'Event',
      icon: Icons.event,
      color: Colors.purple,
      isAvailable: true,
      downloadCount: 5,
    ),
    CertificateItem(
      title: 'Professional Certificate',
      description: 'Software Architecture Fundamentals',
      issueDate: DateTime(2025, 2, 8),
      fileSize: '2.9 MB',
      type: 'Professional',
      icon: Icons.verified,
      color: Colors.teal,
      isAvailable: false,
      downloadCount: 0,
    ),
    CertificateItem(
      title: 'Workshop Certificate',
      description: 'API Development Best Practices',
      issueDate: DateTime(2025, 1, 30),
      fileSize: '2.2 MB',
      type: 'Workshop',
      icon: Icons.code,
      color: Colors.orange,
      isAvailable: true,
      downloadCount: 2,
    ),
  ];

  String selectedFilter = 'All';
  List<String> filters = [
    'All',
    'Course',
    'Achievement',
    'Training',
    'Event',
    'Professional',
    'Workshop',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCertificates = selectedFilter == 'All'
        ? certificates
        : certificates.where((cert) => cert.type == selectedFilter).toList();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Download Certificates',
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.search, color: Colors.grey[600]),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: Icon(Icons.more_vert, color: Colors.grey[600]),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: Column(
        children: [
          // Stats Header
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Certificates',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '${certificates.length}',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${certificates.where((cert) => cert.isAvailable).length} Available',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Filter Tabs
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                final isSelected = selectedFilter == filter;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 12),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: isSelected ? Colors.blue : Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey[600],
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 16),

          // Certificates List
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredCertificates.length,
              itemBuilder: (context, index) {
                final certificate = filteredCertificates[index];
                return CertificateCard(certificate: certificate);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CertificateCard extends StatelessWidget {
  final CertificateItem certificate;

  const CertificateCard({Key? key, required this.certificate})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: certificate.isAvailable
              ? () {
                  // Handle download
                }
              : null,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Icon
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: certificate.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        certificate.icon,
                        color: certificate.color,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 16),

                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            certificate.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            certificate.description,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Status
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: certificate.isAvailable
                            ? Colors.green.withOpacity(0.1)
                            : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        certificate.isAvailable ? 'Available' : 'Processing',
                        style: TextStyle(
                          fontSize: 12,
                          color: certificate.isAvailable
                              ? Colors.green
                              : Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // Details Row
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Issued: ${_formatDate(certificate.issueDate)}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    SizedBox(width: 16),
                    Icon(
                      Icons.file_download,
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 4),
                    Text(
                      certificate.fileSize,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    Spacer(),
                    if (certificate.downloadCount > 0) ...[
                      Icon(
                        Icons.cloud_download,
                        size: 14,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${certificate.downloadCount} downloads',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ],
                ),

                SizedBox(height: 16),

                // Download Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: certificate.isAvailable
                        ? () {
                            // Handle download
                          }
                        : null,
                    icon: Icon(
                      certificate.isAvailable
                          ? Icons.download
                          : Icons.hourglass_empty,
                      size: 18,
                    ),
                    label: Text(
                      certificate.isAvailable
                          ? 'Download Certificate'
                          : 'Processing...',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: certificate.isAvailable
                          ? certificate.color
                          : Colors.grey[400],
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class CertificateItem {
  final String title;
  final String description;
  final DateTime issueDate;
  final String fileSize;
  final String type;
  final IconData icon;
  final Color color;
  final bool isAvailable;
  final int downloadCount;

  CertificateItem({
    required this.title,
    required this.description,
    required this.issueDate,
    required this.fileSize,
    required this.type,
    required this.icon,
    required this.color,
    required this.isAvailable,
    required this.downloadCount,
  });
}
