import 'package:flutter/material.dart';
import 'package:project/Message.dart';
import 'package:project/StoryExamplePage.dart';
import 'package:project/profile.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:project/program1.dart';
import 'package:project/reals.dart';

class Screen1 extends StatefulWidget {
  final String img =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJp_K9icbRwkrxdxtZL_S01QwmyEm-NOOXDbJaoFZjMuvlwUTmtTUK1FEa3NszWWNUOo4&usqp=CAU";
  Screen1({
    super.key,
  });

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool iconColor = true;

  void ChangeColor() {
    setState(() {
      if (iconColor) {
        iconColor = false;
      } else {
        iconColor = true;
      }
    });
  }

  static Demo d2 = Demo(
      imgurl:
          "https://cdn.shopify.com/s/files/1/0645/2546/7890/files/D9E3E4B2-F121-41BA-BE63-7046140F8607_480x480.jpg?v=1668698744",
      acount_name: "Jin",
      likes: 2354,
      comments: 3554,
      bio: "Jin is the oldest BTS member.",
      time: "5 min ago",
      hoby: "Coking"
      );
  static Demo d3 = Demo(
      imgurl:
          "https://qph.cf2.quoracdn.net/main-qimg-2256caf2ae788ae14295a0a9fb4d169f",
      acount_name: "V",
      likes: 34,
      comments: 64,
      bio: " v was the group's secret member ",
      time: "5 min ago",
       hoby:" Reading");

  static Demo d4 = Demo(
      imgurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_Y9W7e1hCu4XE2sg5BjAOkh5a5pCpl_mJQA&s",
      acount_name: "RM",
      likes: 4234,
      comments: 4535,
      bio: "he is the leader of BTS",
      time: "5 min ago",
      hoby:" Reading",);
  static Demo d5 = Demo(
      imgurl:
          "https://6.soompi.io/wp-content/uploads/image/20240807193124_Suga.jpg?s=900x600&e=t",
      acount_name: "Suga",
      likes: 46364,
      comments: 5744,
      bio: ". His studio is called Genius Lab.",
      time: "s min ago",
      hoby: "Sleep");
  static Demo d6 = Demo(
      imgurl:
          "https://qph.cf2.quoracdn.net/main-qimg-62a6e76e3134f463e09301561f48c273-lq",
      acount_name: "Jhope",
      likes: 2323,
      comments: 4535,
      bio: " his desire to give humans peace and hope.",
      time: "5 min ago",
      hoby: "dance");
  static Demo d7 = Demo(
      imgurl:
          "https://qph.cf2.quoracdn.net/main-qimg-672d26dd331d9b6e377f03fddc55c7c4-lq",
      acount_name: "JK",
      likes: 45342,
      comments: 3535,
      bio: "BTS almost dropped him severally  ",
      time: "5 min ago");
  static Demo d8 = Demo(
      imgurl:
          "https://imgix.bustle.com/uploads/image/2023/2/21/0519f295-183f-4b8b-aa81-15220f124a3c-bts_proof-concept-photo_proof-ver_jimin-2-1.jpg",
      acount_name: "Jimin",
      likes: 3253,
      comments: 5332,
      bio: "He is the youngest member of group",
      time: "5 min ago");

  final List<Demo> Players = [d2, d3, d4, d5, d6, d7, d8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 17, 17, 17),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Instagram",
          style: GoogleFonts.italianno(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Message(players: Players,)));
              },
              child: Icon(
                Icons.message_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Container(
            //     height: 100,
            //     child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: Players.length,
            //       itemBuilder: (context,index){
            //             return Container(
            //             width: 100,
            //               margin: EdgeInsets.only(left: 20),
            //               decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.all(Radius.circular(100)),
            //                 border: Border.all(width: 4,color: Colors.pink),
            //                 image: DecorationImage(image: NetworkImage("${Players[index].imgurl}"),fit: BoxFit.cover),
            //               ),

            //             );
            //     }),
            //   ),
            // ),
            Storyexamplepage(),

            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: Players.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 500,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 233, 231, 231),
                          image: DecorationImage(
                              image: NetworkImage("${Players[index].imgurl}"),
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
                                          "${Players[index].imgurl}"),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${Players[index].acount_name}",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.music_note_sharp,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 30),
                                                child: Container(
                                                  width: 200,
                                                  child: Text(
                                                    "${Players[index].bio}",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.menu),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: InkWell(
                                          onTap: ChangeColor,
                                          child: Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: iconColor
                                                ? Colors.red
                                                : Colors.white,
                                          ),
                                        )),
                                    Text(
                                      "${Players[index].likes}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: Icon(
                                        Icons.comment_outlined,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "${Players[index].comments}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10),
                                      child: Icon(
                                        Icons.send_outlined,
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.bookmark_outline,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${Players[index].bio}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${Players[index].time}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white),
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
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.home,
              size: 35,
              color: Colors.white,
            ),
            ElevatedButton(onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Reales()));

            }, child:Icon(
              Icons.search,
              size: 35,
              color: Colors.white,
            ),),
            Icon(
              Icons.add_box_outlined,
              size: 35,
              color: Colors.white,
            ),
            Icon(
              Icons.video_collection,
              size: 35,
              color: Colors.white,
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.img), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile(
                            profile_photo: widget.img,
                            post: " images/post.jpg"),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    
                ),)
              ),
            )
          ],
        ),
      ),
    );
  }
}
