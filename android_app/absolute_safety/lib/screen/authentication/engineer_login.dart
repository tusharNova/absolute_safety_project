// import 'package:absolute_safety/screen/authentication/Registration.dart';
// // import 'package:absolute_safety/screen/dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class EngineerLogin extends StatefulWidget {
//   const EngineerLogin({super.key});

//   @override
//   State<EngineerLogin> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<EngineerLogin>
//     with TickerProviderStateMixin {
//   late AnimationController _fadeController;
//   late AnimationController _slideController;
//   late Animation<double> _fadeAnimation;
//   late Animation<Offset> _slideAnimation;

//   bool _isPasswordVisible = false;
//   bool _isLoading = false;
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     _fadeController = AnimationController(
//       duration: const Duration(milliseconds: 1000),
//       vsync: this,
//     );

//     _slideController = AnimationController(
//       duration: const Duration(milliseconds: 800),
//       vsync: this,
//     );

//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
//     );

//     _slideAnimation =
//         Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
//           CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
//         );

//     // Start animations
//     _fadeController.forward();
//     Future.delayed(const Duration(milliseconds: 300), () {
//       _slideController.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _fadeController.dispose();
//     _slideController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isMobile = screenWidth < 600;

//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Colors.teal.shade50,
//               Colors.blue.shade50,
//               Colors.indigo.shade50,
//             ],
//           ),
//         ),
//         child: Stack(
//           children: [
//             // Background decoration
//             ...List.generate(6, (index) {
//               return Positioned(
//                 top: (index * 120.0) - 50,
//                 right: (index * 60.0) - 150,
//                 child: Container(
//                   width: 100 + (index * 30.0),
//                   height: 100 + (index * 30.0),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white.withOpacity(0.1),
//                   ),
//                 ),
//               );
//             }),

//             // Main content
//             Center(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(24.0),
//                 child: FadeTransition(
//                   opacity: _fadeAnimation,
//                   child: SlideTransition(
//                     position: _slideAnimation,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         // Logo section
//                         Container(
//                           padding: const EdgeInsets.all(20),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.teal.withOpacity(0.3),
//                                 blurRadius: 20,
//                                 spreadRadius: 5,
//                               ),
//                             ],
//                           ),
//                           child: Image.asset(
//                             "assets/logo/logo.png",
//                             width: isMobile
//                                 ? screenWidth * 0.2
//                                 : screenWidth * 0.1,
//                             height: isMobile
//                                 ? screenWidth * 0.2
//                                 : screenWidth * 0.1,
//                           ),
//                         ),
//                         const SizedBox(height: 10),

//                         ConstrainedBox(
//                           constraints: const BoxConstraints(maxWidth: 420),
//                           child: Container(
//                             padding: const EdgeInsets.all(32.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.95),
//                               borderRadius: BorderRadius.circular(24.0),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.1),
//                                   blurRadius: 30,
//                                   spreadRadius: 0,
//                                   offset: const Offset(0, 10),
//                                 ),
//                               ],
//                               border: Border.all(
//                                 color: Colors.white.withOpacity(0.2),
//                                 width: 1,
//                               ),
//                             ),
//                             child: Form(
//                               key: _formKey,
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                                 children: <Widget>[
//                                   // Welcome title
//                                   Text(
//                                     'Welcome Back!',
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.poppins(
//                                       fontSize: isMobile ? 28 : 32,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.grey[800],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Text(
//                                     'Please sign in to your account',
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 16,
//                                       color: Colors.grey[600],
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 40),

//                                   // Email field
//                                   _buildModernTextField(
//                                     controller: _emailController,
//                                     label: 'Email',
//                                     hint: 'Enter your email',
//                                     icon: Icons.email_outlined,
//                                     keyboardType: TextInputType.emailAddress,
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter your email';
//                                       }
//                                       if (!RegExp(
//                                         r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
//                                       ).hasMatch(value)) {
//                                         return 'Please enter a valid email';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   const SizedBox(height: 20),

//                                   // Password field
//                                   _buildModernTextField(
//                                     controller: _passwordController,
//                                     label: 'Password',
//                                     hint: 'Enter your password',
//                                     icon: Icons.lock_outline,
//                                     obscureText: !_isPasswordVisible,
//                                     suffixIcon: IconButton(
//                                       icon: Icon(
//                                         _isPasswordVisible
//                                             ? Icons.visibility_outlined
//                                             : Icons.visibility_off_outlined,
//                                         color: Colors.grey[600],
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           _isPasswordVisible =
//                                               !_isPasswordVisible;
//                                         });
//                                       },
//                                     ),
//                                     validator: (value) {
//                                       if (value == null || value.isEmpty) {
//                                         return 'Please enter your password';
//                                       }
//                                       if (value.length < 6) {
//                                         return 'Password must be at least 6 characters';
//                                       }
//                                       return null;
//                                     },
//                                   ),
//                                   const SizedBox(height: 15),

//                                   // Forgot password
//                                   Align(
//                                     alignment: Alignment.centerRight,
//                                     child: TextButton(
//                                       onPressed: () {
//                                         // TODO: Implement forgot password
//                                         print('Forgot Password?');
//                                       },
//                                       child: Text(
//                                         'Forgot Password?',
//                                         style: GoogleFonts.poppins(
//                                           color: Colors.teal,
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 30),

//                                   // Login button
//                                   _buildModernButton(
//                                     text: 'Sign In',
//                                     onPressed: _handleLogin,
//                                     isLoading: _isLoading,
//                                   ),
//                                   const SizedBox(height: 20),

//                                   Divider(),

//                                   // Sign up link
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Don't have an account? ",
//                                         style: GoogleFonts.poppins(
//                                           color: Colors.grey[700],
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const Registration(),
//                                             ),
//                                           );
//                                         },
//                                         child: Text(
//                                           'Sign Up',
//                                           style: GoogleFonts.poppins(
//                                             color: Colors.teal,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 14,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildModernTextField({
//     required TextEditingController controller,
//     required String label,
//     required String hint,
//     required IconData icon,
//     TextInputType keyboardType = TextInputType.text,
//     bool obscureText = false,
//     Widget? suffixIcon,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       validator: validator,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       style: GoogleFonts.poppins(fontSize: 16),
//       decoration: InputDecoration(
//         labelText: label,
//         hintText: hint,
//         prefixIcon: Icon(icon, color: Colors.teal),
//         suffixIcon: suffixIcon,
//         labelStyle: GoogleFonts.poppins(color: Colors.grey[600]),
//         hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
//         filled: true,
//         fillColor: Colors.grey[50],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.grey[300]!),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide(color: Colors.grey[300]!),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.teal, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.red, width: 2),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.red, width: 2),
//         ),
//       ),
//     );
//   }

//   Widget _buildModernButton({
//     required String text,
//     required VoidCallback onPressed,
//     bool isLoading = false,
//   }) {
//     return Container(
//       height: 56,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Colors.teal, Colors.tealAccent],
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ),
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.teal.withOpacity(0.3),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: ElevatedButton(
//         onPressed: isLoading ? null : onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//         child: isLoading
//             ? const SizedBox(
//                 width: 20,
//                 height: 20,
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                   strokeWidth: 2,
//                 ),
//               )
//             : Text(
//                 text,
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//       ),
//     );
//   }

//   Widget _buildSocialButton({
//     required IconData icon,
//     required String label,
//     required Color color,
//     required VoidCallback onPressed,
//   }) {
//     return Container(
//       height: 48,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey[300]!),
//       ),
//       child: ElevatedButton.icon(
//         onPressed: onPressed,
//         icon: Icon(icon, color: color, size: 20),
//         label: Text(
//           label,
//           style: GoogleFonts.poppins(
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//             color: Colors.grey[700],
//           ),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           shadowColor: Colors.transparent,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _handleLogin() async {
//     // if (_formKey.currentState!.validate()) {
//     setState(() {
//       _isLoading = true;
//     });

//     // Simulate login process
//     await Future.delayed(const Duration(seconds: 2));

//     setState(() {
//       _isLoading = false;
//     });

//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(builder: (context) => DashboardScreen()),
//     // );

//     // TODO: Implement actual login logic
//     print('Login: ${_emailController.text}, ${_passwordController.text}');
//     // }
//   }
// }

import 'package:absolute_safety/screen/authentication/Registration.dart';
import 'package:absolute_safety/screen/engineer/engineer_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EngineerLogin extends StatefulWidget {
  const EngineerLogin({super.key});

  @override
  State<EngineerLogin> createState() => _EngineerLoginState();
}

