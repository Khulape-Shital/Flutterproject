import 'package:coastaltourism/location.dart';
import 'package:flutter/material.dart';
// import 'package:google_places_flutter/model/place_details.dart';

class Details extends StatefulWidget {
  final Map? popularDetails;
  const Details({super.key, required this.popularDetails});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final List<String> keys = [
    "BeachName",
    "WaveHeight",
    "WaterQuality ",
    "WindSpeed",
    "TideLevel"
  ];

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
              // Top Row with Overview, Details, and Profile Picture
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
              // ListView.builder for dynamic content
              Expanded(
                child: ListView.builder(
                  itemCount: keys.length,
                  itemBuilder: (context, index) {
                    String key = keys[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 198, 196, 196),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          border: Border.all(width: 2, color: Colors.blue),
                        ),
                        // Fixed height for each container
                        height: 70, // Fixed height for each container
                        child: Row(
                          children: [
                            Text(
                              "$key : ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            Expanded(
                              child: Text(
                                "${widget.popularDetails![key] ?? "N/A"}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // "Explore More" Section
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 20),
                child: Text(
                  "Explore More",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              // Image section for explore more
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen()));
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRhEq1p5jV9WlmU1EQb35Yqq2TkHp3XwfI1Q&s",
                          ),
                          fit: BoxFit.cover)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
