import 'package:flutter/material.dart';
import 'package:project16/Screen4.dart';
import 'package:project16/data/project_data.dart';



class Screen3 extends StatelessWidget {
  final Map? title;
  final String? UserName;
  const Screen3({super.key, this.title,this.UserName});

  @override
  Widget build(BuildContext context) {
     debugPrint("$title");
     debugPrint("$UserName");
    return Scaffold(
     appBar: AppBar(title: Text("${title!["topicName"]}"),),

     body: Container(
       child: ListView.builder(
        itemCount:title!["topicCodes"].length,
        itemBuilder: (context,index){
          return 
          ListTile(
            title: Text("${title!["topicCodes"][index]}"),
            onTap: () {
              
              
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen4(logos:programming[index]["Languages"],usar:UserName,)));
            },
            
          );
        
       }),
     )
    );
  }
}
