import 'package:flutter/material.dart';

class Containercard extends StatelessWidget {

  final String title;

  const Containercard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
                            height: 100,
                            width: 100,margin: EdgeInsets.only(right: 25),
                            decoration: BoxDecoration(color: Colors.white,
                              borderRadius:BorderRadius.all(Radius.circular(20)),
                              boxShadow: [BoxShadow(
                                blurRadius:10,
                                blurStyle: BlurStyle.normal,
                                
                                color: Color.fromARGB(255, 227, 226, 226),
                                offset: Offset(10, 10),
                                spreadRadius:5,
                              )]
                      
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.smart_button_rounded,color: Color.fromARGB(255, 0, 27, 24),size: 40,),
                                Text(title,style: TextStyle(fontSize:15,fontWeight:FontWeight.w400),)
                              ],
                            ),
                          );
  }
}