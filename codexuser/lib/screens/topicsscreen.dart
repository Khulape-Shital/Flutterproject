import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codexuser/screens/YouTubePlayerScreen%20.dart';
import 'package:codexuser/screens/codesereen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Topicsscreen extends StatefulWidget {
  final String? courseId;
  final String? courseName;

  const Topicsscreen({Key? key, this.courseId, this.courseName}) : super(key: key);

  @override
  State<Topicsscreen> createState() => _TopicsscreenState();
}

class _TopicsscreenState extends State<Topicsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.courseName}"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 104, 177, 237),
              Color.fromARGB(255, 127, 6, 149)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 60, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4AYgPHxqTfSqoTamM5Gnt2KH4VNyQQzc6ipa6PUHobn56cSLLR8h_tgdZpCTJO6nou5E&usqp=CAU",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.courseName}",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Programming",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Courses")
                      .doc(widget.courseId)
                      .collection("Topics")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    var topics = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: topics.length,
                      itemBuilder: (context, index) {
                        var singleTopic = topics[index];
                        final description = singleTopic['description'] as String;
                        final youtubeLink = _extractVideoId(description);

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
                              child: InkWell(
                                onTap: () {
                                  // This triggers only when tapping outside the link text
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CodesScreen(
                                        topicId: singleTopic.id,
                                        topicName: singleTopic['title'],
                                        courseId: widget.courseId,
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 150,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                    color: const Color.fromARGB(255, 218, 214, 214),
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
                                    children: [
                                      Text(singleTopic['title']),
                                      youtubeLink.isNotEmpty
                                          ? GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => YouTubePlayerScreen(videoId: youtubeLink),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                description,
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  decoration: TextDecoration.underline,
                                                ),
                                              ),
                                            )
                                          : Text(description),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _extractVideoId(String description) {
    Uri? uri = Uri.tryParse(description);
    if (uri == null) return '';

    if (uri.host.contains('youtu.be')) {
      return uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : '';
    } else if (uri.host.contains('youtube.com')) {
      return uri.queryParameters['v'] ?? '';
    }
    return '';
  }
}
