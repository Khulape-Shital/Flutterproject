import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/atom-one-dark.dart';

class CodesScreen extends StatefulWidget {
  final String? courseId;
  final String? topicId;
  final String? topicName;

  const CodesScreen({
    Key? key,
    required this.courseId,
    required this.topicId,
    required this.topicName,
  }) : super(key: key);

  @override
  State<CodesScreen> createState() => _CodesScreenState();
}

class _CodesScreenState extends State<CodesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.topicName}"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 104, 177, 237),
              Color.fromARGB(255, 127, 6, 149),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _buildCodeList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4AYgPHxqTfSqoTamM5Gnt2KH4VNyQQzc6ipa6PUHobn56cSLLR8h_tgdZpCTJO6nou5E&usqp=CAU",
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.topicName}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              Text(
                "In ${widget.topicName}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCodeList() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Courses")
            .doc(widget.courseId)
            .collection("Topics")
            .doc(widget.topicId)
            .collection("Codes")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No data available"));
          }

          final codes = snapshot.data!.docs;

          return ListView.builder(
            itemCount: codes.length,
            itemBuilder: (context, index) {
              var codeDoc = codes[index].data() as Map<String, dynamic>?;

              if (codeDoc == null) {
                return ListTile(
                  title: Text("Invalid code entry"),
                  subtitle: Text("This code entry is missing required data."),
                );
              }

              String code = codeDoc['code'] ?? 'No code available';
              String description = codeDoc['description'] ?? 'No description available';
              String? youtubeLink = codeDoc['youtubeLink'];

              return _buildCodeCard(code, description, youtubeLink);
            },
          );
        },
      ),
    );
  }

  Widget _buildCodeCard(String code, String description, String? youtubeLink) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: InkWell(
            onTap: () {
              // if (youtubeLink != null && youtubeLink.isNotEmpty) {
              //   String videoId = _extractVideoId(youtubeLink);
              //   if (videoId.isNotEmpty) {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => YouTubePlayerScreen(videoId: videoId),
              //       ),
              //     );
              //   } else {
              //     _showSnackBar("Invalid YouTube link provided.");
              //   }
              // } else {
              //   _showSnackBar("YouTube link not available.");
              // }
            },
            child: Container(
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    color: Color.fromARGB(255, 218, 214, 214),
    border: Border.all(width: 2, color: Colors.grey),
    boxShadow: [
      BoxShadow(
        spreadRadius: 5,
        offset: Offset(5, 5),
        blurRadius: 20,
        color: Colors.grey,
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,  // This allows the column to take only the required height
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: HighlightView(
            code,
            language: 'dart',
            theme: atomOneDarkTheme,
            padding: EdgeInsets.all(12),
            textStyle: TextStyle(fontSize: 14),
          ),
        ),
      ),
    ],
  ),
)
          ),
        ),
      ),
    );
  }
}
  