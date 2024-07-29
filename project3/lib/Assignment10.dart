import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Assignment10 extends StatelessWidget {
  const Assignment10({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Instagram >",
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Icon(Icons.keyboard_arrow_right_sharp),
        backgroundColor: Colors.black,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.message_rounded,
            color: Colors.white,
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                          border: Border.all(color: Colors.red, width: 5)),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                          border: Border.all(color: Colors.red, width: 5)),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                          border: Border.all(color: Colors.red, width: 5)),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                          border: Border.all(color: Colors.red, width: 5)),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                          border: Border.all(color: Colors.red, width: 5)),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                          border: Border.all(color: Colors.red, width: 5)),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                          border: Border.all(color: Colors.red, width: 5)),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                          border: Border.all(color: Colors.red, width: 5)),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                          border: Border.all(color: Colors.red, width: 5)),
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            border: Border.all(color: Colors.red, width: 2),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg"))),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40, right: 230),
                        child: Text(
                          "Shital_Khulape",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: Icon(
                          Icons.keyboard_command_key_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
