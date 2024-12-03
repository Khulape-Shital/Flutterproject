import 'package:flutter/material.dart';
import 'package:coastaltourism/location.dart';
import 'package:coastaltourism/screens/data.dart';

class BeachInfoDisplay extends StatefulWidget {
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
  _BeachInfoDisplayState createState() => _BeachInfoDisplayState();
}

class _BeachInfoDisplayState extends State<BeachInfoDisplay> {
  Set<String> favoriteBeaches = {};

  @override
  Widget build(BuildContext context) {
    var stateData = widget.stateBeachesData
        .firstWhere((state) => state["Location"] == widget.selectedState);
    var beachData = stateData["Beaches"].firstWhere(
        (beach) => beach["BeachName"] == widget.selectedBeach);
    double latitude = beachData["Latitude"];
    double longitude = beachData["Longitude"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 121, 145, 189),
        title: Text(widget.selectedBeach),
        actions: [
          IconButton(
            icon: Icon(
              favoriteBeaches.contains(widget.selectedBeach)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: favoriteBeaches.contains(widget.selectedBeach)
                  ? Colors.red
                  : null,
            ),
            onPressed: () {
              setState(() {
                if (favoriteBeaches.contains(widget.selectedBeach)) {
                  favoriteBeaches.remove(widget.selectedBeach);
                } else {
                  favoriteBeaches.add(widget.selectedBeach);
                }
              });

              if (favoriteBeaches.contains(widget.selectedBeach)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteBeachScreen(beachData: beachData),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Beach Info:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            SizedBox(height: 8),

            // Beach Name
            _buildInfoTile('Beach Name: ${beachData["BeachName"]}'),

            // Wave Height
            _buildInfoTile('Wave Height: ${beachData["WaveHeight"]}'),

            // Water Quality
            _buildInfoTile('Water Quality: ${beachData["WaterQuality"]}'),

            // Wind Speed
            _buildInfoTile('Wind Speed: ${beachData["WindSpeed"]}'),

            // Tide Level
            _buildInfoTile('Tide Level: ${beachData["TideLevel"]}'),

            // Beach View with Navigation
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Beach View",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationScreen(
                              beachName: "${beachData["BeachName"]}",
                              Latitude: latitude,
                              Longitude: longitude,
                            ),
                          ),
                        );
                      },
                      child: Image.network(
                        "${beachData["img"]}",
                        height: 400,
                        width: 400,
                        fit: BoxFit.cover, // Ensures the image scales and fills the container
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoTile(String text) {
    return Padding(
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
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class FavoriteBeachScreen extends StatelessWidget {
  final Map<String, dynamic> beachData;

  const FavoriteBeachScreen({Key? key, required this.beachData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 121, 145, 189),
        title: Text("Favorite Beach"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Beach Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 16),

              // Beach Name
              _buildInfoTile(
                title: 'Beach Name',
                value: beachData["BeachName"],
                icon: Icons.beach_access,
              ),

              // Wave Height
              _buildInfoTile(
                title: 'Wave Height',
                value: '${beachData["WaveHeight"]} m',
                icon: Icons.waves,
              ),

              // Water Quality
              _buildInfoTile(
                title: 'Water Quality',
                value: beachData["WaterQuality"],
                icon: Icons.water_drop,
              ),

              // Wind Speed
              _buildInfoTile(
                title: 'Wind Speed',
                value: '${beachData["WindSpeed"]} km/h',
                icon: Icons.air,
              ),

              // Tide Level
              _buildInfoTile(
                title: 'Tide Level',
                value: '${beachData["TideLevel"]} m',
                icon: Icons.thermostat,
              ),

              // Optional Image
              if (beachData.containsKey("img"))
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      beachData["img"],
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 28, color: Colors.blueAccent),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
