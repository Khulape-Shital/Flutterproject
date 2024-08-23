import 'package:flutter/material.dart';
import 'package:project/DetailedSettings.dart';
import 'package:project/data.dart';
import 'package:project/data2.dart';
import 'package:project/data20.dart';
import 'package:project/data3.dart';
import 'package:project/data4.dart';
import 'package:project/data5.dart';
import 'package:project/data6.dart';
import 'package:project/data7.dart';
import 'package:project/data8.dart';
import 'package:project/data9.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
//   static  DetailedSettings d1 = DetailedSettings( Service: "How you used Instagram",logo: "images/save.png",title: "Saved",);
//    static  DetailedSettings d2 = DetailedSettings( logo: "images/save.png",title: "Archive",);
//     static  DetailedSettings d3 = DetailedSettings( logo: "images/save.png",title: "Your activity",);

//  static  DetailedSettings d4 = DetailedSettings( logo: "images/save.png",title: "Notifications",);

//  static  DetailedSettings d5 = DetailedSettings( logo: "images/save.png",title: "Time spent",);

//   final List<DetailedSettings> object1  =[d1,d2,d3,d4,d5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      appBar: AppBar(
        title: Text("Settings and activity"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 178, 178, 179),
                ),
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.all(5)),
                    Icon(
                      Icons.search,
                      size: 25,
                    ),
                    Text(
                      "Search",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Account",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  Text(
                    "Meta",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              height: 140,
              width: 400,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.person_pin,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Acounts center",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                          width: 280,
                          child: Text(
                            "Passward,Security,personal Details , ad Preferencess",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 25,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Manage your connected Experiences and account settings across meta technologies .Learn More",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "How you use Instagram",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Detailedsettings()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "Who can see your content",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Data()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "How others can interact with you",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Data2()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "what you see",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Data3()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "Your app and media",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Data4()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "For family",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Data5()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "For profetionals",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Data6()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "Your orders and fundraisers",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Data7()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "more info and support",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Data8()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "Also from meta",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Data9()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    color: Colors.grey,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 203, 203),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Data20()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
