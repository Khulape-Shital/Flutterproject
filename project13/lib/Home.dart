import 'package:flutter/material.dart';
import 'package:project13/Screen2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("09:51",style: TextStyle(color: Colors.white),),
        actions: [Icon(Icons.network_cell_sharp,color: Colors.white,),Padding(padding: EdgeInsets.only(right: 5)),Icon(Icons.wifi_sharp,color: Colors.white),Padding(padding: EdgeInsets.only(right:5)),Padding(padding: EdgeInsets.only(right: 5)),Icon(Icons.battery_3_bar_rounded,color: Colors.white)],
        backgroundColor: Color.fromARGB(255, 81, 177, 233),
      ),
      body: Container(
        height: 700,
       
        decoration: BoxDecoration(
          
            image: DecorationImage(image: NetworkImage("https://www.wedreamoftravel.com/wp-content/uploads/2021/03/Quotes-About-The-Sea-6.jpg"),fit: BoxFit.cover)
          ),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text("Life's a beach and I'm playing in the sand,",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800,color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35,right: 35),
                child: Text("The best grain ,thi finest rost,the Powerfull flower,",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.white),),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(onPressed: (){
                 
                             
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                
                }, child: Text("Get Started",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w200,color: Colors.white),
                ),
                 style:  ButtonStyle(backgroundColor: WidgetStatePropertyAll(Color.fromARGB(255, 81, 177, 233)),padding: WidgetStatePropertyAll(EdgeInsets.only(bottom: 25,left: 35,right: 35,top: 25))),
                 
                 
                 ),
              )
               ,

              
              
            ],


          ),
      )

    
      
    );
}
}