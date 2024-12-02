import 'package:coastaltourism/screens/data.dart';
import 'package:coastaltourism/screens/details.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final String ontapImage;
  final String beachName;
  final String beachInfo;
  final Map details;
  const Screen2(
      {super.key,
      required this.ontapImage,
      required this.beachName,
      required this.beachInfo,required this.details});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 450,
                width: 350,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey
                          .withOpacity(0.7), // Shadow color with opacity
                      spreadRadius: 10, // How much the shadow spreads
                      blurRadius: 7, // Blur effect
                      offset: Offset(3, 0), // Position of the shadow (x, y)
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Apply border radius to the image
                  child: Image.network(
                    "${widget.ontapImage}",
                    width:
                        200, // Ensure the width of the image matches the container
                    height:
                        400, // Ensure the height of the image matches the container
                    fit: BoxFit.cover,
        
                    // Make the image cover the container fully
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                     children: [
                       Text("Beach Name : ",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                                    Text(
                            widget.beachName,
                            style:
                                TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                     ],
                   ),
                 ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Details(popularDetails: widget.details,)));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20,top:10,bottom: 10),
                        child: Text(
                          "Details",
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500,color: const Color.fromARGB(255, 23, 114, 188)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.watch_later,
                      ),
                      color: Colors.grey,
                    ),
                    Text(
                      "8 Hours",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.cloud,
                      ),
                      color: Colors.grey,
                    ),
                    Text(
                      "16 dc",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.star_rate_rounded,
                      ),
                      color: Colors.grey,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Expanded(
                child: Container(
                 
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.beachInfo,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
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
