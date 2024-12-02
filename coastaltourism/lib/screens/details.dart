import 'package:coastaltourism/location.dart';
import 'package:coastaltourism/screens/data.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String beachName;
  final String waveHeight;
  final String waterQuality;
  final String windSpeed;
  final String tideLevel;
  final double latitude;
  final double longitude;
  String imageUrl;

   Details({
    super.key,
    required this.beachName,
    required this.tideLevel,
    required this.waterQuality,
    required this.waveHeight,
    required this.windSpeed,
    required this.longitude,
    required this.latitude,
    required this.imageUrl
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // Reusable widget to display each property with a label
  Widget propertyCard(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          '$label: $value',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

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
                    Center(
                      child: Text(
                        "Details",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 23, 22, 22),
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        image: DecorationImage(
                          image: NetworkImage(
                             widget.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Beach Info Section
              Text('Beach Info:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(height: 8),

              // Reusable Property Cards for Beach Information
              propertyCard('Beach Name', widget.beachName),
              propertyCard('Wave Height', widget.waveHeight),
              propertyCard('Water Quality', widget.waterQuality),
              propertyCard('Wind Speed', widget.windSpeed),
              propertyCard('Tide Level', widget.tideLevel),

              // Explore More Section
              // Padding(
              //   padding: const EdgeInsets.only(top: 25, bottom: 20),
              //   child: Text(
              //     "Explore More",
              //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              //   ),
              // ),
              // Image Section for Explore More
    //           InkWell(
    //             onTap: () {
    // //                 double latitude = double.tryParse(popular[latitude].toString()) ?? 0.0;
    // // double longitude = double.tryParse(widget.popularBeachData["Longitude"].toString()) ?? 0.0;
    //               // Uncomment when LocationScreen is implemented
    //               Navigator.push(
                    
    //                 context,
    //                 MaterialPageRoute(
    //                     builder: (context) => LocationScreen(
    //                         beachName: widget.beachName,
    //                         Latitude: widget.latitude,
    //                         Longitude: widget.longitude)),
    //               );
    //             },
    //             // child: Container(
    //             //   height: 200,
    //             //   width: 200,
    //             //   decoration: BoxDecoration(
    //             //     borderRadius: BorderRadius.all(Radius.circular(20)),
    //             //     image: DecorationImage(
    //             //       image: NetworkImage(
    //             //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRhEq1p5jV9WlmU1EQb35Yqq2TkHp3XwfI1Q&s",
    //             //       ),
    //             //       fit: BoxFit.cover,
    //             //     ),
    //             //   ),
    //             // ),
    //           ),
            ],
          ),
        ),
      ),
    );
  }
}
