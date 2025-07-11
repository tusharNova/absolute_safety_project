import 'package:absolute_safety/screen/authentication/Registration.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/logo/logo.png",
                width: isMobile ? screenWidth * 0.25 : screenWidth * 0.15,
                height: isMobile ? screenWidth * 0.25 : screenWidth * 0.15,
              ),
              const SizedBox(height: 30),

              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400,
                ), // Max width for desktop
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ), // Rounded corners for the card
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: const Offset(0, 8), // Soft shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Welcoming Title
                      Text(
                        'Welcome Back!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Login to continue to your account.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 30),

                      // Email/Username Input
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email or Username',
                          hintText: 'Enter your email or username',
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.grey[600],
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),

                      // Password Input
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.grey[600],
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey[600],
                            ),
                            onPressed: () {
                              // TODO: Implement password visibility toggle
                            },
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 15),

                      // Forgot Password Link
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // TODO: Implement forgot password logic
                            print('Forgot Password?');
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Implement login logic
                          print('Login Button Pressed');
                        },
                        child: const Text('Login'),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Registration(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign Up',
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
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Widget for Social Login Buttons
class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
        textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        elevation: 5.0,
        shadowColor: color.withOpacity(0.3),
      ),
    );
  }
}
