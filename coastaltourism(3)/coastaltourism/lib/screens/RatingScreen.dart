import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rating Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showRatingDialog(context),
          child: const Text('Rate Us'),
        ),
      ),
    );
  }

  void _showRatingDialog(BuildContext context) {
    final _dialog = RatingDialog(
      initialRating: 1.0,
      title: Text(
        'Rate This App',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
      message: Text(
        'We appreciate your feedback! Please rate us and leave a comment.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, color: Colors.grey),
      ),
      image: const CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('assets/app_icon.png'), // Replace with your app icon
      ),
      submitButtonText: 'Submit Rating',
      commentHint: 'Your feedback is important to us.',
      onCancelled: () => print('Rating dialog cancelled'),
      onSubmitted: (response) {
        print('Rating: ${response.rating}, Comment: ${response.comment}');
        if (response.rating < 3.0) {
          // Suggest to contact for issues if rating is low
          _showContactDialog(context);
        } else {
          // Proceed with a positive action like submitting the rating
          _rateAndReviewApp();
        }
      },
    );

    // Show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }

  void _rateAndReviewApp() {
    print('Thanks for the positive review!');
    // Add logic to handle the submission of the rating (e.g., saving to Firestore)
  }

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        title: const Text('Contact Us'),
        content: const Text(
          'We\'re sorry to hear you had a bad experience. Please contact us at support@example.com to resolve any issues.',
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RatingScreen(),
  ));
}
