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
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Container(
        decoration: const BoxDecoration(
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
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.08, // 8% of the screen height
                bottom: screenHeight * 0.08,
                left: screenWidth * 0.05, // 5% of the screen width
                right: screenWidth * 0.05,
              ),
              child: Row(
                children: [
                  Container(
                    height: screenWidth * 0.25, // 25% of the screen width
                    width: screenWidth * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenWidth * 0.25),
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4AYgPHxqTfSqoTamM5Gnt2KH4VNyQQzc6ipa6PUHobn56cSLLR8h_tgdZpCTJO6nou5E&usqp=CAU",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05), // 5% padding
                    child: Column(
                      children: const [
                        // Text with dynamic styling or responsive text size
                        Text(
                          "HOPE YOU LEARN",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: screenHeight * 0.02), // 2% padding
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Courses")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      var courses = snapshot.data!.docs;
                      return GridView.builder(
                        itemCount: courses.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: screenWidth * 0.03, // 3% spacing
                          crossAxisSpacing: screenWidth * 0.03, // 3% spacing
                        ),
                        itemBuilder: (context, index) {
                          var singleCourse = courses[index];
                          return Padding(
                            padding: EdgeInsets.all(screenWidth * 0.02), // 2% padding
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Topicsscreen(
                                      courseId: singleCourse.id,
                                      courseName: singleCourse['title'],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: screenWidth * 0.4, // 40% of screen width
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.1),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.grey,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color.fromARGB(
                                              255, 130, 129, 129)
                                          .withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(1, 5),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(singleCourse['title']),
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
            ),
          ],
        ),
      ),
    );
  }
}
