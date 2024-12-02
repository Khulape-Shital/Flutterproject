import 'package:coastalselection/screens/data.dart';
import 'package:coastalselection/screens/searchPlace.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(height: 300,
        width: 300,
        color: const Color.fromARGB(255, 164, 7, 255),
        child: InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Searchplace(beachesinfo: beaches)));
        },),
        ),
      ),
    );
  }
}