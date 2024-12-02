import 'package:coastalselection/class.dart';
import 'package:flutter/material.dart';

class BeachSelectionScreen extends StatefulWidget {
  final List<Beach> stateBeachesData; // Pass the data here

  BeachSelectionScreen({required this.stateBeachesData,});

  @override
  _BeachSelectionScreenState createState() => _BeachSelectionScreenState();
}

class _BeachSelectionScreenState extends State<BeachSelectionScreen> {
  String? selectedState;
  String? selectedBeach;
  

  @override
  Widget build(BuildContext context) {
    List<String> states = widget.stateBeachesData.map((state) => state.stateName).toList();

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
                  selectedBeach = null; // Reset the selected beach when state changes
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
                    .firstWhere((state) => state.stateName == selectedState)
                    .beaches
                    .map<DropdownMenuItem<String>>((beach) {
                  return DropdownMenuItem<String>(
                    value: beach.name,
                    child: Text(beach.name),
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

class BeachInfoDisplay extends StatelessWidget {
  final String selectedState;
  final String selectedBeach;
  final List<StateBeaches> stateBeachesData;

  const BeachInfoDisplay({
    Key? key,
    required this.selectedState,
    required this.selectedBeach,
    required this.stateBeachesData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var stateData = stateBeachesData.firstWhere((state) => state.stateName == selectedState);
    var beachData = stateData.beaches.firstWhere((beach) => beach.name == selectedBeach);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Beach Info:', ),
        SizedBox(height: 8),
        Text('Beach Name: ${beachData.name}'),
        Text('Wave Height: ${beachData.waveHeight}'),
        Text('Water Quality: ${beachData.waterQuality}'),
        Text('Wind Speed: ${beachData.windSpeed}'),
        Text('Tide Level: ${beachData.tideLevel}'),
      ],
    );
  }
}
