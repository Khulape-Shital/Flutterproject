import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: Center(
        child: Text(
          "Sign-In Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
