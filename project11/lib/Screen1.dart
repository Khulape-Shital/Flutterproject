import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project11/Screen2.dart';

class Screen1 extends StatelessWidget {
  final imgurl =
      "https://i.pinimg.com/736x/81/54/da/8154dab30de34151a4590b19ae1ca1bf.jpg";
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "8:00",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(Icons.network_cell_outlined, color: Colors.white),
          Padding(padding: EdgeInsets.only(left: 10)),
          Icon(Icons.network_wifi_3_bar_sharp, color: Colors.white),
          Padding(padding: EdgeInsets.only(left: 10)),
          Icon(Icons.battery_6_bar_sharp, color: Colors.white),
          Padding(padding: EdgeInsets.only(left: 10))
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                  imgurl
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 30),
              child: Text(
                "Rent a House foryou",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 150,
              width: 410,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(100, 100),
                      topRight: Radius.elliptical(100, 100),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Reservation Now",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Screen2()));
                      },
                      child: Text(
                        "BOOK NOW",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 32, 2, 88)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
