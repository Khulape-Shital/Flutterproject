import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';  // Import flutter_map package
import 'package:latlong2/latlong.dart';  // Import latlong2 for LatLng

class CustomCrsPage extends StatelessWidget {
  const CustomCrsPage({super.key});

  static const route = '/custom_crs';  // Define the route

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom CRS Page'),
      ),
      body: FlutterMap(
        options: MapOptions(
          crs: Epsg3857(),  // Use a default or custom CRS here
          center: LatLng(51.5074, 0.1278),  // Define the center of the map
          zoom: 10,  // Set the zoom level
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',  // Define the tile URL template
            subdomains: ['a', 'b', 'c'],  // Subdomains for tile servers
          ),
        ],
      ),
    );
  }
}