class _EngineerLoginState extends State<EngineerLogin>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _logoController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _logoAnimation;

  bool _isPasswordVisible = false;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.elasticOut),
        );

    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.bounceOut),
    );

    // Start animations
    _logoController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _fadeController.forward();
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _logoController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 600;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF2E8B57), // Sea Green
              const Color(0xFF1E6B3F), // Dark Green
              const Color(0xFF006B3F), // Emerald Green
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Background decorative elements
            ...List.generate(8, (index) {
              return Positioned(
                top: (index * 120.0) - 50,
                right: (index * 80.0) - 200,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 800 + (index * 100)),
                  width: 80 + (index * 20.0),
                  height: 80 + (index * 20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.05),
                  ),
                ),
              );
            }),

            // Technical pattern overlay
            ...List.generate(4, (index) {
              return Positioned(
                top: (index * 200.0) + 100,
                left: (index * 150.0) - 100,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white.withOpacity(0.1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.settings,
                    color: Colors.white.withOpacity(0.05),
                    size: 30,
                  ),
                ),
              );
            }),

            // Back button
            // Positioned(
            //   top: MediaQuery.of(context).padding.top + 16,
            //   left: 16,
            //   child: FadeTransition(
            //     opacity: _fadeAnimation,
            //     child: Material(
            //       color: Colors.transparent,
            //       child: InkWell(
            //         onTap: () => Navigator.pop(context),
            //         borderRadius: BorderRadius.circular(12),
            //         child: Container(
            //           padding: const EdgeInsets.all(12),
            //           decoration: BoxDecoration(
            //             color: Colors.white.withOpacity(0.15),
            //             borderRadius: BorderRadius.circular(12),
            //             border: Border.all(
            //               color: Colors.white.withOpacity(0.2),
            //             ),
            //           ),
            //           child: const Icon(
            //             Icons.arrow_back_ios_new,
            //             color: Colors.white,
            //             size: 20,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

            // Main content
            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24.0 : 48.0,
                  vertical: 32.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Logo section with engineering theme
                    ScaleTransition(
                      scale: _logoAnimation,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.15),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                "assets/logo/logo.png",
                                width: isMobile ? 80 : 100,
                                height: isMobile ? 80 : 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Engineering icon overlay
                            Positioned(
                              bottom: -5,
                              right: -5,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2E8B57),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.engineering,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Welcome section
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        children: [
                          Text(
                            'Engineer Dashboard',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 28 : 34,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(0, 2),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Manage safety protocols & technical data',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Login form
                    SlideTransition(
                      position: _slideAnimation,
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 420),
                          child: Container(
                            padding: const EdgeInsets.all(32.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.95),
                              borderRadius: BorderRadius.circular(24.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 30,
                                  spreadRadius: 0,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                                width: 1,
                              ),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  // Welcome title with engineering badge
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     Container(
                                  //       padding: const EdgeInsets.symmetric(
                                  //         horizontal: 12,
                                  //         vertical: 6,
                                  //       ),
                                  //       decoration: BoxDecoration(
                                  //         color: const Color(
                                  //           0xFF2E8B57,
                                  //         ).withOpacity(0.1),
                                  //         borderRadius: BorderRadius.circular(
                                  //           20,
                                  //         ),
                                  //         border: Border.all(
                                  //           color: const Color(
                                  //             0xFF2E8B57,
                                  //           ).withOpacity(0.3),
                                  //         ),
                                  //       ),
                                  //       child: Row(
                                  //         mainAxisSize: MainAxisSize.min,
                                  //         children: [
                                  //           Icon(
                                  //             Icons.verified_user,
                                  //             color: const Color(0xFF2E8B57),
                                  //             size: 16,
                                  //           ),
                                  //           const SizedBox(width: 6),
                                  //           Text(
                                  //             'ENGINEER ACCESS',
                                  //             style: GoogleFonts.poppins(
                                  //               fontSize: 12,
                                  //               fontWeight: FontWeight.w600,
                                  //               color: const Color(0xFF2E8B57),
                                  //               letterSpacing: 0.5,
                                  //             ),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // const SizedBox(height: 20),
                                  Text(
                                    'Welcome Back!',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: isMobile ? 24 : 28,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF2D3748),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Access your engineering dashboard',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 32),

                                  // Employee ID / Email field
                                  _buildModernTextField(
                                    controller: _emailController,
                                    label: 'Employee ID / Email',
                                    hint: 'Enter your credentials',
                                    icon: Icons.badge_outlined,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your credentials';
                                      }
                                      // Allow both email and employee ID formats
                                      if (!RegExp(
                                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                          ).hasMatch(value) &&
                                          !RegExp(
                                            r'^[A-Z]{2,3}\d{4,6}$',
                                          ).hasMatch(value.toUpperCase())) {
                                        return 'Enter valid email or employee ID (e.g., ENG001234)';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),

                                  // Password field
                                  _buildModernTextField(
                                    controller: _passwordController,
                                    label: 'Security Password',
                                    hint: 'Enter your secure password',
                                    icon: Icons.security_outlined,
                                    obscureText: !_isPasswordVisible,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isPasswordVisible
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0xFF2E8B57),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
                                        });
                                      },
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      if (value.length < 8) {
                                        return 'Password must be at least 8 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 15),

                                  // Security notice
                                  // Container(
                                  //   padding: const EdgeInsets.all(12),
                                  //   decoration: BoxDecoration(
                                  //     color: Colors.amber.withOpacity(0.1),
                                  //     borderRadius: BorderRadius.circular(8),
                                  //     border: Border.all(
                                  //       color: Colors.amber.withOpacity(0.3),
                                  //     ),
                                  //   ),
                                  //   child: Row(
                                  //     children: [
                                  //       Icon(
                                  //         Icons.info_outline,
                                  //         color: Colors.amber[700],
                                  //         size: 18,
                                  //       ),
                                  //       const SizedBox(width: 8),
                                  //       Expanded(
                                  //         child: Text(
                                  //           'Authorized personnel only. All access is logged.',
                                  //           style: GoogleFonts.poppins(
                                  //             fontSize: 12,
                                  //             color: Colors.amber[700],
                                  //             fontWeight: FontWeight.w500,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // const SizedBox(height: 15),

                                  // Forgot password
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      onPressed: () {
                                        // TODO: Implement forgot password for engineers
                                        print('Engineer Password Reset');
                                      },
                                      child: Text(
                                        'Reset Credentials?',
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xFF2E8B57),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),

                                  // Login button
                                  _buildModernButton(
                                    text: 'Access Dashboard',
                                    onPressed: _handleLogin,
                                    isLoading: _isLoading,
                                  ),
                                  // const SizedBox(height: 24),

                                  // // Divider
                                  // Row(
                                  //   children: [
                                  //     Expanded(
                                  //       child: Divider(color: Colors.grey[300]),
                                  //     ),
                                  //     Padding(
                                  //       padding: const EdgeInsets.symmetric(
                                  //         horizontal: 16,
                                  //       ),
                                  //       child: Text(
                                  //         'or',
                                  //         style: GoogleFonts.poppins(
                                  //           color: Colors.grey[500],
                                  //           fontSize: 14,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //     Expanded(
                                  //       child: Divider(color: Colors.grey[300]),
                                  //     ),
                                  //   ],
                                  // ),
                                  // const SizedBox(height: 24),

                                  // Sign up link
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  //   children: [
                                  //     Text(
                                  //       "Need engineer access? ",
                                  //       style: GoogleFonts.poppins(
                                  //         color: Colors.grey[700],
                                  //         fontSize: 14,
                                  //       ),
                                  //     ),
                                  //     GestureDetector(
                                  //       onTap: () {
                                  //         Navigator.push(
                                  //           context,
                                  //           MaterialPageRoute(
                                  //             builder: (context) =>
                                  //                 const Registration(),
                                  //           ),
                                  //         );
                                  //       },
                                  //       child: Text(
                                  //         'Request Access',
                                  //         style: GoogleFonts.poppins(
                                  //           color: const Color(0xFF2E8B57),
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 14,
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Footer
                    // FadeTransition(
                    //   opacity: _fadeAnimation,
                    //   child: Text(
                    //     "Secure • Professional • Technical",
                    //     style: GoogleFonts.poppins(
                    //       fontSize: 12,
                    //       color: Colors.white.withOpacity(0.7),
                    //       fontWeight: FontWeight.w300,
                    //       letterSpacing: 1.2,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModernTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: GoogleFonts.poppins(fontSize: 16, color: const Color(0xFF2D3748)),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF2E8B57), size: 22),
        suffixIcon: suffixIcon,
        labelStyle: GoogleFonts.poppins(color: Colors.grey[600], fontSize: 14),
        hintStyle: GoogleFonts.poppins(color: Colors.grey[400], fontSize: 14),
        filled: true,
        fillColor: const Color(0xFFF7FAFC),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
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
          borderSide: const BorderSide(color: Color(0xFF2E8B57), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  Widget _buildModernButton({
    required String text,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E8B57), Color(0xFF228B22)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2E8B57).withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.security, color: Colors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _handleLogin() async {
    // if (_formKey.currentState!.validate()) {
    setState(() {
      _isLoading = true;
    });

    // Simulate login process
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // TODO: Navigate to engineer dashboard
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => EngineerDashboard()),
    );

    print(
      'Engineer Login: ${_emailController.text}, ${_passwordController.text}',
    );
    // }
  }
}
