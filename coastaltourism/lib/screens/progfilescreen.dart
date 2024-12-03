import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coastaltourism/screens/data.dart';
import 'package:coastaltourism/screens/screen1.dart';
import 'package:coastaltourism/screens/screenlogin.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String _uploadedImageUrl = ''; // Initially empty, default to no image
  final TextEditingController _usernameController =
      TextEditingController(text: 'John Doe');
  bool _isEditing = false;

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }

  Future<void> uploadImage() async {
    if (_image == null) {
      debugPrint("No file selected");
      return;
    }

    debugPrint("Upload method called");

    final cloudName = "dtn992bha"; // Your Cloudinary cloud name
    final uploadPreset = "Unsigned upload"; // Your Cloudinary upload preset

    try {
      final url =
          Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");
      var request = http.MultipartRequest('POST', url);

      if (kIsWeb) {
        final bytes = await _image!.readAsBytes();
        request.files.add(http.MultipartFile.fromBytes(
          'file',
          bytes,
          filename: _image!.name,
        ));
      } else {
        request.files.add(await http.MultipartFile.fromPath(
          'file',
          _image!.path,
        ));
      }

      request.fields['upload_preset'] = uploadPreset;

      var response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await http.Response.fromStream(response);
        final responseBody = responseData.body;

        final imageUrl = jsonDecode(responseBody)['secure_url'];

        debugPrint("Image URL: $imageUrl");

        setState(() {
          _uploadedImageUrl = imageUrl;
        });

        await FirebaseFirestore.instance.collection("images").add({
          "imageUrl": imageUrl,
          'timestamp': FieldValue.serverTimestamp(),
        });

        debugPrint("Image URL saved to Firestore");
      } else {
        debugPrint("Failed to upload image to Cloudinary");
      }
    } catch (e) {
      debugPrint("Error uploading image: $e");
    }

    setState(() {
      _image = null; // Reset the picked image after upload
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit, color: Colors.white),
            onPressed: () {
              setState(() {
                _isEditing = !_isEditing;
              });
              if (!_isEditing) {
                String username = _usernameController.text;
                print('Username: $username');
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 160,
                      width: 160,
                      color: Colors.grey,
                      child: _uploadedImageUrl.isNotEmpty
                          ? Image.network(_uploadedImageUrl, fit: BoxFit.cover)
                          : Icon(Icons.person, size: 80, color: Colors.white),
                    ),
                  ),
                  if (_isEditing)
                    Positioned(
                      bottom: -5,
                      right: -5,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Icon(Icons.add_a_photo, size: 30),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 30),
            _isEditing
                ? TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  )
                : Container(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: uploadImage,
              child: Text("Upload Image"),
            ),
            SizedBox(height: 20),
           ElevatedButton(
  onPressed: () async {
    // Fetch the image URL from Firestore or use the local _uploadedImageUrl
    String imageUrl = _uploadedImageUrl;
     // Or retrieve from Firestore if needed
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen1(title: "Welcome", username: "username", password: "password", beachesinfo: beaches, imageUrl: imageUrl)));
    if (imageUrl.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Screen1(
            title: "Welcome",
            username: _usernameController.text, // Pass username if needed
            password: "password", // Example placeholder
            beachesinfo: beaches, // Example data
            imageUrl: imageUrl, // Pass the image URL here
          ),
        ),
        
      );
      debugPrint("url send");
    } else {
      debugPrint("Image URL is empty, cannot navigate.");
    }
  },
  child: Text("Go to Screen 1"),
),

          ],
        ),
      ),
    );
  }
} 