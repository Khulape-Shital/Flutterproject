import 'package:firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore CRUD Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textFieldController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _addData(String text) async {
    await _firestore.collection('items').add({'name': text});
    setState(() {});
  }

  void _updateData(String id, String newText) async {
    await _firestore.collection('items').doc(id).update({'name': newText});
    setState(() {});
  }

  void _deleteData(String id) async {
    await _firestore.collection('items').doc(id).delete();
    setState(() {});
  }

  Widget _buildListItem(DocumentSnapshot document) {
    return ListTile(
      title: Text(document['name']),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => _showEditDialog(document),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _deleteData(document.id),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(DocumentSnapshot document) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Item'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: document['name']),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
                _textFieldController.clear();
              },
            ),
            TextButton(
              child: Text('SAVE'),
              onPressed: () {
                _updateData(document.id, _textFieldController.text);
                Navigator.pop(context);
                _textFieldController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore CRUD Demo'),
      ),
      body: StreamBuilder(
        stream: _firestore.collection('items').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return _buildListItem(snapshot.data!.docs[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(),
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: 'Enter item name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.pop(context);
                _textFieldController.clear();
              },
            ),
            TextButton(
              child: Text('ADD'),
              onPressed: () {
                _addData(_textFieldController.text);
                Navigator.pop(context);
                _textFieldController.clear();
              },
            ),
          ],
        );
      },
    );
  }
}