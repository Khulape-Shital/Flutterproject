
import 'package:coastaltourism/screens/screensignin.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Start animation and navigate after a delay
    Future.delayed(Duration(seconds: 2), () {
      _controller.forward().then((_) => _navigateToSignInScreen(context));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToSignInScreen(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) => Screensignin(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeScaleTransition(
            animation: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 59, 126, 202),
              const Color.fromARGB(255, 1, 19, 39)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ScaleTransition(
            scale: Tween<double>(begin: 1.0, end: 2.0).animate(
              CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
            ),
            child: Text(
              'Travel',
              style: GoogleFonts.pacifico(
                fontSize: 45,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
