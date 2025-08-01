import 'package:absolute_safety/reponsive/responsive.dart';
import 'package:absolute_safety/reponsive/sizedConfig.dart';
import 'package:absolute_safety/screen/authentication/client_login.dart';
import 'package:absolute_safety/screen/authentication/engineer_login.dart';
import 'package:flutter/material.dart';

class DirectionPage extends StatefulWidget {
  const DirectionPage({super.key});

  @override
  State<DirectionPage> createState() => _DirectionPageState();
}

class _DirectionPageState extends State<DirectionPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

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

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.elasticOut),
        );

    // Start animations
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Sizeconfig.init(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF667eea),
              const Color(0xFF764ba2),
              const Color(0xFF6B73FF),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.isMobile(context) ? 24.0 : 48.0,
              vertical: 32.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Section
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 60),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/logo/logo.png",
                        width: Responsive.isMobile(context)
                            ? Sizeconfig.ScreenWidth * 0.35
                            : Sizeconfig.ScreenWidth * 0.25,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),

                // Title Section
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Column(
                    children: [
                      Text(
                        "Welcome to Absolute Safety",
                        style: TextStyle(
                          fontSize: Responsive.isMobile(context) ? 28 : 36,
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
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Choose your role to continue",
                        style: TextStyle(
                          fontSize: Responsive.isMobile(context) ? 16 : 18,
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Buttons Section
                SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Responsive.isMobile(context)
                        ? _buildMobileButtons()
                        : _buildDesktopButtons(),
                  ),
                ),

                const SizedBox(height: 40),

                // Footer Text
                // FadeTransition(
                //   opacity: _fadeAnimation,
                //   child: Text(
                //     "Secure • Reliable • Professional",
                //     style: TextStyle(
                //       fontSize: 14,
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
      ),
    );
  }

  Widget _buildMobileButtons() {
    return Column(
      children: [
        _buildModernButton(
          title: "Client",
          subtitle: "Access safety reports & updates",
          icon: Icons.person_outline,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClientLogin()),
            );
          },
        ),
        const SizedBox(height: 20),
        _buildModernButton(
          title: "Engineer",
          subtitle: "Manage safety protocols & data",
          icon: Icons.engineering_outlined,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EngineerLogin()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDesktopButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildModernButton(
          title: "Client",
          subtitle: "Access safety reports & updates",
          icon: Icons.person_outline,
          onPressed: () {
            // Handle client navigation
          },
        ),
        const SizedBox(width: 40),
        _buildModernButton(
          title: "Engineer",
          subtitle: "Manage safety protocols & data",
          icon: Icons.engineering_outlined,
          onPressed: () {
            // Handle engineer navigation
          },
        ),
      ],
    );
  }

  Widget _buildModernButton({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(16),
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: Responsive.isMobile(context) ? double.infinity : 280,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0.1),
              ],
            ),
            border: Border.all(color: Colors.white.withOpacity(0.3), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: Colors.white),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
