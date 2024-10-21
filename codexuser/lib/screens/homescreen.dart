import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:codexuser/screens/topicsscreen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(48.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
                const Padding(
                  padding: EdgeInsets.all(48.0),
                  child: Text("Shubham"),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Courses")
                      .snapshots(),
                  builder: (context, snapshot) {
                    var courses = snapshot.data!.docs;
                    debugPrint("length ${snapshot.data!.docs.length}");
                    return GridView.builder(
                        // physics: NeverScrollableScrollPhysics( ),
                        itemCount: snapshot.data!.docs.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // mainAxisExtent: 10,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          var singleCourse = courses[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Topicsscreen(
                                            courseId: singleCourse.id,
                                            courseName:
                                                singleCourse['title'])));
                              },
                              child: Container(
                                height: 200,
                                width: 200,
                                color: Colors.blue,
                                child:
                                    Center(child: Text(singleCourse['title'])),
                              ),
                            ),
                          );
                        });
                  }),
            ),
          ))
        ],
      ),
    );
  }
}
