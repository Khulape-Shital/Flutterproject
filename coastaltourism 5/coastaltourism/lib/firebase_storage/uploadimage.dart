import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coastaltourism/firebase_storage/getimage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? _imageFile;

  final ImagePicker _picker = ImagePicker();
  Future<void> pickImage() async {
    debugPrint("${_imageFile}");
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = pickedFile;
    });

    debugPrint("method called $_imageFile");
  }

  Future<void> uploadImage() async {
    debugPrint("upload method called");
    if (_imageFile == null) {
      debugPrint("file is null");
    }
    final storageRef =
        FirebaseStorage.instance.ref().child("images/${DateTime.now()}.jpg");

    if (kIsWeb) {
      final bytes = await _imageFile!.readAsBytes();
      await storageRef.putData(bytes);
    } else {
      await storageRef.putFile(File(_imageFile!.path));
    }

    final getImageUrl = await storageRef.getDownloadURL();
    debugPrint("url from storage $getImageUrl");

    await FirebaseFirestore.instance
        .collection("profile")
        .add({
          "imageUrl": getImageUrl,
          "name" : "asdfgh",
          "bio" : "asdfgh"
          });

    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => GetImage()));
      }),
      appBar: AppBar(
        title: Text("Image Upload to storage and firestore"),
      ),
      body: Column(
        children: [
          _imageFile != null
              ? kIsWeb
                  ? Image.network(_imageFile!.path)
                  : Image.file(File(_imageFile!.path))
              : Placeholder(
                color: Colors.red,
                child: Container(
                  height: 400,
                  width: 400,
                ),
              ),
          ElevatedButton(onPressed: pickImage, child: Text("pick image")),
          ElevatedButton(onPressed: uploadImage, child: Text("Upload image"))
        ],
      ),
    );
  }
}
