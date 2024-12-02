import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingScreen extends StatelessWidget {
  final FirebaseService firebaseService = FirebaseService();
  final String username;  // Add the user ID here

  RatingScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate Us'),
        backgroundColor: Color.fromARGB(255, 121, 145, 189),
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage("https://example.com/app_icon.png"), // Replace with your app icon
              ),
              const SizedBox(height: 20),
              const Text(
                'Enjoying our App?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 11, 80, 159),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'We would love to hear your feedback!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 11, 80, 159),
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  shadowColor: const Color.fromARGB(255, 11, 80, 159),
                  elevation: 5,
                ),
                onPressed: () => _showRatingDialog(context),
                child: const Text(
                  'Rate Our App',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRatingDialog(BuildContext context) {
    final _dialog = RatingDialog(
      initialRating: 3.0,
      title: Text(
        'Rate This App',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 11, 80, 159),
        ),
      ),
      message: Text(
        'Tap on a star to rate us and leave a comment below.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
      image: const CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('assets/app_icon.png'), // Replace with your app icon
      ),
      submitButtonText: 'Submit',
      commentHint: 'Write your feedback...',
      onCancelled: () => print('Rating dialog cancelled'),
      onSubmitted: (response) async {
        await firebaseService.storeRating(username, response.rating, response.comment);
        print('Rating and comment submitted');

        // Show confirmation message with SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Your response has been recorded!'),
            backgroundColor: const Color.fromARGB(255, 11, 80, 159),
            duration: Duration(seconds: 2),
          ),
        );
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _dialog,
    );
  }
}
class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> storeRating(String username, double rating, String comment) async {
    try {
      await _firestore.collection('ratings').add({
        'userId': username,  // Store the user ID
        'rating': rating,
        'comment': comment,
        'timestamp': Timestamp.now(),
      });
      print("Rating and comment saved successfully.");
    } catch (e) {
      print("Failed to save rating: $e");
    }
  }
}
