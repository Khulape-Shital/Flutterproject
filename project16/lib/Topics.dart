import 'package:flutter/material.dart';
import 'package:project16/Screen3.dart';
import 'package:project16/data/project_data.dart';

class Topics extends StatelessWidget {
  final String? UserName;
  final List? logo;
  const Topics({super.key, this.logo,this. UserName});

  @override
  Widget build(BuildContext context) {
    
     debugPrint("$logo");
    return Scaffold(
     appBar: AppBar(title: Text("Topics"),),
     body: ListView.builder(
      itemCount:logo!.length,
      itemBuilder: (context,index){
        return  ListTile(
      title: Text("${logo![index]["topicName"]}"),
          onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen3(title: programming[index],UserName: UserName,)));
          },
        );
        

      
     })
    );
  }
}