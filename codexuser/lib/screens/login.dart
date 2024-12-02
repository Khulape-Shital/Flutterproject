import 'dart:ui'; // Needed for the ImageFilter.blur

import 'package:codexuser/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Animation controller and variables
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;

  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Fade-in animation from opacity 0 to 1
    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Slide animation from top to its original position
    _slideAnimation =
        Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start animation when page loads
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference userRef =
        FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: userRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return Stack(
            children: [
              // Background image
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Gradient overlay for better text contrast
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              // Apply blur effect on the background
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  color: const Color.fromARGB(255, 173, 32, 32)
                      .withOpacity(0), // Required for BackdropFilter to apply
                ),
              ),
              // The main login form container
              Center(
                child: FadeTransition(
                  opacity: _fadeInAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      height: 450,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        // color: Colors.white.withOpacity(0.8), // Semi-transparent container
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D")),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Username TextField
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextField(
                              controller: userNameController,
                              cursorColor: Color.fromARGB(255, 67, 154, 226),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                labelText: 'Username',
                                filled: true,
                                fillColor: Colors.transparent,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 11, 11, 11)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                              ),
                            ),
                          ),
                          // Password TextField with Eye Icon
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextField(
                              controller: passwordController,
                              obscureText: !_isPasswordVisible,
                              cursorColor: Color.fromARGB(255, 67, 154, 226),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                labelText: 'Password',
                                filled: true,
                                fillColor: Colors.transparent,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 11, 11, 11)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                            ),
                          ),
                          // Submit Button
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () async {
                              if (userNameController.text.isEmpty ||
                                  passwordController.text.isEmpty) {
                                // Show a SnackBar if either field is empty
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    
                                    content: Text(
                                        "Please enter both username and password"),
                                    backgroundColor: Colors.redAccent,
                                    behavior: SnackBarBehavior
                                        .floating, // Make it float
                                    duration: Duration(
                                        seconds:
                                            2), // Time the SnackBar stays on screen
                                  ),
                                );
                              } else {
                                try {
                                  await userRef.add({
                                    'username': userNameController.text,
                                    'password': passwordController.text,
                                  });

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Homescreen(
                                  //       title: "Welcome",
                                  //       username: userNameController.text,
                                  //       password: passwordController.text,
                                  //     ),
                                  //   ),
                                  // );
                                } catch (e) {
                                  print("Error adding user: $e");
                                }
                              }
                            },
                            child: Text("login"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 15),
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                              backgroundColor: Colors.blueAccent,
                              elevation: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
