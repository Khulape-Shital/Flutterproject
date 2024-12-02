import 'dart:convert';
import 'dart:ui';
import 'package:coastaltourism/screens/data.dart';
import 'package:coastaltourism/screens/screen1.dart';
import 'package:coastaltourism/screens/screensignin.dart';
import 'package:coastaltourism/screens/searchPlace.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Function to fetch the last stored image from Firestore
Future<String?> fetchLastImageUrl() async {
  try {
    // Query the "images" collection ordered by "timestamp" in descending order
    final snapshot = await FirebaseFirestore.instance
        .collection('images')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    // Check if any documents exist
    if (snapshot.docs.isNotEmpty) {
      // Retrieve the "imageUrl" field from the most recent document
      String imageUrl = snapshot.docs.first.data()['imageUrl'] as String;
      return imageUrl;
    } else {
      print('No images found in Firestore.');
      return null;
    }
  } catch (e) {
    print('Error fetching last image URL: $e');
    return null;
  }
}

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

    String username = userNameController.text.trim();
    String password = passwordController.text.trim();

    try {
      final userRef = FirebaseFirestore.instance.collection('users');
      final querySnapshot = await userRef
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: hashPassword(password))
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs.first.data();
        String? lastImageUrl = await fetchLastImageUrl();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Screen1(
              title: "Welcome",
              username: username,
              password: password,
              beachesinfo: beaches,
              imageUrl: lastImageUrl ?? "", // Pass the last image URL or empty if none
            ),
          ),
        );
      } else {
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
          // Background, Gradient, and Blur Effect
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          controller: userNameController,
                          cursorColor: Colors.blue,
                          decoration: InputDecoration(labelText: 'Username'),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          controller: passwordController,
                          obscureText: !_isPasswordVisible,
                          cursorColor: Colors.blue,
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
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: _signIn,
                        child: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 59, 92, 192)),
                          backgroundColor: Colors.blue,
                          elevation: 5,
                        ),
                      ),
                      Row(
                        children: [
                          Text("Don't have an account?",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w500) ,),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Screensignin()));
                            },
                            child: Text("_Sign Up",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: const Color.fromARGB(255, 249, 76, 64)) ,)),
                        ],
                      )
                    ],
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
