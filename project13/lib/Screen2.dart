import 'package:flutter/material.dart';
import 'package:project13/CoffeeTypes.dart';
import 'package:project13/Coffees.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "09:51",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.network_cell_rounded,
            color: Colors.white,
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          Icon(Icons.wifi_1_bar, color: Colors.white),
          Padding(padding: EdgeInsets.only(right: 10)),
          Padding(padding: EdgeInsets.only(right: 10)),
          Icon(Icons.battery_3_bar_rounded, color: Colors.white)
        ],
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 9, 9, 9),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Location",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "Bilzen, Tanjungbalai",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.white,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://qph.cf2.quoracdn.net/main-qimg-bbe9d88e3b9e7ffbeac2cf4182d54fc1"),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 170,
                        width: 350,
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://fertilityfamily.b-cdn.net/wp-content/uploads/2023/10/PCOS-and-coffee-scaled-1.jpg"),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "Promo",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    )),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 170,
                                    decoration: BoxDecoration(),
                                    child: Center(
                                        child: Text(
                                      "Buy one get   one free ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w400,
                                          backgroundColor: Colors.black),
                                    )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Coffees(title: "Cappuccino"),
                  Coffees(title: "Machiato"),
                  Coffees(title: "Latte"),
                  Coffees(title: "Americano"),
                  Coffees(title: "Expreso"),
                  Coffees(title: "Brow"),
                ],
              ),
            )),
            Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: ,
                    child: SingleChildScrollView(
                      
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround    ,
                        
                        children: [
                          
                          Containercard(title: "Near By"),
                          Containercard(title: "Book Now"),
                          Containercard(title: "Near By"),
                          Containercard(title: "Near By"),
                          Containercard(title: "Near By"),
                          Containercard(title: "Near By"),
                          Containercard(title: "Near By"),

                          
                      
                        ],
                      )),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
