import 'package:coastaltourism/location.dart';
import 'package:coastaltourism/screens/BeachSelectionScreen.dart';
import 'package:coastaltourism/screens/RatingScreen.dart' as rating;
import 'package:coastaltourism/screens/classes.dart'; // Assuming you have this class
import 'package:coastaltourism/screens/data.dart';
import 'package:coastaltourism/screens/demo.dart';
import 'package:coastaltourism/screens/hotels.dart';
import 'package:coastaltourism/screens/progfilescreen.dart';
import 'package:coastaltourism/screens/screenhome.dart';
import 'package:coastaltourism/screens/screenlogin.dart';

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:coastaltourism/screens/screen2.dart';
import 'package:coastaltourism/screens/services/firebase_service.dart'
    as firebase;

class Screen1 extends StatefulWidget {
  final String title;
  final String username;
  final String password;
  List beachesinfo;
  String imageUrl;
  Screen1(
      {Key? key,
      required this.title,
      required this.username,
      required this.password,
      required this.beachesinfo,
      required this.imageUrl})
      : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  final firebase.FirebaseService _firebaseService = firebase.FirebaseService();

  // Function to log out the user
  Future<void> _logOut(BuildContext context) async {
    try {
      await _firebaseService.deleteUserData(widget.username);

      // Navigate back to the login screen
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Screenlogin()),
        (route) => false, // Remove all previous routes
      );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Logged out and data deleted successfully."),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("An error occurred: $e"),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  TextEditingController searchPlacesController = TextEditingController();

  int _selectedIndex = 0;
  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var List1 = [Screenlogin()];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 121, 145, 189),
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 121, 145, 189),
        shadowColor: Colors.grey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 101, 134, 195),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(widget.imageUrl),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.username,
                    style: TextStyle(
                        color: const Color.fromARGB(255, 12, 12, 12),
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Screen1(
                              username: widget.username,
                              title: widget.title,
                              beachesinfo: beaches,
                              password: widget.password,
                              imageUrl: widget.imageUrl,
                            )));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.beach_access),
              title: Text("Beach Selection"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BeachSelectionScreen(
                              stateBeachesData: beaches,
                              username: widget.username,
                              imageUrl: widget.imageUrl,
                              title: widget.title,
                              password: widget.password,
                              beachesinfo: widget.beachesinfo,
                            )));
              },
            ),
            ListTile(
              leading: Icon(Icons.star_rate),
              title: Text("Ratings"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => rating.RatingScreen(
                              username: widget.username,
                              imageUrl: widget.imageUrl,
                            )));
              },
            ),
            ListTile(
              onTap: () => _logOut(context), // Trigger logout on tap
              leading: Icon(Icons.logout),
              title: Text(
                "Log out",
              ),
            )
          ],
        ),
      ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(1000)),
                            image: DecorationImage(
                                image: NetworkImage(widget.imageUrl),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.username,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 12, 12, 12),
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HotelSelectionScreen(hotelData: hotels)));
                      },
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://st5.depositphotos.com/28052602/68548/v/450/depositphotos_685484318-stock-illustration-vector-illustration-design-house-mountains.jpg"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Explore the world",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 35, 35, 35),
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocationScreen(
                                      beachName: "india",
                                      Latitude: 20.5937,
                                      Longitude: 78.9629)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkyVe8gVv_sFehsfJQ9echU2An2zmd91BnkBEJ91sDrjfanuvnbghRFkuleEKJHxc-d3M&usqp=CAU"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular Beach",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "view all",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: popular.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        width: 350,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset: Offset(3, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Stack(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Screen2(
                                        popularBeachData: popular[index],
                                        imageUrl: widget.imageUrl,
                                      ),
                                    ),
                                  );
                                },
                                child: Image.network(
                                  popular[index]["img"],
                                  width: 350,
                                  height: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.black.withOpacity(0.5),
                                  child: Text(
                                    popular[index]["BeachName"],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Screen1(
                                title: widget.title,
                                username: widget.username,
                                password: widget.password,
                                beachesinfo: widget.beachesinfo,
                                imageUrl: widget.imageUrl,
                              )));
                },
                child: Text("Home")),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => rating.RatingScreen(
                                username: widget.username,
                                imageUrl: widget.imageUrl,
                              )));
                },
                child: Text("Likes")),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BeachSelectionScreen(
                                stateBeachesData: beaches,
                                username: widget.username,
                                imageUrl: widget.imageUrl,
                                title: widget.title,
                                password: widget.password,
                                beachesinfo: widget.beachesinfo,
                              )));
                },
                child: Text("Search")),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZO8GPm0phbELvMAA6QsEOYilHs0Fnmq3k2w&s"))),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()));
                        },
                        child: Text("Profile")))),
            selectedColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
