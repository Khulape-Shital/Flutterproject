import 'package:flutter/material.dart';
import 'package:project10/Screen2.dart';

class Screen1 extends StatelessWidget {
  final String imgurl ="https://m.media-amazon.com/images/M/MV5BNzkxOGE0NzgtYzAwYS00NWE4LTk4Y2EtMWE4YTQ0YjVlMTdiXkEyXkFqcGdeQXVyMTU3ODQxNDYz._V1_FMjpg_UX1000_.jpg";
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Screen1"),
        backgroundColor: Color.fromARGB(255, 221, 77, 24),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 100)),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(imgurl),fit: BoxFit.cover,
              ),
              borderRadius:BorderRadius.all(Radius.circular(100)) ,),margin: EdgeInsets.all(30),
            ),
        
            ElevatedButton(onPressed: (){Color.fromARGB(0, 31, 31, 180);
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Screen2(name: imgurl,)));
            }, child: Text("Profile view")),
            
          ],
        ),
      ),
    );

  }
}