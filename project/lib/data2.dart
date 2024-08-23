import 'package:flutter/material.dart';
import 'package:project/program2.dart';
class Data2 extends StatefulWidget {
  const Data2({super.key});

  @override
  State<Data2> createState() => _Data2State();
}

class _Data2State extends State<Data2> {
   static Detaileds d1 = Detaileds(
    logo: "images/save.png",
    title: "Message and Story replies",
  );
  static Detaileds d2 = Detaileds(
    logo: "images/save.png",
    title: "Tags and mentions",
  );
  static Detaileds d3 = Detaileds(
    logo: "images/save.png",
    title: "Blocked",
  );

  static Detaileds d4 = Detaileds(
    logo: "images/save.png",
    title: "Comments",
  );
  static Detaileds d5 = Detaileds(
    logo: "images/save.png",
    title: "Sharing",
  );
   static Detaileds d6 = Detaileds(
    logo: "images/save.png",
    title: "Restricted",
  );

 static Detaileds d7 = Detaileds(
    logo: "images/save.png",
    title: "Limit interaction",
  );

 static Detaileds d8 = Detaileds(
    logo: "images/save.png",
    title: "Hidden words",
  );
   static Detaileds d9 = Detaileds(
    logo: "images/save.png",
    title: "Follow and invite frinds",
  );




  

  final List<Detaileds> object1 = [d1, d2, d3, d4,d5,d6,d7,d8,d9];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: object1.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 20,
                                width: 20,
                                child: Image(
                                  image: AssetImage("${object1[index].logo}"),
                                  color: Colors.white,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${object1[index].title}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}