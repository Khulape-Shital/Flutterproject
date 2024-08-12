import 'package:flutter/material.dart';
import 'package:instagram/StoryExamplePage.dart';

import 'package:instagram/program1.dart';
import 'package:google_fonts/google_fonts.dart';


class Screen1 extends StatefulWidget {
  Screen1({super.key});
  static Demo d2 = Demo(
      "https://cdn.shopify.com/s/files/1/0645/2546/7890/files/D9E3E4B2-F121-41BA-BE63-7046140F8607_480x480.jpg?v=1668698744",
      "Jin",
      2354,
      3554,
      "Jin is the oldest BTS member. The group calls him “eomma (mother)” because he loves cooking and cleaning for them. Kim Seok Jin did not have any singing background before BTS. Read more: https://kami.com.ph/94934-bts-members-profile-real-names-height-age-net-worth.html",
      "5 min ago");
  static Demo d3 = Demo(
      "https://qph.cf2.quoracdn.net/main-qimg-2256caf2ae788ae14295a0a9fb4d169f",
      "V",
      34,
      64,
      "BTS was a 6-men group before its official debut. Kim Tae Hyung was the group's secret member for so long that fans were surprised when he was publicly introduced as the seventh member. He joined them at the age of 17 years. Read more: https://kami.com.ph/94934-bts-members-profile-real-names-height-age-net-worth.html",
      "5 min ago");

  static Demo d4 = Demo(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_Y9W7e1hCu4XE2sg5BjAOkh5a5pCpl_mJQA&s",
      "RM",
      4234,
      4535,
      "Since Kim Nam Joon is the only BTS member fluent in English, he teaches the group and translates during interviews. The rapper learned English from the American Friends Apart show. He is also fluent in Japanese and can quickly learn foreign languages. Read more: https://kami.com.ph/94934-bts-members-profile-real-names-height-age-net-worth.html",
      "5 min ago");
  static Demo d5 = Demo(
      "https://6.soompi.io/wp-content/uploads/image/20240807193124_Suga.jpg?s=900x600&e=t",
      "Suga",
      46364,
      5744,
      "The rapper impresses RM with his songwriting and production skills. Min Yoon Gi has produced around 70 songs. His studio is called Genius Lab. Read more: https://kami.com.ph/94934-bts-members-profile-real-names-height-age-net-worth.html",
      "s min ago");
  static Demo d6 = Demo(
      "https://qph.cf2.quoracdn.net/main-qimg-62a6e76e3134f463e09301561f48c273-lq",
      "Jhope",
      2323,
      4535,
      "Before joining BTS, Jung Ho Seok was among the best freestyle street dancers in his hometown, Gwangju. His stage name, J-Hope, came from his desire to give humans peace and hope. He auditioned for Big Hit at age 17 and trained for three years before the band's debut. Read more: https://kami.com.ph/94934-bts-members-profile-real-names-height-age-net-worth.html",
      "5 min ago");
  static Demo d7 = Demo(
      "https://qph.cf2.quoracdn.net/main-qimg-672d26dd331d9b6e377f03fddc55c7c4-lq",
      "JK",
      45342,
      3535,
      "BTS almost dropped him severally because the training was quite challenging for him. As a result, Jimin was the last person to the other six BTS members before the band's debut. V came along later as a seventh member. Read more: https://kami.com.ph/94934-bts-members-profile-real-names-height-age-net-worth.html",
      "5 min ago");
  static Demo d8 = Demo(
      "https://imgix.bustle.com/uploads/image/2023/2/21/0519f295-183f-4b8b-aa81-15220f124a3c-bts_proof-concept-photo_proof-ver_jimin-2-1.jpg",
      "Jimin",
      3253,
      5332,
      "BTS almost dropped him severally because the training was quite challenging for him. As a result, Jimin was the last person to the other six BTS members before the band's debut. V came along later as a seventh member. Read more: https://kami.com.ph/94934-bts-members-profile-real-names-height-age-net-worth.html",
      "5 min ago");

  final List<Demo> Players = [d2, d3, d4, d5, d6, d7, d8];
  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool iconColor = true;
  void ChangeColor() {
   setState(() {
     if(iconColor){
      iconColor =false;
     }
     else{
      iconColor =true;
     }
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Instagram",
          style: GoogleFonts.italianno(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Icon(
              Icons.message_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
          
          StoryExamplePage(),
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: widget.Players.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 600,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 233, 231, 231),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${widget.Players[index].imgurl}"),
                              fit: BoxFit.cover),
                        ),
                        child: Container(
                          margin:
                              EdgeInsets.only(top: 20, bottom: 10, left: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${widget.Players[index].imgurl}"),
                                      fit: BoxFit.cover),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  border: Border.all(
                                    width: 5,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${widget.Players[index].acount_name}",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.music_note_sharp,
                                          ),
                                          Text(
                                            "${widget.Players[index].acount_name}",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 250),
                                child: Icon(Icons.format_list_bulleted_sharp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: InkWell(
                                          onTap:  ChangeColor,
                                          child: Icon(Icons.favorite,size: 30,color: iconColor? Colors.red:const Color.fromARGB(255, 0, 0, 0),),
                                          )
                                          ),
                                                  
                                                  
                                  Text(
                                    "${widget.Players[index].likes}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Icon(
                                      Icons.comment_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "${widget.Players[index].comments}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 10),
                                    child: Icon(
                                      Icons.send_outlined,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 130, top: 10),
                                    child: Icon(
                                      Icons.bookmark_outline,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${widget.Players[index].bio}",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${widget.Players[index].time}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
