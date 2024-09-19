import 'package:flutter/material.dart';

class CodesRegarding extends StatelessWidget {
  final List? regarding;
  const CodesRegarding({super.key,this. regarding});

  @override
  Widget build(BuildContext context) {
debugPrint("$regarding");
    return Scaffold(
      body: Container(
              
              child: ListView.builder(
                  itemCount:regarding!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => CodesRegarding(regarding:["regardingCodes"],)));
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
                                "${regarding![index]}",
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
    );
  }
}