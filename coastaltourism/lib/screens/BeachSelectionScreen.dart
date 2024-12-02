import 'package:coastaltourism/screens/BeachInfoDisplay.dart';
import 'package:coastaltourism/screens/RatingScreen.dart';
import 'package:coastaltourism/screens/progilescreen.dart'; 
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BeachSelectionScreen extends StatefulWidget {
  final List<Map<String, dynamic>> stateBeachesData;
  String username;
  String imageUrl;

  BeachSelectionScreen({required this.stateBeachesData,required this.username,required this.imageUrl});

  @override
  _BeachSelectionScreenState createState() => _BeachSelectionScreenState();
}

class _BeachSelectionScreenState extends State<BeachSelectionScreen> {
  String? selectedState;
  String? selectedBeach;

  @override
  Widget build(BuildContext context) {
    List<String> states = widget.stateBeachesData.map((e) => e["Location"] as String).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Beach'),
        backgroundColor: Color.fromARGB(255, 121, 145, 189),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Explore Beaches",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                Spacer(),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: NetworkImage(
                          widget.imageUrl
                          ),fit: BoxFit.cover
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 20),
              child: Text(
                "Select your destination",
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),

            // Dropdown for selecting the state
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                hint: Text('Select State',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                value: selectedState,
                onChanged: (newValue) {
                  setState(() {
                    selectedState = newValue;
                    selectedBeach = null;
                  });
                },
                items: states.map((state) {
                  return DropdownMenuItem<String>(
                    value: state,
                    child: Text(state),
                  );
                }).toList(),
                underline: SizedBox(),
              ),
            ),
            SizedBox(height: 16),

            // Dropdown for selecting the beach based on the selected state
            if (selectedState != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 1),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('Select Beach',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                  value: selectedBeach,
                  onChanged: (newValue) {
                    setState(() {
                      selectedBeach = newValue;
                    });
                  },
                  items: widget.stateBeachesData
                      .firstWhere((state) => state["Location"] == selectedState)["Beaches"]
                      .map<DropdownMenuItem<String>>((beach) {
                    return DropdownMenuItem<String>(
                      value: beach["BeachName"],
                      child: Text(beach["BeachName"]),
                    );
                  }).toList(),
                  underline: SizedBox(),
                ),
              ),
            SizedBox(height: 16),

            // Display selected beach info
            if (selectedBeach != null)
              Expanded(
                child: BeachInfoDisplay(
                  selectedState: selectedState!,
                  selectedBeach: selectedBeach!,
                  stateBeachesData: widget.stateBeachesData,
                ),
              ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: 0,
        onTap: (i) => setState(() {}),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: InkWell(
              onTap: () {
                
              },
              child: Text("Home")),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RatingScreen(username: widget.username,imageUrl: widget.imageUrl,)));
              },
              child: Text("Likes")),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>BeachSelectionScreen(stateBeachesData: widget.stateBeachesData, username: widget.username,imageUrl: widget.imageUrl,)));
              },
              child: Text("Search")),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
              child: Text("Profile")),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
