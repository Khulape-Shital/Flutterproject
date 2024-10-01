import 'package:flutter/material.dart';
import 'package:project16/Topics.dart';

import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class Screen1 extends StatelessWidget {
  final List? logos;
  final String? usar;

  const Screen1({super.key, this.logos, this.usar});

  @override
  Widget build(BuildContext context) {
    debugPrint("$logos");
    return Scaffold(
      appBar: AppBar(title: const Text("Topics")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Profile Section
            Container(
              height: 250,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 104, 152, 225),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "9:41",
                        style: TextStyle(fontSize: 35, color: Colors.black),
                      ),
                      Row(
                        children: [
                          Icon(Icons.network_cell_outlined,
                              color: Colors.black),
                          Icon(Icons.wifi, color: Colors.black),
                          Icon(Icons.battery_4_bar_sharp, color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.pinimg.com/736x/33/ba/df/33badf7bd7e2bd56b21e3d972fe3ed5a.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Hi",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "$usar",
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Text(
                            "hope you are fine",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Programming Languages Section with auto scroll
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Programming Languages",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.only(right: 20),
              child: ScrollLoopAutoScroll(
                scrollDirection: Axis.horizontal,
                delay: Duration(seconds: 0),
                duration: Duration(seconds: 200),
                child: Row(
                  children: List.generate(
                    logos![0]["Languages"].length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Topics(
                                      regardingCodes: logos![2]["langTopics"],
                                      image: logos![0]["Languages"][index],
                                      LangName: logos![2]["topicName"][index],
                                      subTopics: logos![2]["topics"])));
                        },
                        child: Container(
                          height: 150,
                          width: 150,
                          margin: const EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 20,
                                blurStyle: BlurStyle.outer,
                                color: Color.fromARGB(95, 146, 144, 144),
                                offset: Offset(10, 10),
                                spreadRadius: 5,
                              )
                            ],
                            image: DecorationImage(
                              image: AssetImage(
                                  "${logos![0]["Languages"][index]}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Courses Section with auto scroll
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Courses For You",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.only(right: 20),
              child: ScrollLoopAutoScroll(
                scrollDirection: Axis.horizontal,
                reverseScroll: true,
                delay: const Duration(seconds: 0),
                duration: const Duration(seconds: 200), // Adjust the speed
                child: Row(
                  children: List.generate(
                    logos![0]["courses"].length,
                    (index) {
                      return Container(
                        height: 150,
                        width: 150,
                        margin: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          border: Border.all(
                              width: 1,
                              color: const Color.fromARGB(96, 174, 173, 173)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 20,
                              blurStyle: BlurStyle.outer,
                              color: const Color.fromARGB(95, 146, 144, 144),
                              offset: const Offset(10, 10),
                              spreadRadius: 15,
                            )
                          ],
                          image: DecorationImage(
                            image: AssetImage("${logos![0]["courses"][index]}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            Container(
              width: 400,
              height: 250,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: ScrollLoopAutoScroll(
                scrollDirection: Axis.horizontal,
                delay: Duration(seconds: 0),
                duration: Duration(seconds: 200),
                child: Row(
                  children:
                      List.generate(logos![1]["upcomming"].length, (index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                              width: 2,
                              color: const Color.fromARGB(255, 97, 95, 95)),
                          image: DecorationImage(
                            image:
                                AssetImage("${logos![1]["upcomming"][index]}"),
                            fit: BoxFit.cover,
                          )),
                      height: 200,
                      width: 300,
                      margin: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${logos![1]["Timing"][index]}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${logos![1]["Dates"][index]}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Text(
                            "${logos![1]["course"][index]}",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: ElevatedButton(
                                onPressed: () {
                                  Color.fromARGB(255, 125, 159, 233);
                                  Border.all(
                                      width: 2,
                                      color: const Color.fromARGB(
                                          255, 125, 123, 123));
                                },
                                child: Text(
                                  "Join Demo",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                )),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}