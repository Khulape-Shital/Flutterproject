import 'package:flutter/material.dart';
import 'package:project16/code.dart';
import 'package:project16/codes_regarding.dart';

class Topics extends StatelessWidget {
  final String? image;
  final String? LangName;
  final List? subTopics;
  final List? regardingCodes; // Assuming image is a single String for one image
  const Topics({super.key, this.image, this.LangName, this.subTopics,this.regardingCodes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 101, 216, 228),
      body: Column(
        children: [
          Container(
            height: 250,
           width: 420,
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(80, 80),
                    bottomRight: Radius.elliptical(80, 80))),
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                     
                      image: DecorationImage(
                        image: AssetImage(image!), // Assuming image is not null
                        fit: BoxFit.cover,
                        // Ensures image fits well in the container
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(1000))),
                ),
                Text(
                  "${LangName}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              
              child: ListView.builder(
                  itemCount: subTopics!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CodesRegarding(regarding:logos![3] ,)));
                        },
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                             color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border: Border.all(
                                  width: 3,
                                  color: Color.fromARGB(255, 177, 174, 174))),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Icon(
                                  Icons.arrow_right_sharp,
                                  size: 20,
                                  color: Color.fromARGB(96, 68, 66, 66),
                                ),
                              ),
                              Text(
                                "${subTopics![index]}",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 81, 79, 79)),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
