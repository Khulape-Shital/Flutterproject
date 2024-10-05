import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  final Map? address;
  const Address({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    debugPrint("$address");
    
    return Scaffold(
      appBar: AppBar(
        title: Text("User Address"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(31, 68, 67, 67),
      ),
      body: Container(
            margin:EdgeInsets.all(20),
            height: 170,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 150, 197, 238),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                width: 2,
                color: Color.fromARGB(82, 0, 0, 0)
              )
            ),
            child: ListTile(
              onTap: () {
                // Navigator.push(context,MaterialPageRoute(builder: (context)=>Email(mail: data)));
              },
                    
              title: Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("UserAddress: ${address}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                 
                ],
              )),
            ),
          ),
      
        
      
    );
  }
}