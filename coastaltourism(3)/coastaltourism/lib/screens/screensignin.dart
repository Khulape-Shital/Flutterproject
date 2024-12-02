import 'dart:ui';
import 'package:coastaltourism/screens/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:coastaltourism/screens/screen1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:coastaltourism/screens/services/firebase_service.dart';

class Screensignin extends StatefulWidget {
  const Screensignin({super.key});

  @override
  State<Screensignin> createState() => _HomeState();
}

class _HomeState extends State<Screensignin> with SingleTickerProviderStateMixin {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final FirebaseService _firebaseService = FirebaseService(); // Initialize FirebaseService

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    final String username = userNameController.text.trim();
    final String password = passwordController.text.trim();

    try {
      final isUser = await _firebaseService.signIn(username, password);

      if (isUser) {
        // User exists, navigate to welcome screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Screen1(
              title: "Welcome Back",
              username: username,
              password: password,
            ),
          ),
        );
      } else {
        // User does not exist, register new user
        await _firebaseService.register(username, password);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Screen1(
              title: "Welcome",
              username: username,
              password: password,
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred. Please try again."),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(color: Colors.transparent),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                height: 450,
                width: 300,
                decoration: BoxDecoration(
                 image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D"),
                fit: BoxFit.cover,
              ),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.white.withOpacity(0.8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: userNameController,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) => value!.isEmpty ? 'Enter username' : null,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) => value!.length < 6 ? 'Min 6 characters' : null,
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: _handleSignIn,
                      child: Text("Sign In "),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
