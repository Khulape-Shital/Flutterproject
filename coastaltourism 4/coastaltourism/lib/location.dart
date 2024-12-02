import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class AnjunaBeachScreen extends StatefulWidget {
  const AnjunaBeachScreen({super.key});

  @override
  State<AnjunaBeachScreen> createState() => _AnjunaBeachScreenState();
}

class _AnjunaBeachScreenState extends State<AnjunaBeachScreen> {
  static const double _initialZoom = 15.0;
  final LatLng _anjunaCenter = LatLng(15.5363, 73.7807); // Coordinates of Anjuna Beach

  @override
  Widget build(BuildContext context) {
    // Print the center and zoom for debugging
    print(_anjunaCenter); // Should print LatLng(15.5363, 73.7807)
    print(_initialZoom);  // Should print 15.0

    return Scaffold(
      appBar: AppBar(
        title: const Text("Anjuna Beach, Goa"),
        backgroundColor: Colors.teal,
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: _anjunaCenter, // Center of the map at Anjuna Beach
          initialZoom: _initialZoom,    // Zoom level focused on Anjuna Beach
          onTap: (tapPosition, point) {
            _onMapTap(point);  // Handle map tap
          },
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.coastaltourism',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: _anjunaCenter, // Marker for Anjuna Beach
                width: 40.0,
                height: 40.0,
                child: GestureDetector(
                  onTap: () => _onMarkerTap(), // Show dialog when marker is tapped
                  child: const Icon(
                    Icons.beach_access,
                    size: 40.0,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onMarkerTap() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Anjuna Beach"),
          content: const Text(
            "Anjuna Beach is one of the most popular beaches in Goa, known for its vibrant atmosphere, nightlife, and scenic beauty. It's a great spot for relaxing and enjoying the beach vibes.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _onMapTap(LatLng point) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("You tapped on the map at: ${point.latitude}, ${point.longitude}"),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
