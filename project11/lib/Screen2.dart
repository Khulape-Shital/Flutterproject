import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project11/ContainerCard.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("8:00",style: TextStyle(color: Colors.black),),
        actions: [Icon(Icons.network_cell_outlined,color: Colors.black,),Icon(Icons.network_wifi_3_bar_sharp,color: Colors.black),Icon(Icons.battery_6_bar_sharp,color: Colors.black),Padding(padding: EdgeInsets.only(left: 10))],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 270,
                     
                
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Color.fromARGB(255, 245, 241, 241),
                      ),
                      child: Row(
                         
                        children: [
                         
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 30),
                            child: Icon(Icons.search,),
                          ),
                          Text("Search Now",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Icon(Icons.arrow_drop_down),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black,
                          width:1),
                        ),
                      ),
                    )
                  ],
                  
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 150,
                    child: SingleChildScrollView(
                      
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround    ,
                        
                        children: [
                          
                          Containercard(title: "Near By"),
                          Containercard(title: "Book Now"),
                          Containercard(title: "Near By"),
                          Containercard(title: "Near By"),
                          Containercard(title: "Near By"),
                          Containercard(title: "Near By"),
                          Containercard(title: "Near By"),

                          
                      
                        ],
                      )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200,bottom: 30),
                  child: Text("Category",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,)),
                ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                       ElevatedButton(onPressed: (){
                      Padding(padding: EdgeInsets.only(right: 20));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                      }, child: Text("House",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white,),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 15, 3, 37)),
                        
                        
                        
                      ),
                      ),
                       ElevatedButton(onPressed: (){
                       Padding(padding: EdgeInsets.only(right: 20));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                      }, child: Text("villa",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 15, 3, 37)),
                        
                        
                        
                      ),
                      ),
                       ElevatedButton(onPressed: (){
                       Padding(padding: EdgeInsets.only(right: 20));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                      }, child: Text("Apartments",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 23, 2, 62)),
                        
                        
                        
                      ),
                      ),
                       ElevatedButton(onPressed: (){
                       Padding(padding: EdgeInsets.only(right: 20));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                      }, child: Text("Penthouse",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 32, 2, 88)),
                        
                        
                        
                      ),
                      ),
                       ElevatedButton(onPressed: (){
                       Padding(padding: EdgeInsets.only(right: 20));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                      }, child: Text("Penthouse",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 32, 2, 88)),
                        
                        
                        
                      ),
                      ),

                                      ElevatedButton(onPressed: (){
                       Padding(padding: EdgeInsets.only(right: 20));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                      }, child: Text("Penthouse",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 32, 2, 88)),
                        
                        
                        
                      ),
                      ),

                              ElevatedButton(onPressed: (){
                       Padding(padding: EdgeInsets.only(right: 20));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                      }, child: Text("Penthouse",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 24, 2, 63)),
                        
                        
                        
                      ),
                      ),


                  ],
                  
                ),
              ),
              Container(
                height:320,
                width: 320,margin:EdgeInsets.all(20),
                
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  
                  
                ),
                child: Column(
                  children: [
                    Container(margin: EdgeInsets.only(top: 20),
                      height: 200,
                      width:280 ,
                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyUfJPOm_ZvO98RXF5wxxFIh-JTj83CTbRYw&s"),fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20,left: 20),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          
                          Text("Wooden Hut",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                          Text("Rp. 249.000 / Night")
                        ],
                        
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(right: 20,top: 10,),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(right: 10,)),
                          Icon(Icons.location_on_outlined,color: Colors.blue,),
                          Text("Merbabu,Central java",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.blue),),
                         
                        ],
                        
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(right: 20,top:10,),
                      child: Row(
                        
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Icon(Icons.all_inclusive_outlined,size: 15,),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text("All Inclusive",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,),),
                          ),
                         
                          Icon(Icons.wifi_calling_3_sharp,size: 15,),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text("free Wifi",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,),),
                          ),
                         
                          Icon(Icons.phone_android,size: 15,),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text("Free Contsultation",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w300,),),
                          ),
                         
                        ],
                        
                      ),
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}