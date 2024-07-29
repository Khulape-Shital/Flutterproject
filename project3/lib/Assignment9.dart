import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Assignment9 extends StatelessWidget {
  const Assignment9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Box scroll"),
          backgroundColor: Colors.cyan,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(left: 20),
                  child: Image.network(
                      "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg"),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                    color: Colors.cyan,
                  )),
              Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(left: 20),
                  child: Image.network(
                      "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg"),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 23, 9, 141),
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  )),
              Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(left: 20),
                  child: Image.network(
                      "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg"),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 113, 12, 144),
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  )),
              Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(left: 20),
                  child: Image.network(
                      "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg"),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 212, 138, 0),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  )),
              Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                    color: Color.fromARGB(255, 183, 179, 220),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  )),
              Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                    color: Color.fromARGB(255, 136, 133, 168),
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  )),
              Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                    color: Color.fromARGB(255, 69, 60, 147),
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  )),
              Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg")),
                    color: Color.fromARGB(255, 46, 28, 207),
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  )),
              Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.only(left: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          "https://m.media-amazon.com/images/I/71qTm-Xrh0L._AC_UF1000,1000_QL80_.jpg",
                        ),
                        fit: BoxFit.cover),
                    color: Color.fromARGB(255, 35, 56, 19),
                    borderRadius: BorderRadius.all(Radius.circular(1000)),
                  )),
            ],
          ),
        ));
  }
}
