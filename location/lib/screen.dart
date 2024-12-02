import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  // Define initial camera position
  static const CameraPosition _kInitialPosition = CameraPosition(
    target: LatLng(37.7749, -122.4194), // Example coordinates (San Francisco)
    zoom: 12,
  );

  // Marker ID and position for the map
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('marker_1'),
      position: LatLng(37.7749, -122.4194),
      infoWindow: InfoWindow(
        title: 'San Francisco',
        snippet: 'This is a popular location!',
      ),
    ),
  };

  // Function to handle map creation
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Example'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: _kInitialPosition,
        markers: _markers,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MapScreen(),
  ));
}
