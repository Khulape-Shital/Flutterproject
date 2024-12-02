import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:dio/dio.dart';

class BeachMapScreen extends StatefulWidget {
  @override
  _BeachMapScreenState createState() => _BeachMapScreenState();
}

class _BeachMapScreenState extends State<BeachMapScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentLocation;
  Marker? _destinationMarker;
  List<LatLng> _routePoints = [];
  final _searchController = TextEditingController();
  final String _apiKey = "YOUR_API_KEY";

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future<void> _getUserLocation() async {
    Location location = Location();
    LocationData locData = await location.getLocation();
    setState(() {
      _currentLocation = LatLng(locData.latitude!, locData.longitude!);
    });
  }

  Future<void> _searchAndNavigate() async {
    if (_searchController.text.isEmpty) return;

    String placeName = _searchController.text;
    try {
      final response = await Dio().get(
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json',
        queryParameters: {
          'input': placeName,
          'inputtype': 'textquery',
          'fields': 'geometry',
          'key': _apiKey,
        },
      );

      if (response.data['candidates'].isNotEmpty) {
        final location = response.data['candidates'][0]['geometry']['location'];
        LatLng destinationLatLng = LatLng(location['lat'], location['lng']);
        setState(() {
          _destinationMarker = Marker(
            markerId: MarkerId('destination'),
            position: destinationLatLng,
          );
        });
        _mapController?.animateCamera(CameraUpdate.newLatLng(destinationLatLng));
        _getRouteToDestination(destinationLatLng);
      }
    } catch (e) {
      print('Error searching for place: $e');
    }
  }

  Future<void> _getRouteToDestination(LatLng destination) async {
    if (_currentLocation == null) return;

    try {
      final response = await Dio().get(
        'https://maps.googleapis.com/maps/api/directions/json',
        queryParameters: {
          'origin': '${_currentLocation!.latitude},${_currentLocation!.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': _apiKey,
        },
      );

      if (response.data['routes'].isNotEmpty) {
        List<LatLng> points = _decodePolyline(response.data['routes'][0]['overview_polyline']['points']);
        setState(() {
          _routePoints = points;
        });
      }
    } catch (e) {
      print('Error fetching directions: $e');
    }
  }

  List<LatLng> _decodePolyline(String polyline) {
    List<LatLng> points = [];
    int index = 0, len = polyline.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beach Finder'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Enter beach name",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchAndNavigate,
                ),
              ),
            ),
          ),
          Expanded(
            child: _currentLocation == null
                ? Center(child: CircularProgressIndicator())
                : GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentLocation!,
                      zoom: 12,
                    ),
                    onMapCreated: (controller) {
                      _mapController = controller;
                    },
                    markers: {
                      if (_destinationMarker != null) _destinationMarker!,
                    },
                    polylines: {
                      if (_routePoints.isNotEmpty)
                        Polyline(
                          polylineId: PolylineId('route'),
                          points: _routePoints,
                          color: Colors.blue,
                          width: 5,
                        ),
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
