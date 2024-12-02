import 'dart:convert';

import 'package:coastaltourism/screens/data.dart';
import 'package:coastaltourism/screens/screen1.dart';
import 'package:coastaltourism/screens/searchPlace.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Screenlogin extends StatefulWidget {
  const Screenlogin({super.key});

  @override
  State<Screenlogin> createState() => _HomeState();
}

class _HomeState extends State<Screenlogin> with SingleTickerProviderStateMixin {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeInAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
   String hashPassword(String password) {
    var bytes = utf8.encode(password); // Convert the password into bytes using utf8 encoding
    var digest = sha256.convert(bytes); // Create the SHA256 hash of the password
    return digest.toString(); // Return the hash as a string
  }

  Future<void> _signIn() async {
  if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
    // Show a SnackBar if either field is empty
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Please enter both username and password"),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
    return;
  }

  // Trim whitespace to avoid issues with accidental spaces
  String username = userNameController.text.trim();
  String password = passwordController.text.trim();

  try {
    // Reference to the Firestore 'users' collection
    final userRef = FirebaseFirestore.instance.collection('users');

    // Query to find a matching user
    final querySnapshot = await userRef
        .where('username', isEqualTo: username)
        .where('password', isEqualTo: hashPassword(password))
        .get();

    print("Query returned ${querySnapshot.docs.length} document(s).");

    if (querySnapshot.docs.isNotEmpty) {
      // If a matching user is found, navigate to Screen1
      var userData = querySnapshot.docs.first.data();
      print("User found: $userData");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Screen1(
            title: "Welcome",
            username: username,
            password: password,
            beachesinfo: beaches, // Make sure `beaches` contains data
          ),
        ),
      );
    } else {
      // Show a SnackBar if no matching user is found
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid username or password. Please sign up first."),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
        ),
      );
    }
  } catch (e) {
    print("Error checking user: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("An error occurred. Please try again."),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          // Background, Gradient, and Blur Effect as per your original code...
          
          // The main login form container
          Container(
            decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.blue, Colors.white],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
            child: Center(
              child: FadeTransition(
                opacity: _fadeInAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    height: 500,
                    width: 350,
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white.withOpacity(0.8),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D"),
                        fit: BoxFit.cover,
                      ),
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
                              decoration: InputDecoration(labelText: 'Username'),
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                          ),
                        ),
                        // Password TextField with Eye Icon
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextField(
                            controller: passwordController,
                            obscureText: !_isPasswordVisible,
                            cursorColor: Color.fromARGB(255, 67, 154, 226),
                            
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
                             style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                          ),
                        ),
                        // Submit Button
                        SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: _signIn,
                          child: Text("login"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 15),
                            textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                            backgroundColor: const Color.fromARGB(255, 53, 146, 233),
                            elevation: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
