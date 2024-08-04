import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  final String logOut;
  const Logout({super.key,required this. logOut});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child:  Container(
          height: 200,
          width: 200,
          child: Image.network(logOut),
        ),
      ),
    );
  }
}