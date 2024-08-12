import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  bool boxColor =true;
      int count =0;
      Widget myText(){
        if(count>= 1){
          return Center(
            child: Text("Portfolio"),
          );
          
        }
        else{
          return Container();
        }
      }
        Widget myContainer(){
        if(count>= 2){
          return Center(
            child:Container(
              height: 100,
              width: 100,
              color: Colors.red,
            )
          );
          
        }
        else{
          return Container();
        }
        
      }

       Widget mySkills(){
        if(count>= 3){
          return Column(
            children: [
              Text("Skills"),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 200,
                      width: 100,
                      color: Colors.red,
                      margin: EdgeInsets.only(right: 20),
                    ),
                     Container(
                      height: 200,
                      width: 100,
                      color: Colors.red,
                      margin: EdgeInsets.only(right: 20),
                    ),
                     Container(
                      height: 200,
                      width: 100,
                      color: Colors.red,
                      margin: EdgeInsets.only(right: 20),
                    ),
                     Container(
                      height: 200,
                      width: 100,
                      color: Colors.red,
                      margin: EdgeInsets.only(right: 20),
                    ),
                     Container(
                      height: 200,
                      width: 100,
                      color: Colors.red,
                      margin: EdgeInsets.only(right: 20),
                    ),

                  ],
                ),
              )
            ],
          );
          
        }
        else{
          return Container();
        }
        
      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("statefull Widget"),
      ),
      body: Column(
        children: [
          myText(),
          myContainer(),
          mySkills(),
          FloatingActionButton(onPressed: (){
              count++;setState(() {
                
              });
            
          },backgroundColor: boxColor?const Color.fromARGB(255, 130, 54, 244):Colors.blue,
          child: Icon(Icons.add),)
        ],
      ),
    );
  }
}