import 'package:codexadmin/screens/codesscreen.dart';
import 'package:codexadmin/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  void _addOrUpdateTopic(String? topicId) {
    String title = _topicTitleController.text.trim();
    String description = _topicDescController.text.trim();

    if (title.isNotEmpty && description.isNotEmpty) {
      if (topicId == null) {
        _firebaseService.addTopic(widget.courseId, title, description);
      } else {
        _firebaseService.updateTopics(widget.courseId, topicId, title, description);
      }
      Navigator.of(context).pop();
    }
  }

  void _deleteTopic(String topicId) {
    _firebaseService.deleteTopics(widget.courseId, topicId);
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
                        builder: (context) => CodesScreen(
                          courseId: widget.courseId,
                          topicId: topic.id,
                          topicTitle: topic['title'],
                        ),
                      ),
                    );
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          _showAddTopicDialog(
                            topicId: topic.id,
                            initialTitle: topic['title'],
                            initialDescription: topic['description'],
                          );
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          _deleteTopic(topic.id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
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

  void _showAddTopicDialog({String? topicId, String? initialTitle, String? initialDescription}) {
    _topicTitleController.text = initialTitle ?? '';
    _topicDescController.text = initialDescription ?? '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(topicId == null ? 'Add Topic' : 'Edit Topic'),
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
            onPressed: () {
              _addOrUpdateTopic(topicId);
              _topicTitleController.clear();
              _topicDescController.clear();
            },
            child: Text(topicId == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }
}
