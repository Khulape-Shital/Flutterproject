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
    var stateData = stateBeachesData.firstWhere((state) => state["Location"] == selectedState);
    var beachData = stateData["Beaches"].firstWhere((beach) => beach["BeachName"] == selectedBeach);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Beach Info:', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Beach Name: ${beachData["BeachName"]}'),
        Text('Wave Height: ${beachData["WaveHeight"]}'),
        Text('Water Quality: ${beachData["WaterQuality"]}'),
        Text('Wind Speed: ${beachData["WindSpeed"]}'),
        Text('Tide Level: ${beachData["TideLevel"]}'),
      ],
    );
  }
}
