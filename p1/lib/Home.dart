import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p1/categoryscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CollectionReference userRef = FirebaseFirestore.instance.collection('users');

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: userRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          // You could add code here if you wanted to use the data from Firestore
          // For now, you don't need to map Firestore data to any model since the form just submits.

          return Container(
            height: 750,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8N3x8fGVufDB8fHx8fA%3D%3D",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: userNameController,
                          cursorColor: Color.fromARGB(255, 67, 154, 226),
                          style: TextStyle(color: Color.fromARGB(255, 24, 23, 23)),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter user Name',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: passwordController,
                          cursorColor: Color.fromARGB(255, 67, 154, 226),
                          style: TextStyle(color: Color.fromARGB(255, 13, 11, 11)),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (userNameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty) {
                        try {
                          await userRef.add({
                            'username': userNameController.text,
                            'password': passwordController.text,
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CategoryList()),
                          );
                        } catch (e) {
                          print("Error adding user: $e");
                        }
                      } else {
                        print("Please enter both username and password");
                      }
                    },
                    child: Text("Submit"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
