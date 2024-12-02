// import 'dart:math';
// import 'package:action_slider/action_slider.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Confirmation Slider Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Confirmation Slider Example'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _controller = ActionSliderController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             DefaultTextStyle.merge(
//               style: const TextStyle(color: Colors.white),
//               child: ActionSlider.dual(
//                 backgroundBorderRadius: BorderRadius.circular(10.0),
//                 foregroundBorderRadius: BorderRadius.circular(10.0),
//                 width: 300.0,
//                 backgroundColor: Colors.black,
//                 startChild: const Text('Sign Up'),
//                 endChild: const Text('Login'),
//                 icon: Padding(
//                   padding: const EdgeInsets.only(right: 2.0),
//                   child: Transform.rotate(
//                       angle: 0.5 * pi,
//                       child: const Icon(Icons.unfold_more_rounded, size: 28.0)),
//                 ),
//                 startAction: (controller) async {
//                   controller.loading();
//                   await Future.delayed(const Duration(seconds: 1));
//                   controller.success();
//                   await Future.delayed(const Duration(seconds: 1));
//                   controller.reset();
//                   // Navigate to Sign Up Page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SignUpPage()),
//                   );
//                 },
//                 endAction: (controller) async {
//                   controller.loading();
//                   await Future.delayed(const Duration(seconds: 1));
//                   controller.success();
//                   await Future.delayed(const Duration(seconds: 1));
//                   controller.reset();
//                   // Navigate to Login Page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => LoginPage()),
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

// class SignUpPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Sign Up")),
//       body: const Center(child: Text("Welcome to Sign Up Page")),
//     );
//   }
// }

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Login")),
//       body: const Center(child: Text("Welcome to Login Page")),
//     );
//   }
// }
