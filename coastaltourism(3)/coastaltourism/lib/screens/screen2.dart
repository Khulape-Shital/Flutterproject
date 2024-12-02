import 'package:coastaltourism/screens/details.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final String ontapImage;
  const Screen2({super.key, required this.ontapImage});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              height: 300,
              width: 400,
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Overview",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "Details",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    child: Icon(Icons.watch_later,
                        color: const Color.fromARGB(255, 57, 57, 57)),
                    color: Colors.grey,
                  ),
                  Text(
                    "8 Hours",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 111, 110, 110)),
                  )
                ],
              ),
              Row(
                
                children: [
                  Container(
                    child: Icon(
                      Icons.cloud,
                      color: const Color.fromARGB(255, 57, 57, 57),
                    ),
                    color: Colors.grey,
                  ),
                  Text(
                    "16 dc",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 111, 110, 110)),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Icon(Icons.star_rate_rounded,
                        color: const Color.fromARGB(255, 57, 57, 57)),
                    color: Colors.grey,
                  ),
                  Text(
                    "4.5",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 111, 110, 110)),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              height: 200,
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Goa’s beaches offer golden sands, water sports, and lively nightlife. Popular spots like Baga and Calangute bustle with activities, while Palolem and Agonda are peaceful retreats. Anjuna’s flea markets and Vagator’s sunsets draw crowds. Goa’s coastline mixes relaxation and adventure, making it a prime destination for travelers worldwide ",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          ElevatedButton(
             style: ElevatedButton.styleFrom(
   backgroundColor: Colors.blue, // Background color
   // Text color
    shadowColor: Colors.blueAccent, // Shadow color
    elevation: 5, // Elevation (shadow)
    shape: RoundedRectangleBorder( // Rounded shape
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Padding
  ),
    // Set the background color to black
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Details()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  child: Text("Plan A Trip", style: TextStyle(color: const Color.fromARGB(255, 38, 37, 37)))),
                Icon(Icons.telegram, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
