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

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initLogic();
    });
  }

  Future<void> initLogic() async {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Sizeconfig.init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo/logo.png",
              width: Responsive.isMobile(context)
                  ? Sizeconfig.ScreenWidth * 0.5
                  : Sizeconfig.ScreenWidth * 0.03,
            ),
            SizedBox(height: 10),
            Text(
              "Absolute Safety",
              style: GoogleFonts.poppins(
                color: navyBlue,
                fontSize: Responsive.isMobile(context)
                    ? Sizeconfig.ScreenWidth * 0.05
                    : Sizeconfig.ScreenWidth * 0.02,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
