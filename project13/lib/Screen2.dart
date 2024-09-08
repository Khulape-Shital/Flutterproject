import 'package:flutter/material.dart';

import 'package:project13/Coffees.dart';
import 'package:project13/titles.dart';


class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool boxColor =true;
  void changeColor(){
    if(boxColor){
      boxColor =false;
    }
    else{
      boxColor=true;
    }
    setState(() {
      
    });
  }
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
        backgroundColor:Color.fromARGB(255, 81, 177, 233),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 111, 197, 232),
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
                                "Ganpatipule",
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
                                    "https://hblimg.mmtcdn.com/content/hubble/img/goa/mmt/destination/m_destination-goa-landscape_l_400_640.jpg"),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    )),
                                  ),
                                  Container(
                                    height: 70,
                                    width: 300,
                                    decoration: BoxDecoration(),
                                    child: Center(
                                        child: Text(
                                      "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
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
                  Coffees(title: "Goa"),
                  Coffees(title: "Digha"),
                  Coffees(title: "Lakshadweep"),
                  Coffees(title: "Kerala"),
                  Coffees(title: "Gujarat "),
                  Coffees(title: "Tamil Nadu"),
                ],
              ),
            )),
            Container(
              height: 300,
              child: SingleChildScrollView(
                
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround    ,
                  
                  children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Titles(
                  
                  imgurl: "https://static.toiimg.com/thumb/msid-104501508,width-748,height-499,resizemode=4,imgsize-126164/.jpg",
                   reating:"4.9", 
                   type: "Goa", 
                   flew: "", 
                   prize: "${4.77}"
                   ),
                   

              ],
            ),
               Titles(imgurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9rqZZqr-482phZ4TWiG1t08a13MVJ8KzO7Q&s",
                reating: ("4.4"),
                 type: "Digha",
                  flew: "",
                   prize: "${3.5}"),

                   Titles(imgurl: "https://media.istockphoto.com/id/535168027/photo/india-goa-palolem-beach.jpg?s=612x612&w=0&k=20&c=iGV1Ue0Efj87dQirWnUpZVG1dNobUjfVvMGdKHTJ7Qg=",
                reating: ("4.4"),
                 type: "Lakshadweep",
                  flew: "",
                   prize: "${3.5}"),
                   
                   Titles(imgurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRKVUu_svNVJf5bVQZf3Gxa8ZEMB4T7wOo0g&s",
                reating: ("4.4"),
                 type: "Kerala",
                  flew: "",
                   prize: "${3.5}"),
                   
                   Titles(imgurl: "https://img.traveltriangle.com/blog/wp-content/uploads/2017/11/cover-for-Beaches-In-India.jpg",
                reating: ("4.4"),
                 type: "Shivrajpur beach",
                  flew: "",
                   prize: "${3.5}"),
                   

                  ]
                )),
            ),

                Container(
              height: 300,
              child: SingleChildScrollView(
                
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround    ,
                  
                  children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Titles(
                  
                  imgurl: "https://static.toiimg.com/thumb/msid-104501508,width-748,height-499,resizemode=4,imgsize-126164/.jpg",
                   reating:"4.9", 
                   type: "Goa", 
                   flew: " With milk", 
                   prize: "${4.77}"
                   ),
                   

              ],
            ),
               Titles(imgurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9rqZZqr-482phZ4TWiG1t08a13MVJ8KzO7Q&s",
                reating: ("4.4"),
                 type: "Digha",
                  flew: "",
                   prize: "${3.5}"),

                   Titles(imgurl: "https://media.istockphoto.com/id/535168027/photo/india-goa-palolem-beach.jpg?s=612x612&w=0&k=20&c=iGV1Ue0Efj87dQirWnUpZVG1dNobUjfVvMGdKHTJ7Qg=",
                reating: ("4.4"),
                 type: "Lakshadweep",
                  flew: "",
                   prize: "${3.5}"),
                   
                   Titles(imgurl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRKVUu_svNVJf5bVQZf3Gxa8ZEMB4T7wOo0g&s",
                reating: ("4.4"),
                 type: "Kerala",
                  flew: "",
                   prize: "${3.5}"),
                   
                   Titles(imgurl: "https://img.traveltriangle.com/blog/wp-content/uploads/2017/11/cover-for-Beaches-In-India.jpg",
                reating: ("4.4"),
                 type: "Shivrajpur beach",
                  flew: "",
                   prize: "${3.5}"),
                   

                  ]
                )),
            ),

             
          ],
        ),
      ),
    );
  }
}
