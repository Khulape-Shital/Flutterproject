import 'package:codexadmin/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Import Firebase options for platform-specific initialization
import 'package:codexadmin/screens/loginscreen.dart'; // Import your home screen

void main() async {
  // Ensures that Flutter widgets are bound before calling asynchronous methods
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase before running the app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app after Firebase initialization
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, // Using Material 3 design language
      ),
      home: HomeScreen(), // Set HomeScreen as the starting screen
    );
  }
}
