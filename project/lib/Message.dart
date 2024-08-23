import 'package:flutter/material.dart';
import 'package:project/StoryExamplePage.dart';
import 'package:project/chat.dart';
import 'package:project/program1.dart';


class Message extends StatefulWidget {
  final List<Demo>? players;
  const Message({super.key,this.players});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
 static Demo d2 = Demo(
      imgurl:
          "https://cdn.shopify.com/s/files/1/0645/2546/7890/files/D9E3E4B2-F121-41BA-BE63-7046140F8607_480x480.jpg?v=1668698744",
      acount_name: "Jin",
     hoby: "Coking");
  static Demo d3 = Demo(
      imgurl:
          "https://qph.cf2.quoracdn.net/main-qimg-2256caf2ae788ae14295a0a9fb4d169f",
      acount_name: "V",
      hoby:"Playing games"
      );

  static Demo d4 = Demo(
      imgurl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_Y9W7e1hCu4XE2sg5BjAOkh5a5pCpl_mJQA&s",
      acount_name: "RM",
      hoby:" Reading",
      );
  static Demo d5 = Demo(
      imgurl:
          "https://6.soompi.io/wp-content/uploads/image/20240807193124_Suga.jpg?s=900x600&e=t",
      acount_name: "Suga",
      hoby: "Sleep"
      );
  static Demo d6 = Demo(
      imgurl:
          "https://qph.cf2.quoracdn.net/main-qimg-62a6e76e3134f463e09301561f48c273-lq",
      acount_name: "Jhope",
      hoby: "Dance"
      );
  static Demo d7 = Demo(
      imgurl:
          "https://qph.cf2.quoracdn.net/main-qimg-672d26dd331d9b6e377f03fddc55c7c4-lq",
      acount_name: "JK",
      hoby: "Painting"
      );
  static Demo d8 = Demo(
      imgurl:
          "https://imgix.bustle.com/uploads/image/2023/2/21/0519f295-183f-4b8b-aa81-15220f124a3c-bts_proof-concept-photo_proof-ver_jimin-2-1.jpg",
      acount_name: "Jimin",
      hoby: "hair flip"
      );

  final List<Demo> Players = [d2, d3, d4, d5, d6, d7, d8];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("I make you purple",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.pin_end_sharp),
        )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromARGB(111, 54, 49, 69),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.circle_outlined,size: 30,),
                    Text("Ask Meta AI or Search",style: TextStyle(color: Color.fromARGB(255, 114, 113, 113),fontSize: 20,fontWeight: FontWeight.w300),),
                  ],
                ),
              ),
            ),
            Storyexamplepage(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Messages",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
                  Text("Requests",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),)
                ],
              ),
            ),

             Container(
                     
                         
               child: ListView.builder(
                 scrollDirection: Axis.vertical,
                 physics: NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                 itemCount: Players.length,
                 itemBuilder: (context,index){
                       return Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           InkWell(
                            onTap: (){

                            Navigator.push(context,MaterialPageRoute(builder: (contex)=>Chat(profilePhoto:"${Players[index].imgurl}" , accountName: "${Players[index].acount_name}", hoby: "${Players[index].hoby}")));
                            },
                             child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [

                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     children: [
                                       Container(
                                       
                                       height: 70,
                                       width: 70,
                                       
                                                              
                                         margin: EdgeInsets.only(left: 20),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.all(Radius.circular(100)),
                                           border: Border.all(width: 4,color: Colors.pink),
                                           image: DecorationImage(image: NetworkImage("${Players[index].imgurl}"),fit: BoxFit.cover),
                                         ),
                                       
                                       ),
                                        Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text("${Players[index].acount_name}",style: TextStyle(fontSize: 20,fontWeight:FontWeight.w400,color: Colors.white),),
                                    ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: 15),
                                   child: Text("${Players[index].hoby}",style: TextStyle(fontSize: 15,fontWeight:FontWeight.w400,color: Color.fromARGB(255, 170, 169, 169)),),
                                 ),
                                  ],
                                 ),
                                     ],
                                   ),
                                 ),
                             
                                
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Icon(Icons.camera_alt_outlined,size: 35,color: Color.fromARGB(255, 171, 170, 170),),
                                 )
                               ],
                             ),
                           ),
                         ],
                       );
               }),
             ),
            
          ],
        ),
      ),
    );
  }
}