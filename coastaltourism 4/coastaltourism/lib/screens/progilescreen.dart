import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  XFile? _imageFile;
  bool _isUploading = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  double _rating = 3.0; // Default rating value

  final ImagePicker _picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> uploadProfileData() async {
    if (_imageFile == null || _nameController.text.isEmpty || _bioController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill in all fields and select an image")));
      return;
    }

    setState(() {
      _isUploading = true;
    });

    final storageRef =
        FirebaseStorage.instance.ref().child("profile_images/${DateTime.now()}.jpg");

    try {
      // Upload image to Firebase Storage
      if (kIsWeb) {
        final bytes = await _imageFile!.readAsBytes();
        await storageRef.putData(bytes);
      } else {
        await storageRef.putFile(File(_imageFile!.path));
      }

      final getImageUrl = await storageRef.getDownloadURL();

      // Get the current user's UID
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        // Update user data in Firestore using their UID
        await FirebaseFirestore.instance.collection("users").doc(currentUser.uid).set({
          "imageUrl": getImageUrl,
          "name": _nameController.text,
          "bio": _bioController.text,
          "rating": _rating, // Store the rating value
        }, SetOptions(merge: true)); // Merge allows us to update without overwriting the document.

        setState(() {
          _imageFile = null;
          _isUploading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile updated successfully!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User is not authenticated")),
        );
      }
    } catch (e) {
      setState(() {
        _isUploading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to upload profile image: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _imageFile != null
                ? Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: kIsWeb
                          ? Image.network(_imageFile!.path)
                          : Image.file(File(_imageFile!.path)),
                    ),
                  )
                : Placeholder(
                    fallbackHeight: 200,
                    fallbackWidth: double.infinity,
                    color: Colors.grey,
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImage,
              child: Text("Pick Profile Image"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _bioController,
              decoration: InputDecoration(
                labelText: 'Enter your bio',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            
            // Rating Slider
            Text("Rate your profile:"),
            Slider(
              value: _rating,
              min: 1,
              max: 5,
              divisions: 4,
              label: _rating.toString(),
              onChanged: (newRating) {
                setState(() {
                  _rating = newRating;
                });
              },
            ),
            SizedBox(height: 20),

            _isUploading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: uploadProfileData,
                    child: Text("Update Profile"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
