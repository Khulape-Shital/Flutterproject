import 'package:flutter/material.dart';

class FavoriteBeachesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteBeaches;

  FavoriteBeachesScreen({required this.favoriteBeaches});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Beaches'),
        backgroundColor: Colors.blue,
      ),
      body: favoriteBeaches.isEmpty
          ? Center(child: Text('No favorite beaches yet!'))
          : ListView.builder(
              itemCount: favoriteBeaches.length,
              itemBuilder: (context, index) {
                final favorite = favoriteBeaches[index];
                return Card(
                  child: ListTile(
                    title: Text(favorite["beach"]["BeachName"]),
                    subtitle: Text('State: ${favorite["state"]}'),
                  ),
                );
              },
            ),
    );
  }
}
