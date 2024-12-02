import 'package:coastalselection/screens/BeachInfoDisplay.dart';
import 'package:flutter/material.dart';

class BeachSelectionScreen extends StatefulWidget {
  final List<Map<String, dynamic>> stateBeachesData; // Define the data structure

  BeachSelectionScreen({required this.stateBeachesData});

  @override
  _BeachSelectionScreenState createState() => _BeachSelectionScreenState();
}

class _BeachSelectionScreenState extends State<BeachSelectionScreen> {
  String? selectedState;
  String? selectedBeach;

  @override
  Widget build(BuildContext context) {
    // Extracting states from data
    List<String> states = widget.stateBeachesData.map((e) => e["Location"] as String).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Beach'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown for selecting the state
            DropdownButton<String>(
              hint: Text('Select State'),
              value: selectedState,
              onChanged: (newValue) {
                setState(() {
                  selectedState = newValue;
                  selectedBeach = null; // Reset selected beach when state changes
                });
              },
              items: states.map((state) {
                return DropdownMenuItem<String>(
                  value: state,
                  child: Text(state),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            // Dropdown for selecting the beach based on the selected state
            if (selectedState != null) ...[
              DropdownButton<String>(
                hint: Text('Select Beach'),
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
              ),
              SizedBox(height: 16),
            ],
            // Display selected beach info
            if (selectedBeach != null) ...[
              BeachInfoDisplay(
                selectedState: selectedState!,
                selectedBeach: selectedBeach!,
                stateBeachesData: widget.stateBeachesData,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

