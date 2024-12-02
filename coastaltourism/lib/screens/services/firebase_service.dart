import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Hash password securely
  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  // Register user and send email verification
  Future<void> register(String username, String password, String email) async {
    final hashedPassword = _hashPassword(password);
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send email verification
      if (!userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
      }

      // Save user data to Firestore
      await _firestore.collection('users').doc(username).set({
        'username': username,
        'password': hashedPassword,
        'email': email,
      });

      print("User registered successfully.");
    } catch (e) {
      throw Exception("Failed to register user: ${e.toString()}");
    }
  }

  // Sign-in with username and hashed password
  Future<bool> signIn(String username, String password) async {
    final hashedPassword = _hashPassword(password);
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(username).get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        if (data['password'] == hashedPassword) {
          return true; // Successful sign-in
        }
      }
      return false; // User not found or password mismatch
    } catch (e) {
      throw Exception("Failed to sign in: ${e.toString()}");
    }
  }

  // Delete user data by username
  Future<void> deleteUserData(String username) async {
    try {
      await _firestore.collection('users').doc(username).delete();
    } catch (e) {
      throw Exception("Failed to delete user data: ${e.toString()}");
    }
  }

  // Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? "An error occurred.");
    }
  }
}
