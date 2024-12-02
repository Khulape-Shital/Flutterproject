import 'package:coastaltourism/location.dart';
import 'package:coastaltourism/screens/BeachSelectionScreen.dart';
import 'package:coastaltourism/screens/RatingScreen.dart';
import 'package:coastaltourism/screens/classes.dart'; // Assuming you have this class
import 'package:coastaltourism/screens/data.dart';
import 'package:coastaltourism/screens/demo.dart';
import 'package:coastaltourism/screens/progilescreen.dart';
import 'package:coastaltourism/screens/screenhome.dart';
import 'package:coastaltourism/screens/screenlogin.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:coastaltourism/screens/screen2.dart';

class Screen1 extends StatefulWidget {
  final String title;
  final String username;

  List beachesinfo;
  Screen1(
      {Key? key,
      required this.title,
      required this.username,
      required this.beachesinfo})
      : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  TextEditingController searchPlacesController = TextEditingController();
  static category c1 = category("Most Viewed");
  static category c2 = category("Nearby");
  static category c3 = category("Most Safe");
  static category c4 = category("Popular");

  List<category> type = [c1, c2, c3, c4];

  static images i1 = images(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8zsFKbY1qcz_t5B5NjC76SsWqRDxRSuvEnVEYJ9Gxm01hbWcyt63wqC683s_j_ABR_0s&usqp=CAU",
      "Varkala Beach ",
      "Varkala Beach, located in Kerala, is renowned for its stunning cliffs that rise dramatically above the Arabian Sea. Known for its tranquil atmosphere, the beach offers clear waters ideal for swimming, sunbathing, and surfing. It is also famous for its Ayurvedic treatments and the Papanasam Beach, considered sacred for ritual bathing.",
      {
        "BeachName": "Varkala Beach",
        "WaveHeight": "1–1.5 meters (moderate waves)",
        "WaterQuality": "Good (clear water, low pollution)",
        "WindSpeed": "10–15 km/h (light breeze)",
        "TideLevel": "High tide: 1.5 meters, Low tide: 0.6 meters"
      });

  static images i2 = images(
    "https://st2.depositphotos.com/1003348/10192/i/950/depositphotos_101921828-stock-photo-the-indian-ocean-vertical-panorama.jpg",
    "Kihim Beach",
    "Kihim Beach, near Alibaug in Maharashtra, is known for its natural beauty and peaceful atmosphere. Surrounded by coconut trees, it offers a serene escape with clean sands and shallow waters, making it ideal for swimming and picnics. Famous for its biodiversity, the beach attracts nature lovers, especially bird and butterfly enthusiasts.",
    {
      "BeachName": "Kihim Beach",
      "WaveHeight": "0.5–1 meter (gentle waves)",
      "WaterQuality": "Good (clean sands, low pollution)",
      "WindSpeed": "8–12 km/h (light breeze)",
      "TideLevel": "High tide: 1.2 meters, Low tide: 0.5 meters"
    },
  );
  static images i3 = images(
    "https://media.istockphoto.com/id/154962918/photo/sunrise-candolim-beach-goa.jpg?s=612x612&w=0&k=20&c=_oR-FGa9zznaUCItNO7RggDTqhSmJyZFuLvDqS6P-jM=",
    "Baga Beach",
    "Baga Beach, located in North Goa, is renowned for its lively ambiance, water sports, and vibrant nightlife. Offering activities like parasailing and jet skiing, it’s a hub for adventure seekers. The beach's numerous shacks and restaurants, along with nearby nightclubs, make Baga a popular destination for both relaxation and partying..",
    {
      "BeachName": "Baga Beach",
      "WaveHeight": "1–2 meters (moderate waves)",
      "WaterQuality": "Good (clear water, moderate pollution)",
      "WindSpeed": "12–20 km/h (moderate breeze)",
      "TideLevel": "High tide: 1.5 meters, Low tide: 0.6 meters"
    },
  );
  static images i4 = images(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSOcWJGdbdk29A2XT4QRiPHUcp1GFXbytVDi7L1CrTkM7jpvf7aZBeZfTlA42oYmCoJxI&usqp=CAU",
    "Juhu Beach",
    "Juhu Beach, located in Mumbai, is one of the city's most iconic beaches. Known for its lively atmosphere, it offers scenic sunset views, street food, and local vendors. While the water quality is often compromised by urban pollution, it remains a popular spot for evening strolls and relaxation.",
    {
      "BeachName": "Juhu Beach",
      "WaveHeight": "0.5–1 meter (gentle waves)",
      "WaterQuality": "Fair (urban pollution, crowded area)",
      "WindSpeed": "8–15 km/h (light breeze)",
      "TideLevel": "High tide: 1 meter, Low tide: 0.4 meters"
    },
  );
  static images i5 = images(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmJzYZBBiS6xTL8L5ALt4jpVJPfGOhUyKW8No9VpGH1niYO88WCa56qxbCADu6EGeNGHc&usqp=CAU",
      "Marina Beach",
      "Marina Beach in Chennai, Tamil Nadu, is one of the longest urban beaches globally, stretching 13 km. Known for its lively atmosphere, it features scenic walks, iconic landmarks like Victory War Memorial, and local snacks. Though swimming is discouraged, it’s perfect for sunset views and enjoying Chennai’s coastal charm.",
      {
        "BeachName": "Marina Beach",
        "WaveHeight": "1–1.5 meters (moderate waves)",
        "WaterQuality": "Fair (high urban pollution)",
        "WindSpeed": "12–18 km/h (moderate breeze)",
        "TideLevel": "High tide: 1.3 meters, Low tide: 0.5 meters"
      });
  static images i6 = images(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3Yjh00cAmExP7oO2hqQHBn0n6o5hwQECKiRvfGTQDPDHpxpKquV4m1kgKp8jDolkzg-U&usqp=CAU",
      "Puri Beach",
      "Puri Beach, along the Bay of Bengal in Odisha, is famous for its religious significance and golden sands. Close to the Jagannath Temple, it attracts pilgrims and tourists. The beach is known for its gentle waves, sunrise views, and the annual Puri Beach Festival, showcasing local culture and sand art.",
      {
        "BeachName": "Puri Beach",
        "WaveHeight": "1.5–2 meters (moderate to high waves)",
        "WaterQuality":
            "Fair (good for religious activities, but some pollution)",
        "WindSpeed": "10–15 km/h (light breeze)",
        "TideLevel": "High tide: 1.7 meters, Low tide: 0.6 meters"
      });

