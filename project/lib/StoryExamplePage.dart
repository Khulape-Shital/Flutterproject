import 'package:flutter/material.dart';
import 'package:flutter_instagram_storyboard/flutter_instagram_storyboard.dart';


class Storyexamplepage extends StatefulWidget {
  const Storyexamplepage({super.key});

  @override
  State<Storyexamplepage> createState() => _StoryexamplepageState();
}

class _StoryexamplepageState extends State<Storyexamplepage> {
  static const double _borderRadius = 100.0;

  Widget _createDummyPage({
    required String text,
    required String imageName,
    bool addBottomBar = true,
  }) {
    return StoryPageScaffold(
      bottomNavigationBar: addBottomBar
          ? SizedBox(
              width: double.infinity,
              height: kBottomNavigationBarHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            _borderRadius,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/$imageName.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonChild(String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100.0,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 11.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  BoxDecoration _buildButtonDecoration(
    String imageName,
  ) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(_borderRadius),
      image: DecorationImage(
        image: AssetImage(
          'assets/images/$imageName.png',
        ),
        fit: BoxFit.cover,
      ),
    );
  }

  BoxDecoration _buildBorderDecoration(Color color) {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(_borderRadius),
      ),
      border: Border.fromBorderSide(
        BorderSide(
          color: color,
          width: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Column(
        children: [
          StoryListView(
            listHeight: 170.0,
            pageTransform: const StoryPage3DTransform(),
            buttonDatas: [
              StoryButtonData(
                timelineBackgroundColor: Colors.red,
                buttonDecoration: _buildButtonDecoration('car'),
                child: _buildButtonChild('Want a new car?'),
                borderDecoration: _buildBorderDecoration(Colors.red),
                storyPages: [
                  _createDummyPage(
                    text:
                        'Want to buy a new car? Get our loan for the rest of your life!',
                    imageName: 'car',
                  ),
                  _createDummyPage(
                    text:
                        'Can\'t return the loan? Don\'t worry, we\'ll take your soul as a collateral ;-)',
                    imageName: 'car',
                  ),
                ],
                segmentDuration: const Duration(seconds: 3),
              ),
              StoryButtonData(
                timelineBackgroundColor: Colors.blue,
                buttonDecoration: _buildButtonDecoration('travel_1'),
                borderDecoration: _buildBorderDecoration(
                    const Color.fromARGB(255, 134, 119, 95)),
                child: _buildButtonChild('Travel whereever'),
                storyPages: [
                  _createDummyPage(
                    text: 'Get a loan',
                    imageName: 'travel_1',
                    addBottomBar: false,
                  ),
                  _createDummyPage(
                    text: 'Select a place where you want to go',
                    imageName: 'travel_2',
                    addBottomBar: false,
                  ),
                  _createDummyPage(
                    text: 'Dream about the place and pay our interest',
                    imageName: 'travel_3',
                    addBottomBar: false,
                  ),
                ],
                segmentDuration: const Duration(seconds: 3),
              ),
              StoryButtonData(
                timelineBackgroundColor: Colors.orange,
                borderDecoration: _buildBorderDecoration(Colors.orange),
                buttonDecoration: _buildButtonDecoration('house'),
                child: _buildButtonChild('Buy a house anywhere'),
                storyPages: [
                  _createDummyPage(
                    text: 'You cannot buy a house. Live with it',
                    imageName: 'house',
                  ),
                ],
                segmentDuration: const Duration(seconds: 5),
              ),
              StoryButtonData(
                timelineBackgroundColor: Colors.red,
                buttonDecoration: _buildButtonDecoration('car'),
                child: _buildButtonChild('Want a new car?'),
                borderDecoration: _buildBorderDecoration(Colors.red),
                storyPages: [
                  _createDummyPage(
                    text:
                        'Want to buy a new car? Get our loan for the rest of your life!',
                    imageName: 'car',
                  ),
                  _createDummyPage(
                    text:
                        'Can\'t return the loan? Don\'t worry, we\'ll take your soul as a collateral ;-)',
                    imageName: 'car',
                  ),
                ],
                segmentDuration: const Duration(seconds: 3),
              ),
              StoryButtonData(
                buttonDecoration: _buildButtonDecoration('travel_1'),
                borderDecoration: _buildBorderDecoration(
                    const Color.fromARGB(255, 134, 119, 95)),
                child: _buildButtonChild('Travel whereever'),
                storyPages: [
                  _createDummyPage(
                    text: 'Get a loan',
                    imageName: 'post',
                    addBottomBar: false,
                  ),
                  _createDummyPage(
                    text: 'Select a place where you want to go',
                    imageName: 'travel_2',
                    addBottomBar: false,
                  ),
                  _createDummyPage(
                    text: 'Dream about the place and pay our interest',
                    imageName: 'travel_3',
                    addBottomBar: false,
                  ),
                ],
                segmentDuration: const Duration(seconds: 3),
              ),
              StoryButtonData(
                isVisibleCallback: () {
                  return false;
                },
                timelineBackgroundColor: Colors.orange,
                borderDecoration: _buildBorderDecoration(Colors.orange),
                buttonDecoration: _buildButtonDecoration('house'),
                child: _buildButtonChild('Buy a house anywhere'),
                storyPages: [
                  _createDummyPage(
                    text: 'You cannot buy a house. Live with it',
                    imageName: 'house',
                  ),
                ],
                segmentDuration: const Duration(seconds: 5),
              ),
            ],
          ),



        ],
      ),
    );
  }
}