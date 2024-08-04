import 'package:flutter/material.dart';
import 'package:project12/LogOut.dart';
import 'package:project12/Screen2.dart';
import 'package:project12/profile.dart';

class Screen1 extends StatefulWidget {
 
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _nameControlar = TextEditingController();
   final data2 ="https://upload.wikimedia.org/wikipedia/en/b/bd/Doraemon_character.png";
  @override
  Widget build(BuildContext context) {
    print("hello");
    return Scaffold(
        drawer:Drawer(
          backgroundColor: Colors.black,
          child: Column(
           
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                 
                  Container(
                    margin: EdgeInsets.all(20),
               
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      image: DecorationImage(
                            image:NetworkImage(data2),
                        fit: BoxFit.cover),
                    ),
                  ),

                  Column(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10,),
                        child: Text("Doremon",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.white),),
                      ),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(imgurl: data2)));
                      }, child: Text("Profile"))
                    ],
                  )
                ],
              ),
                Padding(
                        padding: const EdgeInsets.only(bottom: 20,left: 20),
                        child: Text("Accounts",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
                      ),

                        Padding(
                        padding: const EdgeInsets.only(bottom: 20,left: 20),
                        child: Text("Privacy",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
                      ),
                        Padding(
                        padding: const EdgeInsets.only(bottom:20,left: 20),
                        child: Text("Seeting",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white),),
                      ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:  20),
                          child: ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Logout(logOut: _nameControlar.text)));
                                                }, child: Text("Log Out"),
                                               
                                                ),
                        )
            ],
          ),
        ),
        appBar:  AppBar(
          title: const Text("Form Demo"),
        ),
      body: Column(
        children: [
          TextField(
            controller: _nameControlar,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              hintText: "Name",
            ),
          ),
          const SizedBox(height: 20,),

         ElevatedButton(onPressed: (){
                        
                      
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2(data:_nameControlar.text)));
                      }, child: Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 140, 99, 215)),
                        
                        
                        
                      ),
                      ),
          
        ],
      ),
    );
  }
}