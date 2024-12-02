import 'package:flutter/material.dart';
import 'package:location/CustomCrsPage.dart';
import 'package:location/MapControllerPage.dart';
import 'package:location/PolylinePage.dart';
import 'package:location/BundledOfflineMapPage.dart';
import 'package:location/ManyCirclesPage.dart';
import 'package:location/screen.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy(); // Ensures clean URLs
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_map Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF8dea88),
      ),
      home: MapScreen(), // Landing page
      routes: <String, WidgetBuilder>{
        CustomCrsPage.route: (context) => const CustomCrsPage(),
        PolylinePerfStressPage.route: (context) => const PolylinePerfStressPage(),
        MapControllerPage.route: (context) => const MapControllerPage(),
        BundledOfflineMapPage.route: (context) => const BundledOfflineMapPage(),
        ManyCirclesPage.route: (context) => const ManyCirclesPage(),
        // Add any other pages you need to navigate to
      },
    );
  }
}
