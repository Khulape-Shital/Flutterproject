import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/Settings.dart';
import 'package:project/StoryExamplePage.dart';
import 'package:project/post.dart';
import 'package:project/program2.dart';

class Profile extends StatefulWidget {
 final String post;
  final String? profile_photo;

   Profile({super.key,required this. profile_photo, required this.post});
 static Highlights h1 =Highlights(story: "https://images.squarespace-cdn.com/content/v1/5f402a9d4e121b7f850b4374/1628103781058-VM8IU3B7E38NGIQXI5YM/101685136_3643103612371541_3128219183565766656_o.jpg",name: "BTS");
  static Highlights h2 =Highlights(story: "https://st1.bollywoodlife.com/wp-content/uploads/2022/09/bts0.png?impolicy=Medium_Widthonly&w=400&h=711",name: "BTS");
   static Highlights h3 =Highlights(story: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgHQnVvNrLCZCSbbA8aoW48FiN0Sl-QwfZ2272x4cWRz2PaIb1fQ1Tv3U-rgQbR-t-O7I&usqp=CAU",name: "BTS");
    static Highlights h4 =Highlights(story: "https://static.toiimg.com/thumb/msid-78620721,width-400,resizemode-4/78620721.jpg",name: "BTS");
     static Highlights h5 =Highlights(story: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUlY6ITtw9f4uazFRnGgVPGOh9dCgRMrNOyw-rX9Ie0_j-5zBpiDdFHfG7OhyV90e9x5Y&usqp=CAU",name: "BTS");
      static Highlights h6 =Highlights(story: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTi_iwpXC2-ak4nW--BCg0m7XqgVOtD_MI0Hw&s",name: "BTS");
       static Highlights h7 =Highlights(story: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgHQnVvNrLCZCSbbA8aoW48FiN0Sl-QwfZ2272x4cWRz2PaIb1fQ1Tv3U-rgQbR-t-O7I&usqp=CAU",name: "BTS");
     

     List <Highlights> BTS=[h1,h2,h3,h4,h5,h6,h7];


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 backgroundColor: Color.fromARGB(255, 17, 17, 17),
   
      appBar: AppBar(
       
         backgroundColor: Color.fromARGB(255, 10, 13, 16),
        actions: [
          Row(children: [
            Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Icon(Icons.lock_outline,color: Colors.white,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("I",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white,),),
              Icon(Icons.favorite,color: Color.fromARGB(255, 179, 85, 195),),
              Text("Purple",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white,),),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Icon(Icons.keyboard_arrow_down,size:35,weight: 20,color: Colors.white,),
                ),
            ],
          ),
        
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Text("@",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400,color: Colors.white,),),
          ),
          InkWell(
            onTap: () {
              Drawer(
                
                backgroundColor: Color.fromARGB(255, 158, 156, 156),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.video_camera_front),
                        Text("Real",)
                      ],
                    ),
                     Row(
                      children: [
                        Icon(Icons.video_camera_front),
                        Text("Real",)
                      ],
                    ),
                     Row(
                      children: [
                        Icon(Icons.video_camera_front),
                        Text("Real",)
                      ],
                    ),
                     Row(
                      children: [
                        Icon(Icons.video_camera_front),
                        Text("Real",)
                      ],
                    ),
                  ],
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.add_box_outlined,size: 35,weight: 8 ,color: Colors.white,),
            ),
          ),
          InkWell(
          child:   Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              height: 30,
              width: 30,
              child: Image(image: AssetImage("images/menu.png"),color: Colors.white,))
          ),
            onTap: (){
             Navigator.push(context,MaterialPageRoute(builder: (context)=>Settings()));
            },
          ) 
          ],),
         

        ],

      ),  
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            Container(
              height: 200,
             
              child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(1000)),
                          image: DecorationImage(image: NetworkImage("${widget.profile_photo}"),fit: BoxFit.cover),
                        ),
                        child: InkWell(onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(profile_photo: "${widget.profile_photo}", post:"${widget.post}")));
                        },),
                      ),
                      Text("BTS Army",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                     Container(
                      
                      decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                      
                      ),
                      
                      child: Text(" @ IMakeYouPurple",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white,),)),
                      
                      Icon(Icons.favorite,color: Color.fromARGB(255, 206, 113, 222),)
                  
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                     
                      Text("1",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white,),),
                      Text("Posts",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white,),) 
                    ],
                  ),
                   Column( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("76",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white,),),
                      Text("Folowers",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white,),) 
                    ],
                  ),
                   Column( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("135",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white,),),
                      Text("Following",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.white,),) 
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
        
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(onPressed: (){
                  
                  
                  }, child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("Edit Profile",style: TextStyle(fontSize:15,fontWeight: FontWeight.w400,color: Colors.white),),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 51, 58, 64),),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(onPressed: (){
                  
                  
                  }, child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("Share profile",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.white),),
                  ),
                        style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 51, 58, 64),)
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(onPressed: (){
                  
                  
                  }, child: Icon(Icons.person_add_alt_1_outlined,weight: 40,color: Colors.white,),
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 61, 62, 63),)),
                ),
                
              ],
            ),
            // Container(
            //   height: 100,
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: widget.BTS.length,
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context,index){
            //                 return Column(
            //                   children: [
            //                     Row(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.all(10),
            //                           child: Container(
            //                             height: 80,
            //                             width:80,
            //                             decoration: BoxDecoration(
            //                               border: Border.all(width: 3,color: Colors.grey),
            //                               borderRadius: BorderRadius.all(Radius.circular(100)),
            //                               image: DecorationImage(image: NetworkImage("${widget.BTS[index].story}"),fit: BoxFit.cover),
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     ),
        
            //                   ],
            //                 );
            //   }),
             
            // ),
            Storyexamplepage(),
        
            Container(
           
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.square_sharp,size: 30,color: Colors.white),
                   Icon(Icons.video_file_outlined,size:30,color: Colors.white),
                    Icon(Icons.person_outline_sharp,size: 30,color: Colors.white)
                ],
              ),
            ),
        
         Post(imgurl: "${widget.post}"),
            
            
            
          ],
        ),
      ),
bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home,size:30,color: Colors.white,),
            Icon(Icons.search,size:30,color: Colors.white,),
            Icon(Icons.add_box_outlined,size: 30,color: Colors.white,),
            Icon(Icons.video_collection,size: 30,color: Colors.white,),
             Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("${widget.profile_photo}"),fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(100)),
                
              ),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(profile_photo: "${widget.profile_photo}",post: "${widget.post}",)));
                },
                child: Container(decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(width: 3,color: Color.fromARGB(255, 203, 72, 205))
                ),)
              ),
            )
          ],
        ),
      ),

    );
  }
}