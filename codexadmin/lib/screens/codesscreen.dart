import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codexadmin/services/firebase_service.dart';

class CodesScreen extends StatefulWidget {
  final String courseId;
  final String topicId;
  final String topicTitle;

  CodesScreen({
    required this.courseId,
    required this.topicId,
    required this.topicTitle,
  });

  @override
  _CodesScreenState createState() => _CodesScreenState();
}

class _CodesScreenState extends State<CodesScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _codeDescController = TextEditingController();
  

  void _addCode() {
    String code = _codeController.text.trim();
    String description = _codeDescController.text.trim();

    print(
        "Attempting to add code: $code, description: $description"); // Debug line

    if (code.isNotEmpty && description.isNotEmpty) {
      _firebaseService.addCode(
          widget.courseId, widget.topicId, code, description,);
      Navigator.of(context).pop();
    } else {
      print("Code or description is empty."); // Debug line
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Codes in ${widget.topicTitle}'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Courses')
            .doc(widget.courseId)
            .collection('Topics')
            .doc(widget.topicId)
            .collection('Codes')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData) {
            final codes = snapshot.data!.docs;

            return ListView.builder(
              itemCount: codes.length,
              itemBuilder: (context, index) {
                try {
                  var code = codes[index];
                  String codeText = code['code'] ?? 'No code available';
                  String descriptionText =
                      code['description'] ?? 'No description available';

                  return ListTile(
                    title: Text(codeText),
                    subtitle: Text(descriptionText),
                  );
                } catch (e) {
                  print(
                      "Error reading document data: $e"); // Log errors for debugging
                  return ListTile(
                    title: Text('Invalid code document'),
                    subtitle: Text('Some fields are missing'),
                  );
                }
              },
            );
          }

          return Center(child: Text('No codes available.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCodeDialog,
        child: Icon(Icons.add),
        tooltip: 'Add Code',
      ),
    );
  }

  void _showAddCodeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Code'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _codeController,
              decoration: InputDecoration(labelText: 'Code'),
            ),
            TextField(
              controller: _codeDescController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _codeController.clear();
              _codeDescController.clear();
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: _addCode,
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
