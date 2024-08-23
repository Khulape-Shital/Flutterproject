
import 'package:flutter/material.dart';

class Program3 extends StatefulWidget {
   String? properties;
  Program3({super.key,this.properties});


  @override
  State<Program3> createState() => _Program3State();
}

class _Program3State extends State<Program3> {
  @override
  Widget build(BuildContext context) {

     return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         

          children: [
            Text("${widget.properties}",style: TextStyle(color: Colors.white),),

            Icon(Icons.arrow_forward_ios_outlined,size: 20,color: Colors.white,)
          ],
        ),
      )
    );

    
    
  }
}