import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  final String name;
  const Screen2({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Screen2"),
        backgroundColor: Color.fromARGB(255, 221, 77, 24),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                height: 400,
                width: 400,
                child: Image.network(name),
              ),


              
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text("BTS (Korean: 방탄소년단; RR: Bangtan Sonyeondan; lit. Bulletproof Boy Scouts), also known as the Bangtan Boys, is a South Korean boy band formed in 2010. The band consists of Jin, Suga, J-Hope, RM, Jimin, V, and Jungkook, who co-write or co-produce much of their material. Originally a hip hop group, they expanded their musical style to incorporate a wide range of genres, while their lyrics have focused on subjects including mental health, the troubles of school-age youth and coming of age, loss, the journey towards self-love, individualism, and the consequences of fame and recognition. Their discography and adjacent work has also referenced literature, philosophy and psychology, and includes an alternate universe storyline.",style: TextStyle(color: Colors.white,fontSize: 25),),
              )
            ],
          ),
        ),
      ),
    );

    
  }
}