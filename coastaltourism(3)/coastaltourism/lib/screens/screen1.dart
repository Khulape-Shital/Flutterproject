import 'package:coastaltourism/screens/classes.dart'; // Assuming you have this class
import 'package:coastaltourism/screens/demo.dart';
import 'package:coastaltourism/screens/screenhome.dart';
import 'package:coastaltourism/screens/screenlogin.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:coastaltourism/screens/screen2.dart';
class Screen1 extends StatefulWidget {
  // static final title = 'salomon_bottom_bar';
  final String title;
  final String username;
  final String password;
  const Screen1({Key? key, required this.title, required this.username,required this.password})
      : super(key: key);
 
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController searchPlacesController = TextEditingController();
  static category c1 = category("Most Viewed");
  static category c2 = category("Nearby");
  static category c3 = category("Most Safe");
  static category c4 = category("Latest");
  static category c5 = category("Most Viewed");

  List<category> type = [c1, c2, c3, c4, c5];

  static images i1 = new images(
      "https://www.shutterstock.com/image-photo/travel-tourism-conceptual-photo-tropical-260nw-2300906515.jpg");
  static images i2 = new images(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROjhcGHDk9dcw8lVdvDIfgHy8aFeczppi4ciX5LjCUpouwxoLmDnEvMWGpVUY7aNmpvNA&usqp=CAU");
  static images i3 = new images(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROjhcGHDk9dcw8lVdvDIfgHy8aFeczppi4ciX5LjCUpouwxoLmDnEvMWGpVUY7aNmpvNA&usqp=CAU");
  static images i4 = new images(
      "https://www.shutterstock.com/image-photo/travel-tourism-conceptual-photo-tropical-260nw-2300906515.jpg");
  static images i5 =
      new images("https://www.shutterstock.com/image-photo/travel-tourism-conceptual-photo-tropical-260nw-2300906515.jpg");
  static images i6 = new images(
      "https://www.shutterstock.com/image-photo/travel-tourism-conceptual-photo-tropical-260nw-2300906515.jpg");

  List beaches = [i1, i2, i3, i4, i5, i6];

  
  
  int _selectedIndex = 0;
  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  var List1 = [Screenlogin(), ];
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                              "https://static.vecteezy.com/system/resources/thumbnails/001/840/612/small_2x/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg"))),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 20),
              child: Text(
                "Explore the world",
                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: searchPlacesController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: "Search Places",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        // Add search functionality here
                      },
                      child: Icon(Icons.search, color: Colors.grey),
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
                    "Popular Places",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "view all",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            // Wrap ListView.builder with SizedBox to specify height
            SizedBox(
              height: 50, // You can adjust this height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: type.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Text(
                        "${type[index].types}", // Assuming 'name' is a property of 'category'
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              
  height: 360, // You can adjust this height
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: beaches.length,
    itemBuilder: (context, index) {
      return Padding(
        
        padding: EdgeInsets.all(20), // Adjust the padding here
        child: Container(
          width: 200,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
                spreadRadius: 5, // How much the shadow spreads
                blurRadius: 4, // Blur effect
                offset: Offset(3, 5), // Position of the shadow (x, y)
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Apply border radius to the image
           
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2(ontapImage: beaches[index].beachImages,)));
                },
                child: Image.network(
                  beaches[index].beachImages,
                  width: 200, // Ensure the width of the image matches the container
                  height: 300, // Ensure the height of the image matches the container
                  fit: BoxFit.cover, // Make the image cover the container fully
                ),
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
        
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.grey,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.grey,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
              selectedColor: Colors.grey,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.grey,
            ),
          ],
    ));
    
  }
}
