// import 'package:flutter/material.dart';

// class Copy extends StatefulWidget {
//    final String imgurl;
//   final String reating;
//   final String type;
//   final String flew;
//   final String prize;
//   const Copy({super.key,required this. imgurl,required this. reating,required this.type,required this.flew,required this. prize});

//   @override
//   State<Copy> createState() => _CopyState();
// }

// class _CopyState extends State<Copy> {
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//           height: 300,
//           width: 150,
//           decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Colors.white),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(10),
//                 height: 150,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(20)),
//                   image: DecorationImage(image: NetworkImage(imgurl))
//                 ),
//                 child: Row(
//                   children: [Icon(Icons.star_rate,color: Color.fromARGB(255, 242, 168, 58),),
//                   Text(reating),
//                   ],
//                 ),
//               ),

//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Text(type,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20,bottom: 20),
//                   child: Text(flew,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200),),
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                   padding: const EdgeInsets.only(left: 20,bottom: 20),
//                   child: Text(prize,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200),),
                  
                  
//                 ),
//                 FloatingActionButton(onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Cappucino()));
//                 },
//                 child:  Icon(Icons.add,),
//                 )
//                   ],
//                 )
//             ],
//           ),
//         );
        
//   }
// }


