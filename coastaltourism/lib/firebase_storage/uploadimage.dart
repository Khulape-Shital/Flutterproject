import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coastaltourism/firebase_storage/getimage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  Future<void> uploadImage() async {
    if (_imageFile == null) {
      debugPrint("No file selected");
      return;
    }

    debugPrint("Upload method called");

    final cloudName = "dtn992bha";
    final uploadPreset = "Unsigned upload";

    try {
      final url = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");
      var request = http.MultipartRequest('POST', url);

      if (kIsWeb) {
        final bytes = await _imageFile!.readAsBytes();
        request.files.add(http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: _imageFile!.name,
        ));
      } else {
        request.files.add(await http.MultipartFile.fromPath(
          'file',
          _imageFile!.path,
        ));
      }

      request.fields['upload_preset'] = uploadPreset;

      var response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final responseBody = responseData.body;
        final imageUrl = jsonDecode(responseBody)['secure_url'];

        debugPrint("Image URL: $imageUrl");

        // Save image URL to Firestore
        await FirebaseFirestore.instance.collection("images").add({
          "imageUrl": imageUrl,
        });

        debugPrint("Image URL saved to Firestore");
      } else {
        debugPrint("Failed to upload image to Cloudinary");
      }
    } catch (e) {
      debugPrint("Error uploading image: $e");
    }

    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GetImage()),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Image Upload to Cloudinary"),
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
          ElevatedButton(onPressed: pickImage, child: Text("Pick Image")),
          ElevatedButton(onPressed: uploadImage, child: Text("Upload Image")),
        ],
      ),
    );
  }
}
