// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetImage extends StatelessWidget {
  const GetImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Image"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("profile").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No images found"));
          }

          var images = snapshot.data!.docs;
          return ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              var singleImage = images[index];
              return Container(
                padding: EdgeInsets.all(8.0),
                child: Image.network(singleImage['imageUrl']),
              );
            },
          );
        },
      ),
    );
  }
}
