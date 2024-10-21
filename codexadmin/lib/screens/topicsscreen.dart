import 'package:codexadmin/screens/codesscreen.dart';
import 'package:codexadmin/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// Add this to navigate to the Codes Screen

class TopicsScreen extends StatefulWidget {
  final String courseId;
  final String courseTitle;

  TopicsScreen({required this.courseId, required this.courseTitle});

  @override
  _TopicsScreenState createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _topicTitleController = TextEditingController();
  final TextEditingController _topicDescController = TextEditingController();

  void _addTopic() {
    String title = _topicTitleController.text.trim();
    String description = _topicDescController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
      _firebaseService.addTopic(widget.courseId, title, description);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics in ${widget.courseTitle}'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Courses')
            .doc(widget.courseId)
            .collection('Topics')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            final topics = snapshot.data!.docs;

            return ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                var topic = topics[index];
                return ListTile(
                  title: Text(topic['title']),
                  subtitle: Text(topic['description']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                           CodesScreen(courseId: widget.courseId, topicId: topic.id, topicTitle: topic['title']),
                      ),
                    );
                  },
                );
              },
            );
          }

          return Center(child: Text('No topics available.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTopicDialog();
        },
        child: Icon(Icons.add),
        tooltip: 'Add Topic',
      ),
    );
  }

  void _showAddTopicDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Topic'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _topicTitleController,
              decoration: InputDecoration(labelText: 'Topic Title'),
            ),
            TextField(
              controller: _topicDescController,
              decoration: InputDecoration(labelText: 'Topic Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _topicTitleController.clear();
              _topicDescController.clear();
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: _addTopic,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
