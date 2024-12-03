import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RatingStars extends StatelessWidget {
  final double rating; // Rating value (e.g., 3.5, 4.0, etc.)
  final int maxRating; // Maximum number of stars (typically 5)

  RatingStars({required this.rating, this.maxRating = 5});

  @override
  Widget build(BuildContext context) {
    // Calculate the number of full stars
    int fullStars = rating.floor();
    // Check if there should be a half star
    bool hasHalfStar = rating - fullStars >= 0.5;
    // Calculate the number of empty stars
    int emptyStars = maxRating - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Display full stars
        for (var i = 0; i < fullStars; i++) Icon(Icons.star, color: Colors.yellow),
        // Display half star if necessary
        if (hasHalfStar) Icon(Icons.star_half, color: Colors.yellow),
        // Display empty stars
        for (var i = 0; i < emptyStars; i++) Icon(Icons.star_border, color: Colors.yellow),
      ],
    );
  }
}

class RatingScreen extends StatefulWidget {
  final FirebaseService firebaseService = FirebaseService();
  final String username; 
  String imageUrl;

  RatingScreen({required this.username, required this.imageUrl});

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  late Future<List<Map<String, dynamic>>> _ratings;

  @override
  void initState() {
    super.initState();
    _ratings = widget.firebaseService.getRatings(); // Fetch ratings when screen loads
  }

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
                backgroundImage: NetworkImage(widget.imageUrl),
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
              const SizedBox(height: 30),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _ratings,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final rating = snapshot.data![index];
                          return ListTile(
                            title: Text('${rating['userId']}'),
                            subtitle: Text('${rating['comment']}'),
                            trailing: RatingStars(rating: rating['rating']), // Display stars
                          );
                        },
                      ),
                    );
                  } else {
                    return Text('No ratings yet!');
                  }
                },
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
      image: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(widget.imageUrl),
      ),
      submitButtonText: 'Submit',
      commentHint: 'Write your feedback...',
      onCancelled: () => print('Rating dialog cancelled'),
      onSubmitted: (response) async {
        await widget.firebaseService.storeRating(widget.username, response.rating, response.comment);
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

  // Store the rating and comment in Firestore
  Future<void> storeRating(String username, double rating, String comment) async {
    try {
      await _firestore.collection('ratings').add({
        'userId': username,
        'rating': rating,
        'comment': comment,
        'timestamp': Timestamp.now(),
      });
      print("Rating and comment saved successfully.");
    } catch (e) {
      print("Failed to save rating: $e");
    }
  }

  // Fetch all ratings from Firestore
  Future<List<Map<String, dynamic>>> getRatings() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection('ratings').get();
      return snapshot.docs.map((doc) {
        return {
          'userId': doc['userId'],  // If it's stored as 'username'
          'rating': doc['rating'],
          'comment': doc['comment'],
        };
      }).toList();
    } catch (e) {
      print("Failed to fetch ratings: $e");
      return [];
    }
  }
}
