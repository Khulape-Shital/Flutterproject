import 'package:flutter/material.dart';
import 'package:project/program2.dart';

class Detailedsettings extends StatefulWidget {
  const Detailedsettings({
    super.key,
  });

  @override
  State<Detailedsettings> createState() => _DetailedsettingsState();
}

class _DetailedsettingsState extends State<Detailedsettings> {
  static Detaileds d1 = Detaileds(
    logo: "images/save.png",
    title: "Saved",
  );
  static Detaileds d2 = Detaileds(
    logo: "images/save.png",
    title: "Archive",
  );
  static Detaileds d3 = Detaileds(
    logo: "images/save.png",
    title: "Your activity",
  );

  static Detaileds d4 = Detaileds(
    logo: "images/save.png",
    title: "Notifications",
  );

  static Detaileds d5 = Detaileds(
    logo: "images/save.png",
    title: "Time spent",
  );

  final List<Detaileds> object1 = [d1, d2, d3, d4, d5];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: object1.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 20,
                                width: 20,
                                child: Image(
                                  image: AssetImage("${object1[index].logo}"),
                                  color: Colors.white,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${object1[index].title}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
