import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDashboard extends StatelessWidget {
  final String userId;

  const UserDashboard({super.key, required this.userId});

  Future<void> _logoutAndDeleteUser(BuildContext context) async {
    try {
      // Delete user data from Firestore
      final userRef = FirebaseFirestore.instance.collection('users');
      await userRef.doc(userId).delete();

      // Navigate back to the login screen
      Navigator.pop(context);
    } catch (e) {
      print("Error deleting user: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error deleting account. Please try again."),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 80, bottom: 20),
          child: InkWell(
            onTap: () => _logoutAndDeleteUser(context),
            child: Text(
              "Log out",
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
