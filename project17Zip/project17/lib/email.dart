import 'package:flutter/material.dart';
import 'package:project17/address.dart';

class Email extends StatelessWidget {
  final Map?  mail;
  const Email({super.key, this.mail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Email"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(31, 68, 67, 67),
      ),
      body: Container(
            margin:EdgeInsets.all(20),
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 150, 197, 238),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                width: 2,
                color: Color.fromARGB(82, 0, 0, 0)
              )
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Address(address: mail!["address"],)));
              },
                    
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("UserEmail: ${mail!["email"]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                  Text("UserID:${mail!["id"]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),)
                ],
              ),
            ),
          )
      
        
     
    );
  }
}