import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coastaltourism/screens/data.dart';
import 'package:coastaltourism/screens/details.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  final Map popularBeachData;
  String imageUrl;

 Screen2({super.key, required this.popularBeachData,required this.imageUrl});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  
  @override
  Widget build(BuildContext context) {
    // Same for longitude

    double latitude = double.tryParse(widget.popularBeachData["Latitude"].toString()) ?? 0.0;
    double longitude = double.tryParse(widget.popularBeachData["Longitude"].toString()) ?? 0.0;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 10,
                      blurRadius: 7,
                      offset: Offset(3, 0),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.popularBeachData["img"] ?? "",
                    width: 200,
                    height: 400,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(Icons.error, color: Colors.red, size: 50),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text("Beach Name: ",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
                  Text(
                    widget.popularBeachData["BeachName"] ?? "N/A",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Details(
                          beachName: widget.popularBeachData["BeachName"] ?? "N/A",
                          tideLevel: widget.popularBeachData["TideLevel"] ?? "N/A",
                          waterQuality: widget.popularBeachData["WaterQuality"] ?? "N/A",
                          waveHeight: widget.popularBeachData["WaveHeight"] ?? "N/A",
                          windSpeed: widget.popularBeachData["WindSpeed"] ?? "N/A",
                          latitude:latitude,
                          longitude: longitude,
                          imageUrl: widget.imageUrl,
                         
                         
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25, top: 10, bottom: 10),
                    child: Text(
                      "Details",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 23, 114, 188)),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                widget.popularBeachData["info"] ?? "No information available.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
