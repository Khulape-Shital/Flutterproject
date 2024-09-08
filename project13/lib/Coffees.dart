import 'package:flutter/material.dart';
import 'package:project13/Screen2.dart';

class Coffees extends StatelessWidget {
  final String title;
  const Coffees({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 40, bottom: 40),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Screen2()));
              },
              child: Center(
                  child: Text(
                title,
                style: TextStyle(
             
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 99, 136, 216),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
