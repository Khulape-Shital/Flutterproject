import 'package:flutter/material.dart';
import 'package:project13/Screen2.dart';

class Coffeetypes extends StatefulWidget {

 final bool updateHover;
  
  Coffeetypes({super.key,required this.updateHover});

  @override
  State<Coffeetypes> createState() => _CoffeetypesState();
}

class _CoffeetypesState extends State<Coffeetypes> {
  bool isHovered =false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
          onEnter: (event) => _updateHover(true),
          onExit: (event) => _updateHover(false),
          child:ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>((States){
                if (States.contains(MaterialState.hovered)){
                  return Colors.blue;
                }
                return Colors.red;
              })
            ),
            onPressed: (){

          }, child: Text("Capaichinu")) ,
    );
  }
  void _updateHover(bool hover){
    setState(() {
      isHovered =hover;
    });
  }


}


