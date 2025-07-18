import 'dart:async';

import 'package:absolute_safety/reponsive/responsive.dart';
import 'package:absolute_safety/reponsive/sizedConfig.dart';
import 'package:absolute_safety/screen/authentication/login.dart';
import 'package:absolute_safety/style/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _backgroundController;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;
  late Animation<double> _backgroundAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _logoController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _textController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _backgroundController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    // Setup animations
    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );

    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeInOut),
    );

    _backgroundAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _backgroundController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
        );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      initLogic();
    });
  }

  Future<void> initLogic() async {
    // Start animations
    _backgroundController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _logoController.forward();
    await Future.delayed(Duration(milliseconds: 400));
    _textController.forward();

    // Navigate after delay
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: Duration(milliseconds: 500),
        ),
      );
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Sizeconfig.init(context);

    return Scaffold(
      body: AnimatedBuilder(
        animation: _backgroundAnimation,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 0.5, 1.0],
                colors: [
                  Color.lerp(
                    white,
                    navyBlue.withOpacity(0.1),
                    _backgroundAnimation.value,
                  )!,
                  Color.lerp(
                    white,
                    navyBlue.withOpacity(0.05),
                    _backgroundAnimation.value,
                  )!,
                  Color.lerp(
                    white,
                    Colors.blue.withOpacity(0.1),
                    _backgroundAnimation.value,
                  )!,
                ],
              ),
            ),
            child: Stack(
              children: [
                // Animated background circles
                ...List.generate(5, (index) {
                  return AnimatedBuilder(
                    animation: _backgroundAnimation,
                    builder: (context, child) {
                      return Positioned(
                        top: (index * 150.0) - 100,
                        right: (index * 80.0) - 200,
                        child: Opacity(
                          opacity: _backgroundAnimation.value * 0.1,
                          child: Container(
                            width: 200 + (index * 50.0),
                            height: 200 + (index * 50.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: navyBlue.withOpacity(0.1),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),

                // Main content
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo with animation
                      AnimatedBuilder(
                        animation: _logoAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _logoAnimation.value,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: navyBlue.withOpacity(
                                      0.2 * _logoAnimation.value,
                                    ),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                "assets/logo/logo.png",
                                width: Responsive.isMobile(context)
                                    ? Sizeconfig.ScreenWidth * 0.4
                                    : Sizeconfig.ScreenWidth * 0.025,
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 30),

                      // App name with slide animation
                      SlideTransition(
                        position: _slideAnimation,
                        child: AnimatedBuilder(
                          animation: _textAnimation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _textAnimation.value,
                              child: Column(
                                children: [
                                  Text(
                                    "Absolute Safety",
                                    style: GoogleFonts.poppins(
                                      color: navyBlue,
                                      fontSize: Responsive.isMobile(context)
                                          ? Sizeconfig.ScreenWidth * 0.06
                                          : Sizeconfig.ScreenWidth * 0.025,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Your Safety, Our Priority",
                                    style: GoogleFonts.poppins(
                                      color: navyBlue.withOpacity(0.7),
                                      fontSize: Responsive.isMobile(context)
                                          ? Sizeconfig.ScreenWidth * 0.035
                                          : Sizeconfig.ScreenWidth * 0.015,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 50),

                      // Loading indicator
                      AnimatedBuilder(
                        animation: _textAnimation,
                        builder: (context, child) {
                          return Opacity(
                            opacity: _textAnimation.value,
                            child: Container(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  navyBlue,
                                ),
                                strokeWidth: 3,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Version text at bottom
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: AnimatedBuilder(
                    animation: _textAnimation,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _textAnimation.value,
                        child: Center(
                          child: Text(
                            "Version 1.0.0",
                            style: GoogleFonts.poppins(
                              color: navyBlue.withOpacity(0.5),
                              fontSize: Responsive.isMobile(context)
                                  ? Sizeconfig.ScreenWidth * 0.025
                                  : Sizeconfig.ScreenWidth * 0.01,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
