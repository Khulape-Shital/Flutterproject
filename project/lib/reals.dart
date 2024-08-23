import 'package:flutter/material.dart';
import 'package:project/program2.dart';
import 'package:project/reals.dart';
class Reales extends StatefulWidget {
  const Reales({super.key});

  @override
  State<Reales> createState() => _RealesState();
}

class _RealesState extends State<Reales> {
  static real d1 =real(
    realUrl: "",
  );

  final List<real> data =[d1];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount:data.length ,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          Row(
            children: [
              Container()
            ],
          );

      }),
    );
  }
}