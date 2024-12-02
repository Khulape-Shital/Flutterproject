import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Hashes the password for security
  String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  /// Registers a new user in Firestore
  Future<void> register(String username, String password) async {
    try {
      final passwordHash = _hashPassword(password);
      await _firestore.collection('users').add({
        'username': username,
        'password': passwordHash,
      });
      print("User registered successfully");
    } catch (e) {
      print("Failed to register user: $e");
    }
  }

  /// Signs in the user by checking if they exist in Firestore
  Future<bool> signIn(String username, String password) async {
    final passwordHash = _hashPassword(password);

    try {
      final querySnapshot = await _firestore
          .collection('users')
          .where('username', isEqualTo: username)
          .where('password', isEqualTo: password)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // User found and password matches
        return true;
      } else {
        // User not found or password doesn't match
        return false;
      }
    } catch (e) {
      print("Failed to sign in: $e");
      return false;
    }
  }
 

  // Method to delete user data (including the password) by username
 // Method to delete user data by username
  Future<void> deleteUserData(String username) async {
    try {
      // Query the Firestore collection to find the user document by username
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users') // Replace 'users' with your Firestore collection name
          .where('username', isEqualTo: username)
          .get();

      // If a document is found, delete it
      for (var doc in querySnapshot.docs) {
        await FirebaseFirestore.instance.collection('users').doc(doc.id).delete();
      }
    } catch (e) {
      // Throw an exception with the error message
      throw Exception("Failed to delete user data: $e");
    }
  }}