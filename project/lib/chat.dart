import 'package:flutter/material.dart';


class Chat extends StatefulWidget {
  final String profilePhoto;
  final String accountName;
  final String hoby;
  const Chat({super.key,required this.profilePhoto,required this.accountName,required this.hoby});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final taskcontroller =TextEditingController();
  final List<String>task =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.all(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50,margin: EdgeInsets.all(10),
                    width: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(widget.profilePhoto),fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      
                    ),
                  ),
                 Column(
                  children: [
                     Text(widget.accountName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                   Text(widget.hoby,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 158, 158, 158)),),

                  ],
                 )
                ],
              ),
              Row(
                children: [
                  Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.call,size: 35,color: Colors.white,),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(Icons.videocam_outlined,size: 35,color: Colors.white,),
              ),
                ],
              )


            ],
          ),

          Expanded(
            child: ListView.builder(
              itemCount: task.length,
              
                      
              itemBuilder: (context,index){
                return Container(
                  height: 50,
                 margin: EdgeInsets.only(left: 100),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  
                 
                
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(width: 2,color: Colors.black),
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(30),bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                  ),
                 child: Column(
                   children: [
                     Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          task[index],
                          style: TextStyle(color: Colors.white,fontSize: 20),
                        ),
                      ),
                   ],
                 ),
                );
                      
            }),
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              color: const Color.fromARGB(255, 64, 63, 63),
            ),
            child: Row(

              children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.all(Radius.circular(100)),
                  color: Colors.black,
                ),
                child: Icon(Icons.add,color: Colors.white,),
              ),
             Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: taskcontroller,
                      cursorColor: Color.fromARGB(255, 67, 154, 226),
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type a message',
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                ),
             IconButton(
                  onPressed: () {
                    if (taskcontroller.text.isNotEmpty) {
                      setState(() {
                        task.add(taskcontroller.text);
                        taskcontroller.clear();
                      });
                    }
                  },
                  icon: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          )
          

           
        ],
      ),
    );
  }
}