import 'package:coastaltourism/screens/faverate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:coastaltourism/screens/faverate.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class BeachSelectionScreen extends StatefulWidget {
  final List<Map<String, dynamic>> stateBeachesData;

  BeachSelectionScreen({required this.stateBeachesData});

  @override
  _BeachSelectionScreenState createState() => _BeachSelectionScreenState();
}

class _BeachSelectionScreenState extends State<BeachSelectionScreen> {
  String? selectedState;
  String? selectedBeach;
  List<Map<String, dynamic>> favoriteBeaches = [];

  Future<void> showNotification(String beachName) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'beach_channel',
      'Beach Notifications',
      channelDescription: 'Notifications about selected beaches',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Added to Favorites!',
      '$beachName is now in your favorite list.',
      notificationDetails,
    );
  }

  void addToFavorites(String state, Map<String, dynamic> beach) {
    setState(() {
      favoriteBeaches.add({
        "state": state,
        "beach": beach,
      });
    });
    showNotification(beach['BeachName']);
  }

  @override
  Widget build(BuildContext context) {
    List<String> states = widget.stateBeachesData.map((e) => e["Location"] as String).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Beach'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              isExpanded: true,
              hint: Text('Select State'),
              value: selectedState,
              onChanged: (newValue) {
                setState(() {
                  selectedState = newValue;
                  selectedBeach = null;
                });
              },
              items: states.map((state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
            ),
            SizedBox(height: 16),

            if (selectedState != null)
              DropdownButton<String>(
                isExpanded: true,
                hint: Text('Select Beach'),
                value: selectedBeach,
                onChanged: (newValue) {
                  setState(() {
                    selectedBeach = newValue;
                  });
                },
                items: widget.stateBeachesData
                    .firstWhere((state) => state["Location"] == selectedState)["Beaches"]
                    .map<DropdownMenuItem<String>>((beach) {
                  return DropdownMenuItem<String>(
                    value: beach["BeachName"],
                    child: Text(beach["BeachName"]),
                  );
                }).toList(),
              ),
            SizedBox(height: 16),

            if (selectedBeach != null)
              Column(
                children: [
                  BeachInfoDisplay(
                    selectedState: selectedState!,
                    selectedBeach: selectedBeach!,
                    stateBeachesData: widget.stateBeachesData,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      var beachData = widget.stateBeachesData
                          .firstWhere((state) => state["Location"] == selectedState)["Beaches"]
                          .firstWhere((beach) => beach["BeachName"] == selectedBeach);

                      addToFavorites(selectedState!, beachData);
                    },
                    child: Text("Add to Favorites"),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: 0,
        onTap: (i) {
          if (i == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoriteBeachesScreen(favoriteBeaches: favoriteBeaches),
              ),
            );
          }
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class BeachInfoDisplay extends StatelessWidget {
  final String selectedState;
  final String selectedBeach;
  final List<Map<String, dynamic>> stateBeachesData;

  const BeachInfoDisplay({
    required this.selectedState,
    required this.selectedBeach,
    required this.stateBeachesData,
  });

  @override
  Widget build(BuildContext context) {
    var stateData = stateBeachesData.firstWhere((state) => state["Location"] == selectedState);
    var beachData = stateData["Beaches"].firstWhere((beach) => beach["BeachName"] == selectedBeach);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Beach Name: ${beachData["BeachName"]}'),
        Text('Wave Height: ${beachData["WaveHeight"]}'),
        Text('Water Quality: ${beachData["WaterQuality"]}'),
        Text('Wind Speed: ${beachData["WindSpeed"]}'),
        Text('Tide Level: ${beachData["TideLevel"]}'),
      ],
    );
  }
}
