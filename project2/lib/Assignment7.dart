import 'package:flutter/material.dart';

class Assignment7 extends StatelessWidget {
  const Assignment7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(" Row Assignment 7",
              style: TextStyle(
                  fontStyle: FontStyle.values.first,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 5, 125, 223),
        ),
        body: SizedBox(
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 400,
                width: 400,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(height: 50, width: 50, color: Colors.white),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.white,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: 400,
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.white,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.white,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
