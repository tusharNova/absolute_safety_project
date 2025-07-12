import 'package:flutter/material.dart';

class MachineInspectionRequestPage extends StatefulWidget {
  const MachineInspectionRequestPage({super.key});

  @override
  _MachineInspectionRequestPageState createState() =>
      _MachineInspectionRequestPageState();
}

class _MachineInspectionRequestPageState
    extends State<MachineInspectionRequestPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  // Form controllers
  final _machineNameController = TextEditingController();
  final _machineIdController = TextEditingController();
  // final _locationController = TextEditingController();
  // final _descriptionController = TextEditingController();
  // final _contactController = TextEditingController();

  // String? _selectedPriority = 'Medium';
  // String? _selectedDepartment = 'Production';
  // DateTime? _selectedDate;
  // TimeOfDay? _selectedTime;

  // final List<String> _priorities = ['Low', 'Medium', 'High', 'Critical'];
  // final List<String> _departments = [
  //   'Production',
  //   'Maintenance',
  //   'Quality',
  //   'Engineering',
  // ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1000),
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
    _machineNameController.dispose();
    _machineIdController.dispose();
    // _locationController.dispose();
    // _descriptionController.dispose();
    // _contactController.dispose();
    // _scrollController.dispose();
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
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMachineDetailsCard(),
                  SizedBox(height: 20),
                  // _buildScheduleCard(),
                  // SizedBox(height: 20),
                  // _buildPriorityCard(),
                  // SizedBox(height: 20),
                  // _buildDescriptionCard(),
                  // SizedBox(height: 20),
                  // _buildContactCard(),
                  // SizedBox(height: 30),
                  _buildSubmitButton(),
                  SizedBox(height: 20),
                ],
              ),
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
        'Machine Inspection',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
      ),
      centerTitle: true,
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.help_outline),
      //     onPressed: () {
      //       // Help functionality
      //     },
      //   ),
      // ],
    );
  }

  Widget _buildMachineDetailsCard() {
    return _buildCard(
      title: 'Machine Details',
      icon: Icons.precision_manufacturing,
      children: [
        _buildTextField(
          controller: _machineNameController,
          label: 'Machine Name',
          hint: 'Enter machine name',
          validator: (value) =>
              value?.isEmpty ?? true ? 'Please enter machine name' : null,
        ),
        SizedBox(height: 16),
        _buildTextField(
          controller: _machineIdController,
          label: 'Machine ID',
          hint: 'Enter machine ID',
          validator: (value) =>
              value?.isEmpty ?? true ? 'Please enter machine ID' : null,
        ),
        SizedBox(height: 16),
        // _buildTextField(
        //   controller: _locationController,
        //   label: 'Location',
        //   hint: 'Enter machine location',
        //   validator: (value) =>
        //       value?.isEmpty ?? true ? 'Please enter location' : null,
        // ),
        // SizedBox(height: 16),
        // _buildDropdown(
        //   value: _selectedDepartment,
        //   label: 'Department',
        //   items: _departments,
        //   onChanged: (value) => setState(() => _selectedDepartment = value),
        // ),
      ],
    );
  }

  // Widget _buildScheduleCard() {
  //   return _buildCard(
  //     title: 'Schedule',
  //     icon: Icons.schedule,
  //     children: [
  //       Row(
  //         children: [
  //           Expanded(child: _buildDateSelector()),
  //           SizedBox(width: 16),
  //           Expanded(child: _buildTimeSelector()),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildPriorityCard() {
  //   return _buildCard(
  //     title: 'Priority Level',
  //     icon: Icons.priority_high,
  //     children: [
  //       _buildDropdown(
  //         value: _selectedPriority,
  //         label: 'Priority',
  //         items: _priorities,
  //         onChanged: (value) => setState(() => _selectedPriority = value),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildDescriptionCard() {
  //   return _buildCard(
  //     title: 'Description',
  //     icon: Icons.description,
  //     children: [
  //       _buildTextField(
  //         controller: _descriptionController,
  //         label: 'Issue Description',
  //         hint: 'Describe the inspection requirements or issues',
  //         maxLines: 4,
  //         validator: (value) =>
  //             value?.isEmpty ?? true ? 'Please enter description' : null,
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildContactCard() {
  //   return _buildCard(
  //     title: 'Contact Information',
  //     icon: Icons.contact_phone,
  //     children: [
  //       _buildTextField(
  //         controller: _contactController,
  //         label: 'Contact Person',
  //         hint: 'Enter contact person name',
  //         validator: (value) =>
  //             value?.isEmpty ?? true ? 'Please enter contact person' : null,
  //       ),
  //     ],
  //   );
  // }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.blue[600], size: 24),
              SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ...children,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
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
        labelStyle: TextStyle(color: Colors.grey[600]),
        hintStyle: TextStyle(color: Colors.grey[400]),
      ),
    );
  }

  // Widget _buildDropdown({
  //   required String? value,
  //   required String label,
  //   required List<String> items,
  //   required void Function(String?) onChanged,
  // }) {
  //   return DropdownButtonFormField<String>(
  //     value: value,
  //     decoration: InputDecoration(
  //       labelText: label,
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: BorderSide(color: Colors.grey[300]!),
  //       ),
  //       enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: BorderSide(color: Colors.grey[300]!),
  //       ),
  //       focusedBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(12),
  //         borderSide: BorderSide(color: Colors.blue[600]!, width: 2),
  //       ),
  //       filled: true,
  //       fillColor: Colors.grey[50],
  //       labelStyle: TextStyle(color: Colors.grey[600]),
  //     ),
  //     items: items
  //         .map((item) => DropdownMenuItem(value: item, child: Text(item)))
  //         .toList(),
  //     onChanged: onChanged,
  //   );
  // }

  // Widget _buildDateSelector() {
  //   return InkWell(
  //     onTap: () async {
  //       final date = await showDatePicker(
  //         context: context,
  //         initialDate: DateTime.now(),
  //         firstDate: DateTime.now(),
  //         lastDate: DateTime.now().add(Duration(days: 90)),
  //       );
  //       if (date != null) {
  //         setState(() => _selectedDate = date);
  //       }
  //     },
  //     child: Container(
  //       padding: EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey[300]!),
  //         borderRadius: BorderRadius.circular(12),
  //         color: Colors.grey[50],
  //       ),
  //       child: Row(
  //         children: [
  //           Icon(Icons.calendar_today, color: Colors.grey[600], size: 20),
  //           SizedBox(width: 12),
  //           Expanded(
  //             child: Text(
  //               _selectedDate != null
  //                   ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
  //                   : 'Select Date',
  //               style: TextStyle(
  //                 color: _selectedDate != null
  //                     ? Colors.grey[800]
  //                     : Colors.grey[400],
  //                 fontSize: 16,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildTimeSelector() {
  //   return InkWell(
  //     onTap: () async {
  //       final time = await showTimePicker(
  //         context: context,
  //         initialTime: TimeOfDay.now(),
  //       );
  //       if (time != null) {
  //         setState(() => _selectedTime = time);
  //       }
  //     },
  //     child: Container(
  //       padding: EdgeInsets.all(16),
  //       decoration: BoxDecoration(
  //         border: Border.all(color: Colors.grey[300]!),
  //         borderRadius: BorderRadius.circular(12),
  //         color: Colors.grey[50],
  //       ),
  //       child: Row(
  //         children: [
  //           Icon(Icons.access_time, color: Colors.grey[600], size: 20),
  //           SizedBox(width: 12),
  //           Expanded(
  //             child: Text(
  //               _selectedTime != null
  //                   ? _selectedTime!.format(context)
  //                   : 'Select Time',
  //               style: TextStyle(
  //                 color: _selectedTime != null
  //                     ? Colors.grey[800]
  //                     : Colors.grey[400],
  //                 fontSize: 16,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue[600]!, Colors.blue[700]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: _submitRequest,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.send, color: Colors.white, size: 20),
            SizedBox(width: 12),
            Text(
              'Submit Request',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitRequest() {
    // if (_formKey.currentState?.validate() ?? false) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Modern Dialog",
      transitionDuration: Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.deepPurple,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Are you sure?",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Do you want to proceed with this action?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("Cancel"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            // Add your action logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text("Confirm"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(
            begin: Offset(0, 1),
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
    );

    // if (_selectedDate == null || _selectedTime == null) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Please select date and time'),
    //       backgroundColor: Colors.orange,
    //     ),
    //   );
    //   return;
    // }

    // Show success message
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('Inspection request submitted successfully!'),
    //     backgroundColor: Colors.green,
    //     behavior: SnackBarBehavior.floating,
    //   ),
    // );

    // Here you would typically submit the data to your backend
    // print('Submitting inspection request...');
    // print('Machine: ${_machineNameController.text}');
    // print('ID: ${_machineIdController.text}');
    // print('Location: ${_locationController.text}');
    // print('Department: $_selectedDepartment');
    // print('Priority: $_selectedPriority');
    // print('Date: $_selectedDate');
    // print('Time: $_selectedTime');
    // print('Description: ${_descriptionController.text}');
    // print('Contact: ${_contactController.text}');
    // }
  }
}
