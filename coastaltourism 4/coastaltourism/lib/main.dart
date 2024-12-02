import 'package:coastaltourism/screens/BeachSelectionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:coastaltourism/screens/faverate.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the local notification plugin
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BeachSelectionScreen(
        stateBeachesData: [
          {
            "Location": "Goa",
            "Beaches": [
              {
                "BeachName": "Baga Beach",
                "WaveHeight": "1.5m",
                "WaterQuality": "Excellent",
                "WindSpeed": "12 km/h",
                "TideLevel": "High"
              },
              {
                "BeachName": "Calangute Beach",
                "WaveHeight": "1.2m",
                "WaterQuality": "Good",
                "WindSpeed": "10 km/h",
                "TideLevel": "Low"
              },
            ]
          },
          {
            "Location": "Kerala",
            "Beaches": [
              {
                "BeachName": "Varkala Beach",
                "WaveHeight": "1.8m",
                "WaterQuality": "Excellent",
                "WindSpeed": "15 km/h",
                "TideLevel": "High"
              },
            ]
          },
        ],
      ),
    );
  }
}
