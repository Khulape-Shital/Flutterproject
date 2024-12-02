// import 'dart:math';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:coastaltourism/screens/screenlogin.dart';
// import 'package:coastaltourism/screens/screensignin.dart';
// import 'package:flutter/material.dart';
// import 'package:action_slider/action_slider.dart';

// final List<String> imgList = [
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwD1d-Sw6rJM3zdV_4eBWhrPjR_1tB1Tz1Ng&s',
//   'https://st2.depositphotos.com/1003348/10192/i/950/depositphotos_101921828-stock-photo-the-indian-ocean-vertical-panorama.jpg',
//   'https://c8.alamy.com/comp/2GP7D5K/seychelles-takamaka-beach-mahe-portrait-format-vacation-paradise-ocean-drone-view-aerial-photo-photography-2GP7D5K.jpg',
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSOcWJGdbdk29A2XT4QRiPHUcp1GFXbytVDi7L1CrTkM7jpvf7aZBeZfTlA42oYmCoJxI&usqp=CAU', 
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmJzYZBBiS6xTL8L5ALt4jpVJPfGOhUyKW8No9VpGH1niYO88WCa56qxbCADu6EGeNGHc&usqp=CAU',
//   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3Yjh00cAmExP7oO2hqQHBn0n6o5hwQECKiRvfGTQDPDHpxpKquV4m1kgKp8jDolkzg-U&usqp=CAU',
//   'https://i.pinimg.com/564x/27/b5/d3/27b5d38b2a5ccb57f454dd3a7f38594b.jpg',
// ];

// class Screenhome extends StatefulWidget {
//   @override
//   _ScreenhomeState createState() => _ScreenhomeState();
// }

// class _ScreenhomeState extends State<Screenhome> {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: Stack(
//         children: [
//           CarouselSlider(
//             options: CarouselOptions(
//               height: height,
//               viewportFraction: 1.0,
//               enlargeCenterPage: false,
//               autoPlay: true,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _currentIndex = index;
//                 });
//               },
//             ),
//             items: imgList.map((item) => Center(
//               child: Image.network(
//                 item,
//                 fit: BoxFit.cover,
//                 height: height,
//               ),
//             )).toList(),
//           ),
//           Positioned(
//             bottom: 20.0, // Position the slider above the bottom edge
//             left: 0,
//             right: 0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: imgList.asMap().entries.map((entry) {
//                     return GestureDetector(
//                       onTap: () => setState(() => _currentIndex = entry.key),
//                       child: Container(
//                         width: 12.0,
//                         height: 12.0,
//                         margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: (Theme.of(context).brightness == Brightness.dark
//                                   ? Colors.white
//                                   : Colors.black)
//                               .withOpacity(_currentIndex == entry.key ? 0.9 : 0.4),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 10),
//                 ActionSlider.dual(
//                   width: 300.0,
//                   backgroundColor: Colors.black,
//                   backgroundBorderRadius: BorderRadius.circular(10.0),
//                   foregroundBorderRadius: BorderRadius.circular(10.0),
//                   startChild: const Text('Sign Up', style: TextStyle(color: Colors.white)),
//                   endChild: const Text('Login', style: TextStyle(color: Colors.white)),
//                   icon: Padding(
//                     padding: const EdgeInsets.only(right: 2.0),
//                     child: Transform.rotate(
//                       angle: 0.5 * pi,
//                       child: const Icon(Icons.unfold_more_rounded, size: 28.0, color: Colors.white),
//                     ),
//                   ),
//                   startAction: (controller) async {
//                     controller.loading();
//                     await Future.delayed(const Duration(seconds: 1));
//                     controller.success();
//                     await Future.delayed(const Duration(seconds: 1));
//                     controller.reset();
//                     // Navigate to Sign Up Page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) =>Screensignin()),
//                     );
//                   },
//                   endAction: (controller) async {
//                     controller.loading();
//                     await Future.delayed(const Duration(seconds: 1));
//                     controller.success();
//                     await Future.delayed(const Duration(seconds: 1));
//                     controller.reset();
//                     // Navigate to Login Page
//                     // Navigator.push(
//                     //   context,
//                     //   // MaterialPageRoute(builder: (context) => Screenlogin()),
//                     // );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

