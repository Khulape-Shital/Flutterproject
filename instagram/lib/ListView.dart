// import 'package:flutter/material.dart';
// import 'package:instagram/program1.dart';

// class Listview extends StatelessWidget {
  
//  Listview({super.key,});
 
//    static Demo d2 =Demo( "Shital","hii");
//    static Demo d3 =Demo( "Shi","hii");

//    static Demo d4 =Demo( "Shital","hii");
//    static Demo d5 =Demo( "Shital","hello");

   
//  final List <Demo> Players=[d2,d3,d4,d5];
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 100,
       
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: Players.length,
//           itemBuilder: (context, index) {
//           return Container(
//             height: 100,
//             width: 100,
//             margin: EdgeInsets.only(top: 20,bottom: 10,left: 20),
//          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10000)),
//          color: Colors.amber),
                      
//                     child:   Column(
                     
//                       children: [
//                        Center(child: Text("${Players[index].imgurl}",)),
                          
//                           Center(child: Text("${Players[index].acount_name}")),
                          
//                       ],
//                     ),
//                    );
//         },),
//       ),
//     );
//   }
// }