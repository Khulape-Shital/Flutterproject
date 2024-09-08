import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  final List? logos;
  final String? usar;

  const Screen4({super.key, this.logos, this.usar});

  @override
  Widget build(BuildContext context) {
    debugPrint("$logos");
    return Scaffold(
      appBar: AppBar(title: const Text("Topics")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Profile Section
            Container(
              height: 250,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 104, 152, 225),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "9:41",
                        style: TextStyle(fontSize: 35, color: Colors.black),
                      ),
                      Row(
                        children: [
                          Icon(Icons.network_cell_outlined, color: Colors.black),
                          Icon(Icons.wifi, color: Colors.black),
                          Icon(Icons.battery_4_bar_sharp, color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://i.pinimg.com/736x/33/ba/df/33badf7bd7e2bd56b21e3d972fe3ed5a.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Hi",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "$usar",
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Text(
                            "hope you are fine",
                            style: TextStyle(
                                fontSize: 15, color: Colors.white, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Programming Languages Section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Programming Languages",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: logos![0]["Languages"].length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 150,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(width: 1, color: const Color.fromARGB(96, 174, 173, 173)),
                      image: DecorationImage(
                        image: AssetImage("${logos![0]["Languages"][index]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Courses Section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Courses For You",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: logos![0]["courses"].length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 150,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      border: Border.all(width: 1, color: const Color.fromARGB(96, 174, 173, 173)),
                      image: DecorationImage(
                        image: AssetImage("${logos![0]["courses"][index]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