  static images i7 = images(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvXSuO_KY8uaLFATvWR8ywLyp-UnMwXKZ3JQ&s",
      "Kovalam Beach",
      "Kovalam Beach, near Thiruvananthapuram, Kerala, is known for its crescent-shaped coastline with three main beaches: Lighthouse Beach, Hawa Beach, and Samudra Beach. Famous for its lighthouse and calm waters, it’s ideal for swimming, surfing, and Ayurveda treatments. The beach offers scenic views, vibrant resorts, and cafes.",
      {
        "BeachName": "Kovalam Beach",
        "WaveHeight": "1–2 meters (moderate waves)",
        "WaterQuality": "Good (clear, calm waters)",
        "WindSpeed": "10–15 km/h (light breeze)",
        "TideLevel": "High tide: 1.5 meters, Low tide: 0.6 meters"
      });

  static images i8 = images(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-HF43L9bAjMCmDxs0i8ijx6JuP--TAfzQksJsslyJq7YGZbt2G4dqN7Okzzc5Ic-XU68&usqp=CAU",
      "Elephant Beach",
      "Elephant Beach, located on Havelock Island, Andaman, is renowned for its clear waters and rich marine life. Popular for snorkeling and scuba diving, the beach offers vibrant coral reefs and diverse fish species. Its shallow waters and serene atmosphere make it ideal for relaxation and water sports in a tranquil setting.",
      {
        "BeachName": "Elephant Beach",
        "WaveHeight": "0.5–1 meter (gentle waves)",
        "WaterQuality":
            "Excellent (crystal-clear waters, great for snorkeling)",
        "WindSpeed": "8–12 km/h (light breeze)",
        "TideLevel": "High tide: 1 meter, Low tide: 0.4 meters"
      });

  List image = [i1, i2, i3, i4, i5, i6, i7, i8];

  int _selectedIndex = 0;
  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var List1 = [Screenlogin()];
  var _currentIndex = 0;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _offsetAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<Offset>(begin: Offset(1.5, 0), end: Offset(-1.5, 0)),
        weight: 50, // Move from right to left
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(begin: Offset(-1.5, 0), end: Offset(1.5, 0)),
        weight: 50, // Move back from left to right
      ),
    ]).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward().whenComplete(() => _controller.stop());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                color: const Color.fromARGB(255, 4, 58, 103),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZO8GPm0phbELvMAA6QsEOYilHs0Fnmq3k2w&s",
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.username,
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                            )));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
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
                            )));
              },
            ),
            ListTile(
              leading: Icon(Icons.star_rate),
              title: Text("Ratings"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RatingScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Screenlogin()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Text(
                    widget.username,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZO8GPm0phbELvMAA6QsEOYilHs0Fnmq3k2w&s"),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 20),
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
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>Location()));
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
              SlideTransition(
                position: _offsetAnimation,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 10, 67, 129), // Background color
                    foregroundColor: Colors.white, // Text color
                    elevation: 5, // Shadow depth
                    padding: EdgeInsets.only(right: 15), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    shadowColor: Colors.black.withOpacity(0.5), // Shadow color
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BeachSelectionScreen(stateBeachesData: beaches),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Select a Beach',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
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
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: type.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.grey,
                      ),
                      child: Center(
                        child: Text(
                          "${type[index].types}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: Container(
                        width: 250,
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
                              // Image goes here
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Screen2(
                                        beachName: image[index].beachName,
                                        beachInfo: image[index].beachInfo,
                                        ontapImage: image[index].beachImages,
                                        details: image[index].details,
                                      ),
                                    ),
                                  );
                                },
                                child: Image.network(
                                  image[index].beachImages,
                                  width:
                                      250, // Ensure the width matches the container
                                  height: 400, // Fixed height for the image
                                  fit: BoxFit
                                      .cover, // Ensure the image maintains aspect ratio
                                ),
                              ),
                              // Text overlay goes here
                              Positioned(
                                bottom: 0, // Position text at the bottom
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.black.withOpacity(
                                      0.5), // Semi-transparent background

                                  child: Text(
                                    image[index].beachName,
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
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.grey,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RatingScreen()));
                },
                child: Text("Likes")),
            selectedColor: Colors.grey,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              BeachSelectionScreen(stateBeachesData: beaches)));
                },
                child: Text("Search")),
            selectedColor: Colors.grey,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
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
                                  builder: (context) => ProfilePage()));
                        },
                        child: Text("Profile")))),
            selectedColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
