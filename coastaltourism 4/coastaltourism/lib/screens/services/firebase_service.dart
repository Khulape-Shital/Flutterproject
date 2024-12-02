import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // For hashing

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
          .where('password', isEqualTo: passwordHash)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print("Failed to sign in: $e");
      return false;
    }
  }
}
