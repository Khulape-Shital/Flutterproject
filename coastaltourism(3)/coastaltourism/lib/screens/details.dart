import 'package:coastaltourism/screens/classes.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  static Info d1 = new Info("Water Temp : 67");
  static Info d2 = new Info("High  Tides : 5.07 PM");

  static Info d3 = new Info("Low tides :10.48");

  static Info d4 = new Info("Wind : N 15-20 MPH");

  static Info d5 = new Info("Lighting : None");
  List beachInfo = [d1, d2, d3, d4, d5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Overview",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Details",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 23, 22, 22),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://static.vecteezy.com/system/resources/thumbnails/001/840/612/small_2x/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg"))),
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://static.vecteezy.com/system/resources/thumbnails/001/840/612/small_2x/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg"))),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Weather Forcast",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 23, 22, 22),
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Sunday 10,Aug 2024",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    child: ListView.builder(
                  itemCount: beachInfo.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment
                            .center, // Aligns containers in the middle vertically
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              height: 50,
                              width: 15,
                              color: const Color.fromARGB(255, 47, 47, 47),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                            ),
                            alignment: Alignment
                                .centerLeft, // Aligns text to the left within the container
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10), // Even padding on both sides
                            child: Text(
                              beachInfo[index].watertemp,
                              style: TextStyle(
                                  fontSize: 20,fontWeight: FontWeight.w400), // Adjust font size as needed
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 20),
                child: Text(
                  "Explore More",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRhEq1p5jV9WlmU1EQb35Yqq2TkHp3XwfI1Q&s",
                        ),
                        fit: BoxFit.cover)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
