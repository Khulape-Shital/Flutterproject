import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationScreen extends StatelessWidget {
  final String beachName;
  final double Latitude;
  final double Longitude;

  const LocationScreen({
    Key? key,
    required this.beachName,
    required this.Latitude,
    required this.Longitude,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(beachName),
        backgroundColor:  Color.fromARGB(255, 121, 145, 189),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(Latitude, Longitude), // Center the map at the selected beach
          initialZoom: 15.0, // Set the zoom level for better visibility
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.coastaltourism',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(Latitude, Longitude), // Place marker at selected beach
                width: 40.0,
                height: 40.0,
                child: const Icon(
                  Icons.beach_access,
                  size: 40.0,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
