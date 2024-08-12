import 'package:flutter/material.dart';
import 'package:project13/Screen2.dart';

class Detaildcard extends StatefulWidget {

  final String imgurl;
  final String reating;
  final String type;
  final String flav;
  final String prize;

  const Detaildcard({super.key,required this. imgurl,required this. reating,required this.type,required this.flav,required this. prize});

  @override
  State<Detaildcard> createState() => _DetaildcardState();
}




class _DetaildcardState extends State<Detaildcard> {
  Color iconColor =Colors.black;
bool onClickColor =true;
  void ChangeIconColor(){

        if(onClickColor){
          onClickColor =false;
        }
        else{
          onClickColor =true;

        }
        setState(() {
          
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "09:51",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.network_cell_rounded,
            color: Colors.white,
          ),
          Padding(padding: EdgeInsets.only(right: 10)),
          Icon(Icons.wifi_1_bar, color: Colors.white),
          Padding(padding: EdgeInsets.only(right: 10)),
          Padding(padding: EdgeInsets.only(right: 10)),
          Icon(Icons.battery_3_bar_rounded, color: Colors.white)
        ],
        backgroundColor: Colors.black,
      ),

      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
              }, child: Text("<",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color:Colors.black ),))
            ],
          ),
          Text("Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),


            Container()
            
        ],
      ),
// body: Stack(
//   children: [
//     Column(
//       children: [
//         Row(
//           children: [
//             Text("9.5",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.white,),),
//             Icon(
//             Icons.network_cell_rounded,
//             color: Colors.white,
//           ),
//           Padding(padding: EdgeInsets.only(right: 10)),
//           Icon(Icons.wifi_1_bar, color: Colors.white),
//           Padding(padding: EdgeInsets.only(right: 10)),
//           Padding(padding: EdgeInsets.only(right: 10)),
//           Icon(Icons.battery_3_bar_rounded, color: Colors.white)
//           ],
//         ),
//        AppBar(
//         title: Text(
//           "09:51",
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           Icon(
//             Icons.network_cell_rounded,
//             color: Colors.white,
//           ),
//           Padding(padding: EdgeInsets.only(right: 10)),
//           Icon(Icons.wifi_1_bar, color: Colors.white),
//           Padding(padding: EdgeInsets.only(right: 10)),
//           Padding(padding: EdgeInsets.only(right: 10)),
//           Icon(Icons.battery_3_bar_rounded, color: Colors.white)
//         ],
//         backgroundColor: Colors.black,
//       ),
//       ],
//     )
//   ],
// // ),
// body: Container(
//   height: double.infinity,
//   width: double.infinity,
//   color: Colors.amber,
//   child: Center(
//     child: Column(
//       children: [
//         Text(widget.flav),
//         Text(widget.reating),
//         Text(widget.prize),
//         Container(
//           height: 100,
//           width: 100,
//           child: Image.asset("images/copy.png"),
//         )

//       ],
//     ),
//   ),
// ),

   );
  }
 }