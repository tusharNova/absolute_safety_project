import 'package:absolute_safety/screen/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:absolute_safety/style/color.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 2));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration Submitted Successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0f7fa), Color(0xFFffffff)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Icon(
                        Icons.security_rounded,
                        size: 80,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Create Your Account',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: navyBlue,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Make your machine safe with Absolute Safety',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          color: darkGrey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildTextField(
                              controller: _nameController,
                              label: 'Full Name',
                              icon: Icons.person_outline,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your full name'
                                  : null,
                            ),
                            _buildTextField(
                              controller: _contactController,
                              label: 'Contact Number',
                              icon: Icons.phone,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your contact number';
                                }
                                if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
                                  return 'Please enter a valid contact number';
                                }
                                return null;
                              },
                            ),
                            _buildTextField(
                              controller: _emailController,
                              label: 'Email Address',
                              icon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(
                                  r'^[^@]+@[^@]+\.[^@]+',
                                ).hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            _buildTextField(
                              controller: _passwordController,
                              label: 'Password',
                              icon: Icons.lock_outline,
                              validator: (value) => value!.isEmpty
                                  ? 'Please enter your password'
                                  : null,
                              password: true,
                              isPasswordVisible: _isPasswordVisible,
                              togglePasswordVisibility:
                                  _togglePasswordVisibility,
                            ),
                            _buildTextField(
                              controller: _confirmPasswordController,
                              label: 'Confirm Password',
                              icon: Icons.lock_outline,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              password: true,
                              isPasswordVisible: _isConfirmPasswordVisible,
                              togglePasswordVisibility:
                                  _toggleConfirmPasswordVisibility,
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: navyBlue,
                                ),
                                onPressed: _submitForm,
                                child: const Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 1.2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already Account!",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'LogIn',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    int maxLines = 1,
    bool password = false,
    bool isPasswordVisible = false,
    VoidCallback? togglePasswordVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: password && !isPasswordVisible,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: navyBlue),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.grey.shade100,
          suffixIcon: password
              ? IconButton(
                  onPressed: togglePasswordVisibility,
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }
}
