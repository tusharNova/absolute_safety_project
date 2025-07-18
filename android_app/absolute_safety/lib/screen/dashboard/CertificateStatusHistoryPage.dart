import 'package:flutter/material.dart';

class CertificateStatusHistoryPage extends StatefulWidget {
  const CertificateStatusHistoryPage({super.key});

  @override
  _CertificateStatusHistoryPageState createState() =>
      _CertificateStatusHistoryPageState();
}

class _CertificateStatusHistoryPageState
    extends State<CertificateStatusHistoryPage>
    with TickerProviderStateMixin {
  final _scrollController = ScrollController();
  late AnimationController _animationController;
  late AnimationController _listAnimationController = AnimationController(
    vsync: this,
  );
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  String _selectedFilter = 'All';
  String _selectedSort = 'Date';
  final List<String> _filterOptions = [
    'All',
    'Active',
    'Expired',
    'Pending',
    'Suspended',
  ];
  final List<String> _sortOptions = ['Date', 'Status', 'Type', 'Expiry'];

  // Mock data for demonstration
  final List<CertificateRecord> _allCertificates = [
    CertificateRecord(
      id: 'CERT-2024-001',
      type: 'ISO 9001',
      holderName: 'TechCorp Industries',
      issueDate: DateTime(2024, 1, 15),
      expiryDate: DateTime(2027, 1, 15),
      status: 'Active',
      issuingBody: 'International Certification Board',
      description: 'Quality Management System Certification',
      validityPeriod: '3 years',
    ),
    CertificateRecord(
      id: 'CERT-2024-002',
      type: 'ISO 14001',
      holderName: 'EcoSolutions Ltd',
      issueDate: DateTime(2024, 2, 20),
      expiryDate: DateTime(2027, 2, 20),
      status: 'Active',
      issuingBody: 'Environmental Standards Authority',
      description: 'Environmental Management System Certification',
      validityPeriod: '3 years',
    ),
    CertificateRecord(
      id: 'CERT-2024-003',
      type: 'ISO 45001',
      holderName: 'SafeWork Corp',
      issueDate: DateTime(2024, 3, 10),
      expiryDate: DateTime(2025, 3, 10),
      status: 'Pending',
      issuingBody: 'Safety Standards Institute',
      description: 'Occupational Health and Safety Management Systems',
      validityPeriod: '1 year',
    ),
    CertificateRecord(
      id: 'CERT-2023-089',
      type: 'ISO 9001',
      holderName: 'TechCorp Industries',
      issueDate: DateTime(2023, 6, 15),
      expiryDate: DateTime(2024, 6, 15),
      status: 'Expired',
      issuingBody: 'International Certification Board',
      description: 'Previous Quality Management System Certification',
      validityPeriod: '1 year',
    ),
    CertificateRecord(
      id: 'CERT-2023-045',
      type: 'ISO 27001',
      holderName: 'SecureData Inc',
      issueDate: DateTime(2023, 8, 5),
      expiryDate: DateTime(2024, 12, 5),
      status: 'Suspended',
      issuingBody: 'Information Security Board',
      description: 'Information Security Management System',
      validityPeriod: '16 months',
    ),
    CertificateRecord(
      id: 'CERT-2024-004',
      type: 'ISO 22000',
      holderName: 'FoodSafe Manufacturing',
      issueDate: DateTime(2024, 4, 12),
      expiryDate: DateTime(2027, 4, 12),
      status: 'Active',
      issuingBody: 'Food Safety Authority',
      description: 'Food Safety Management System Certification',
      validityPeriod: '3 years',
    ),
  ];

  List<CertificateRecord> get _filteredCertificates {
    List<CertificateRecord> filtered = _allCertificates;

    if (_selectedFilter != 'All') {
      filtered = filtered
          .where((cert) => cert.status == _selectedFilter)
          .toList();
    }

    // Sort certificates
    switch (_selectedSort) {
      case 'Date':
        filtered.sort((a, b) => b.issueDate.compareTo(a.issueDate));
        break;
      case 'Status':
        filtered.sort((a, b) => a.status.compareTo(b.status));
        break;
      case 'Type':
        filtered.sort((a, b) => a.type.compareTo(b.type));
        break;
      case 'Expiry':
        filtered.sort((a, b) => a.expiryDate.compareTo(b.expiryDate));
        break;
    }

    return filtered;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _listAnimationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0.0, 0.1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutBack,
          ),
        );

    _animationController.forward();
    _listAnimationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _listAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: RefreshIndicator(
            onRefresh: _refreshCertificates,
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // _buildHeaderSection(),
                        SizedBox(height: 20),
                        _buildStatsSection(),
                        SizedBox(height: 20),
                        _buildFilterSection(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                _buildCertificatesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.grey[800],
      title: Text(
        'Certificate Status & History',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      centerTitle: true,
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.search),
      //     onPressed: () {
      //       // Search functionality
      //     },
      //   ),
      //   PopupMenuButton<String>(
      //     icon: Icon(Icons.more_vert),
      //     onSelected: (value) {
      //       switch (value) {
      //         case 'export':
      //           _exportCertificates();
      //           break;
      //         case 'refresh':
      //           _refreshCertificates();
      //           break;
      //       }
      //     },
      //     itemBuilder: (context) => [
      //       PopupMenuItem(
      //         value: 'export',
      //         child: Row(
      //           children: [
      //             Icon(Icons.download, size: 20),
      //             SizedBox(width: 12),
      //             Text('Export List'),
      //           ],
      //         ),
      //       ),
      //       PopupMenuItem(
      //         value: 'refresh',
      //         child: Row(
      //           children: [
      //             Icon(Icons.refresh, size: 20),
      //             SizedBox(width: 12),
      //             Text('Refresh'),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ],
    );
  }

  // Widget _buildHeaderSection() {
  //   return Container(
  //     padding: EdgeInsets.all(24),
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         colors: [Colors.blue[50]!, Colors.white],
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //       ),
  //       borderRadius: BorderRadius.circular(20),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.grey.withOpacity(0.1),
  //           blurRadius: 15,
  //           offset: Offset(0, 5),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       children: [
  //         Container(
  //           padding: EdgeInsets.all(16),
  //           decoration: BoxDecoration(
  //             color: Colors.blue[100],
  //             borderRadius: BorderRadius.circular(16),
  //           ),
  //           child: Icon(Icons.verified_user, size: 32, color: Colors.blue[700]),
  //         ),
  //         SizedBox(width: 20),
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'Certificate Registry',
  //                 style: TextStyle(
  //                   fontSize: 24,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.grey[800],
  //                 ),
  //               ),
  //               SizedBox(height: 4),
  //               Text(
  //                 'Complete overview of all certificates and their current status',
  //                 style: TextStyle(fontSize: 14, color: Colors.grey[600]),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildStatsSection() {
    final activeCount = _allCertificates
        .where((c) => c.status == 'Active')
        .length;
    final expiredCount = _allCertificates
        .where((c) => c.status == 'Expired')
        .length;
    final pendingCount = _allCertificates
        .where((c) => c.status == 'Pending')
        .length;
    // final suspendedCount = _allCertificates
    //     .where((c) => c.status == 'Suspended')
    //     .length;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total',
                  _allCertificates.length,
                  Colors.blue,
                  Icons.library_books,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Active',
                  activeCount,
                  Colors.green,
                  Icons.check_circle,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Expired',
                  expiredCount,
                  Colors.red,
                  Icons.cancel,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Pending',
                  pendingCount,
                  Colors.orange,
                  Icons.pending,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, int count, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          SizedBox(height: 8),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filter & Sort',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildFilterDropdown(
                  'Status',
                  _selectedFilter,
                  _filterOptions,
                  (value) => setState(() => _selectedFilter = value!),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildFilterDropdown(
                  'Sort by',
                  _selectedSort,
                  _sortOptions,
                  (value) => setState(() => _selectedSort = value!),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown(
    String label,
    String value,
    List<String> options,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blue[600]!, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey[50],
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          items: options
              .map(
                (option) =>
                    DropdownMenuItem(value: option, child: Text(option)),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildCertificatesList() {
    final certificates = _filteredCertificates;

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final certificate = certificates[index];
        return AnimatedBuilder(
          animation: _listAnimationController,
          builder: (context, child) {
            final animationValue = Curves.easeOutBack.transform(
              (_listAnimationController.value - (index * 0.1)).clamp(0.0, 1.0),
            );
            return Transform.translate(
              offset: Offset(0, 50 * (1 - animationValue)),
              child: Opacity(
                opacity: 1,
                child: _buildCertificateCard(certificate, index),
              ),
            );
          },
        );
      }, childCount: certificates.length),
    );
  }

  Widget _buildCertificateCard(CertificateRecord certificate, int index) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            _buildCertificateHeader(certificate),
            _buildCertificateBody(certificate),
            _buildCertificateFooter(certificate),
          ],
        ),
      ),
    );
  }

  Widget _buildCertificateHeader(CertificateRecord certificate) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _getStatusColor(certificate.status).withOpacity(0.1),
            _getStatusColor(certificate.status).withOpacity(0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _getStatusColor(certificate.status).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getStatusIcon(certificate.status),
              color: _getStatusColor(certificate.status),
              size: 24,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  certificate.id,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  certificate.type,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          _buildStatusBadge(certificate.status),
        ],
      ),
    );
  }

  Widget _buildCertificateBody(CertificateRecord certificate) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(
            Icons.business,
            'Certificate Holder',
            certificate.holderName,
          ),
          SizedBox(height: 12),
          _buildInfoRow(
            Icons.account_balance,
            'Issuing Body',
            certificate.issuingBody,
          ),
          SizedBox(height: 12),
          _buildInfoRow(
            Icons.description,
            'Description',
            certificate.description,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildDateInfo(
                  'Issue Date',
                  certificate.issueDate,
                  Icons.calendar_today,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildDateInfo(
                  'Expiry Date',
                  certificate.expiryDate,
                  Icons.event,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey[500]),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateInfo(String label, DateTime date, IconData icon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: Colors.grey[600]),
              SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(
            _formatDate(date),
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificateFooter(CertificateRecord certificate) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _viewCertificate(certificate),
              icon: Icon(Icons.visibility, size: 18),
              label: Text('View Details'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue[600],
                side: BorderSide(color: Colors.blue[600]!),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => _downloadCertificate(certificate),
              icon: Icon(Icons.download, size: 18),
              label: Text('Download'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _getStatusColor(status),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'expired':
        return Colors.red;
      case 'pending':
        return Colors.orange;
      case 'suspended':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Icons.check_circle;
      case 'expired':
        return Icons.cancel;
      case 'pending':
        return Icons.pending;
      case 'suspended':
        return Icons.pause_circle;
      default:
        return Icons.verified;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _refreshCertificates() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      // Refresh logic here
    });
  }

  void _exportCertificates() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Exporting certificates list...'),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _viewCertificate(CertificateRecord certificate) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Certificate Details'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Certificate ID: ${certificate.id}'),
            Text('Type: ${certificate.type}'),
            Text('Status: ${certificate.status}'),
            Text('Holder: ${certificate.holderName}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _downloadCertificate(CertificateRecord certificate) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading certificate: ${certificate.id}'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class CertificateRecord {
  final String id;
  final String type;
  final String holderName;
  final DateTime issueDate;
  final DateTime expiryDate;
  final String status;
  final String issuingBody;
  final String description;
  final String validityPeriod;

  CertificateRecord({
    required this.id,
    required this.type,
    required this.holderName,
    required this.issueDate,
    required this.expiryDate,
    required this.status,
    required this.issuingBody,
    required this.description,
    required this.validityPeriod,
  });
}

// Usage in main.dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Certificate Status & History',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CertificateStatusHistoryPage(),
    );
  }
}
