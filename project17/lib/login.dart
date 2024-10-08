import 'package:flutter/material.dart';
import 'package:project17/home.dart';


class Login extends StatefulWidget {
  
  const Login({super.key});

  @override
  State<Login> createState() => _HomeState();
}

class _HomeState extends State<Login> {
  final UserName =TextEditingController();
  final Passward =TextEditingController();

   final List<String>task =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        height: 750,
             
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://png.pngtree.com/thumb_back/fh260/background/20230408/pngtree-rainbow-curves-abstract-colorful-background-image_2164067.jpg",),fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
            
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2,
                    color: Colors.black
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                            controller: UserName,
                            cursorColor: Color.fromARGB(255, 67, 154, 226),
                            style: TextStyle(color: const Color.fromARGB(255, 24, 23, 23)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Name',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                  ),
                        
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2,
                    color: Colors.black
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                            controller: Passward,
                            cursorColor: Color.fromARGB(255, 67, 154, 226),
                            style: TextStyle(color: const Color.fromARGB(255, 13, 11, 11)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Passward',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                  ),
                        
                             ),
               ),
           ElevatedButton(onPressed: (){
            if(UserName.text=="" && Passward.text=="" ){
            
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
            }
            
          }, child: Text("Submit"))
        
        
             
            ],
          ),
        ),
      ),
    );
  }
}