// import 'package:coastaltourism/screens/BeachSelectionScreen.dart';
// import 'package:coastaltourism/screens/data.dart';
// import 'package:coastaltourism/screens/screen2.dart';
// import 'package:flutter/material.dart';

// class Searchplace extends StatelessWidget {
//   List beachesinfo;
//   final String title;
//   final String username;
//   final String password;
//   Searchplace({super.key, required this.beachesinfo,required this.title, required this.username,required this.password});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Explore Beaches'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   "Explore the world",
//                   style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black),
//                 ),
//                 SizedBox(width: 10),
//                 Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(100)),
//                       image: DecorationImage(
//                           image: NetworkImage(
//                               "https://static.vecteezy.com/system/resources/thumbnails/001/840/612/small_2x/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg"))),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15, bottom: 20),
//               child: Text(
//                 "Select a Beach",
//                 style: TextStyle(
//                     color: Colors.grey, fontWeight: FontWeight.w500),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to BeachSelectionScreen with data
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => BeachSelectionScreen(
//                       stateBeachesData: beaches, // Passing the beaches data
//                     ),
//                   ),
//                 );
//               },
//               child: Text('Go to Beach Selection'),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 20, bottom: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Popular Places",
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 25,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   Text(
//                     "View All",
//                     style: TextStyle(
//                         color: Colors.grey, fontWeight: FontWeight.w500),
//                   )
//                 ],
//               ),
//             ),
//             // ListView.builder for the categories (e.g., Most Viewed, Nearby, etc.)
//             SizedBox(
//               height: 50,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: beachesinfo.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: EdgeInsets.only(right: 10),
//                     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       color: Colors.grey,
//                     ),
//                     child: Center(
//                       child: Text(
//                         "${beachesinfo[index]['name']}", // Adjust this based on your data structure
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 360,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: beachesinfo.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.all(20),
//                     child: Container(
//                       width: 200,
//                       margin: EdgeInsets.only(top: 20),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 5,
//                             blurRadius: 4,
//                             offset: Offset(3, 5),
//                           ),
//                         ],
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20),
//                         child: InkWell(
//                           onTap: () {
//                             // Handle the image tap and navigate to the desired screen
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Screen2(
//                                   ontapImage: beachesinfo[index]['imageUrl'], // Assuming 'imageUrl' field
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Image.network(
//                             beachesinfo[index]['imageUrl'],
//                             width: 200,
//                             height: 300,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
