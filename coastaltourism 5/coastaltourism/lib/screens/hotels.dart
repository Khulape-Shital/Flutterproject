import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelSelectionScreen extends StatefulWidget {
  final List<Map<String, dynamic>> hotelData;

  HotelSelectionScreen({required this.hotelData});

  @override
  _HotelSelectionScreenState createState() => _HotelSelectionScreenState();
}

class _HotelSelectionScreenState extends State<HotelSelectionScreen> {
  String? selectedState;
  String? selectedBeach;
  String? selectedHotel;

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Extract state names from hotelData
    List<String> states = widget.hotelData.map((state) => state["Location"] as String).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Hotel',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // State Dropdown
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: Colors.blue, width: 1),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text('Select State', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                  value: selectedState,
                  onChanged: (newValue) {
                    setState(() {
                      selectedState = newValue;
                      selectedBeach = null; // Reset beach and hotel when state changes
                      selectedHotel = null;
                    });
                  },
                  items: states.map((state) {
                    return DropdownMenuItem<String>(
                      value: state,
                      child: Text(state),
                    );
                  }).toList(),
                ),
              ),
            ),

            // Beach Dropdown (appears after state selection)
            if (selectedState != null) 
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                   width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text('Select Beach', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                    value: selectedBeach,
                    onChanged: (newValue) {
                      setState(() {
                        selectedBeach = newValue;
                        selectedHotel = null; // Reset hotel when beach changes
                      });
                    },
                    items: _getBeachesForState(selectedState!)
                        .map<DropdownMenuItem<String>>((beach) {
                      return DropdownMenuItem<String>(
                        value: beach,
                        child: Text(beach),
                      );
                    }).toList(),
                  ),
                ),
              ),

            // Hotel Dropdown (appears after beach selection)
            if (selectedBeach != null)
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                   width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 1),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text('Select Hotel', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                    value: selectedHotel,
                    onChanged: (newValue) {
                      setState(() {
                        selectedHotel = newValue;
                      });
                    },
                    items: _getHotelsForBeach(selectedState!, selectedBeach!)
                        .map<DropdownMenuItem<String>>((hotel) {
                      return DropdownMenuItem<String>(
                        value: hotel["name"],
                        child: Text(hotel["name"],)
                      );
                    }).toList(),
                  ),
                ),
              ),
            if (selectedHotel != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You selected: $selectedHotel at $selectedBeach, $selectedState.',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        // Launch the website of the selected hotel
                        String? hotelWebsite = _getHotelDetails(selectedState!, selectedBeach!, selectedHotel!)["website"];
                        if (hotelWebsite != null) {
                          _launchURL(hotelWebsite);
                        }
                      },
                      child: Text(
                        'Visit Website',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500
                        , color: Colors.blue, decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
      
    );
  }

  // Get the beaches for the selected state
  List<String> _getBeachesForState(String state) {
    var stateData = widget.hotelData.firstWhere((stateData) => stateData["Location"] == state);
    return stateData.keys.where((key) => key != 'Location').toList();
  }

  // Get the hotels for the selected beach
  List<Map<String, dynamic>> _getHotelsForBeach(String state, String beach) {
    var stateData = widget.hotelData.firstWhere((stateData) => stateData["Location"] == state);
    return stateData[beach] ?? [];
  }

  // Get the hotel details for a specific hotel
  Map<String, dynamic> _getHotelDetails(String state, String beach, String hotelName) {
    var stateData = widget.hotelData.firstWhere((stateData) => stateData["Location"] == state);
    var beachData = stateData[beach];
    return beachData.firstWhere((hotel) => hotel["name"] == hotelName);
  }
}
