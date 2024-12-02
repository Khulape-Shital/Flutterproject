import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coastaltourism/screens/screenlogin.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Hashes the password for security
  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  /// Registers a new user and sends a verification email
  Future<void> register(String username, String password, String email) async {
    try {
      final passwordHash = _hashPassword(password);

      // Register in Firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Send email verification
        await user.sendEmailVerification();

        // Save user details in Firestore
        await _firestore.collection('users').add({
          'username': username,
          'password': passwordHash,
          'email': email,
        });
      }
    } catch (e) {
      // Log error for debugging
      print("Failed to register user: $e");
      throw FirebaseAuthException(
          code: 'REGISTRATION_ERROR', message: 'Registration failed. Try again.');
    }
  }

  /// Signs in the user by checking credentials in Firestore
  Future<bool> signIn(String username, String password) async {
    final passwordHash = _hashPassword(password);

    try {
      final querySnapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: passwordHash)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Failed to sign in: $e");
      throw FirebaseAuthException(
          code: 'SIGNIN_ERROR', message: 'Sign-in failed. Please try again.');
    }
  }
}

class Screensignin extends StatefulWidget {
  const Screensignin({super.key});

  @override
  State<Screensignin> createState() => _ScreensigninState();
}
class _ScreensigninState extends State<Screensignin> {
  final FirebaseService _firebaseService = FirebaseService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  /// Handles user sign-in or registration
  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) return;

    final String email = emailController.text.trim();
    final String username = userNameController.text.trim();
    final String password = passwordController.text.trim();

    try {
      final isUser = await _firebaseService.signIn(username, password);

      if (isUser) {
        // Check if the user has verified their email
        final User? currentUser = _firebaseService._auth.currentUser;

        if (currentUser != null) {
          await currentUser.reload(); // Refresh user data
          if (currentUser.emailVerified) {
            // Navigate to the next screen if email is verified
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Welcome Back! Email verified.")),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Screenlogin()),
            );
          } else {
            // Email not verified
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Email not verified. Please verify."),
                    TextButton(
                      onPressed: () async {
                        await currentUser.sendEmailVerification();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Verification email resent!")),
                        );
                      },
                      child: const Text("Resend", style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ),
            );
          }
        }
      } else {
        // User doesn't exist, register them
        await _firebaseService.register(username, password, email);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  "Registration successful! A verification email has been sent.")),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Authentication error")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An unexpected error occurred. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image with blur effect
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3",
                ),
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
                height: 600,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white.withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Email Field
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 12),

                    // Username Field
                    TextFormField(
                      controller: userNameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                      validator: (value) =>
                          value!.isEmpty ? 'Enter username' : null,
                    ),
                    const SizedBox(height: 12),

                    // Password Field
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                      validator: (value) => value!.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                    ),
                    const SizedBox(height: 12),

                    // Confirm Password Field
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: !_isPasswordVisible,
                      decoration: const InputDecoration(
                        labelText: 'Confirm Password',
                      ),
                      validator: (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Sign In Button
                    ElevatedButton(
                      onPressed: _handleSignIn,
                      child: const Text("Registre"),
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
