import 'package:api/class.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  static search d1 = search("All", "");
  static search d2 = search("Music", "");
  static search d3 = search("Movies", "");
  static search d4 = search("cartoon", "");
  static search d5 = search("comedy", "");
  static search d6 = search("Sports", "");

  List demo = [d1, d2, d3, d4, d5, d6];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    debugPrint("asdfjk");

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "YouTube",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        actions: [
          Icon(Icons.cast),
          Icon(Icons.notification_add_outlined),
          Icon(Icons.search)
        ],
      ),
      body: Column(
        children: [
          Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.demo.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 150,
                  width:50,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10),),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "${widget.demo[index].points}",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 27, 24, 24),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
                //scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.demo.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "${widget.demo[index].points}",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 27, 24, 24),
                        ),
                      ),
                    ),
                  );
                },
              ),
          ),
        ],
      ),
    );
  }
}