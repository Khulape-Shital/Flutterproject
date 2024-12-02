import 'package:flutter/material.dart';

class BeachInfoDisplay extends StatelessWidget {
  final String selectedState;
  final String selectedBeach;
  final List<Map<String, dynamic>> stateBeachesData;

  const BeachInfoDisplay({
    Key? key,
    required this.selectedState,
    required this.selectedBeach,
    required this.stateBeachesData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stateData = stateBeachesData
        .firstWhere((state) => state["Location"] == selectedState);
    var beachData = stateData["Beaches"]
        .firstWhere((beach) => beach["BeachName"] == selectedBeach);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Beach Info:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        SizedBox(height: 8),
        
        // Beach Name
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 50),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Beach Name: ${beachData["BeachName"]}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        
        // Wave Height
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 50),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Wave Height: ${beachData["WaveHeight"]}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
        ),

        // Water Quality
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 50),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Water Quality: ${beachData["WaterQuality"]}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
        ),

        // Wind Speed
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 50),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Wind Speed: ${beachData["WindSpeed"]}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
        ),

        // Tide Level
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 50),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Tide Level: ${beachData["TideLevel"]}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
