import 'package:flutter/material.dart';
import 'package:project13/Screen2.dart';

class Coffeetypes extends StatefulWidget {

 final bool updateHover;
 final String title;
  Coffeetypes({super.key,required this.updateHover,required this.title});

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
                        Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Screen2()));
          }, child: Center(
                  child: Text(
              " title",
                style: TextStyle(
             
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )),) ,
    );
  }
  void _updateHover(bool hover){
    setState(() {
      isHovered =hover;
    });
  }


}


