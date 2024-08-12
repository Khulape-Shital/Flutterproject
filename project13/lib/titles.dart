import 'package:flutter/material.dart';
import 'package:project13/DetaildCard.dart';

import 'package:project13/Home.dart';
import 'package:project13/Screen2.dart';

class Titles extends StatelessWidget {
  final String imgurl;
  final String reating;
  final String type;
  final String flew;
  final String prize;
  const Titles({super.key,required this. imgurl,required this. reating,required this.type,required this.flew,required this. prize});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
      child: Container(
            height: 450,
            width: 170,
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color:Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 140,
                    padding: EdgeInsets.all(10),
                   
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(image: NetworkImage(imgurl),fit: BoxFit.cover),
                      
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Icon(Icons.star_rate,color: Color.fromARGB(255, 242, 168, 58),),
                      Text(reating,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),),
                      ],
                    ),
                  ),
                ),
      
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(type,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Text(flew,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(prize,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
                    FloatingActionButton(onPressed: (){
                      
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Detaildcard(flav: flew, imgurl: imgurl, prize: prize, reating: reating, type: type,)));
                    },
                    backgroundColor: Color.fromARGB(255, 179, 124, 104),
                    child:  Icon(Icons.add,),
                    ),
                      ],
                    ),
                  )
              ],
            ),
          ),
    );
        
  }
}