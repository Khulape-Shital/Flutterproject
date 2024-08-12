import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final taskcontroller =TextEditingController();
  List task =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Form building"),
        centerTitle: true,
      ),

      body: Container(

        height: 700,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ListView.builder(
              itemCount: task.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                      height: 100,
                      width: 300,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(child: Text(task[index],style: TextStyle(color: Colors.black),)),
                      
                          
                  ),
                );
        
            }),
          Padding(
            padding: const EdgeInsets.all(50),
            child: TextField(
              controller: taskcontroller,
              cursorColor: Colors.blue,
              
            ),
          ),
          ElevatedButton(onPressed: (){
            task.add(taskcontroller.text);
            taskcontroller.clear();
            setState(() {
              
            });
          }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}