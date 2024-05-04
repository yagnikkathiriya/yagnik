// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, avoid_print, unused_field, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CardSwiperController controller = CardSwiperController();
  List<SwipeItem> _swipeItems = [];
  MatchEngine? matchEngine;
  int _currentIndex = 0;
  List<Container> cards = [];
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    addItem();
  }

  List<String> imageList = [
    "assets/image1.png",
    "assets/image2.png",
    "assets/image3.png",
    "assets/image3.png",
    "assets/image3.png",
  ];

  void addItem() {
    cards = List.generate(
      imageList.length,
      (index) => Container(
          height: Get.height * 0.7,
          width: double.infinity,
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff3A3A3A)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.75, 3, 3],
                colors: [
                  Colors.transparent,
                  Colors.black45,
                  Colors.black12,
                ],
              ),
              borderRadius: BorderRadius.circular(12)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    imageList[index],
                    fit: BoxFit.cover,
                    height: Get.height * 0.7,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.75, 07, 3],
                        colors: [
                          Colors.transparent,
                          Colors.black,
                          Colors.black87,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 35,
                          width: Get.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/star1.png",
                                height: 20,
                                width: 20,
                              ),
                              SizedBox(width: Get.width * 0.03),
                              Text(
                                "29,930",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: Get.height * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "잭과분홍콩나물 25",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                Text(
                                  "서울 - 2km 거리에 ",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/btcon_48.png",
                              height: 48,
                              width: 48,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.all(14),
          child: Image.asset("assets/location.png"),
        ),
        title: Text(
          "목이길어슬픈기린님의 새로운 스팟",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white),
        ),
        titleSpacing: 0,
        actions: [
          Row(
            children: [
              Image.asset("assets/Star.png", height: 20, width: 20),
              SizedBox(
                width: Get.width * 0.012,
              ),
              Text(
                "323,233",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Image.asset(
                "assets/btcon_40.png",
                height: 30,
                width: 30,
              )
            ],
          ),
          SizedBox(
            width: Get.width * 0.012,
          ),
        ],
      ),
      body: cards.isNotEmpty
          ? CardSwiper(
              controller: controller,
              cardsCount: cards.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 1,
              backCardOffset: const Offset(40, 40),
              cardBuilder: (
                context,
                index,
                horizontalThresholdPercentage,
                verticalThresholdPercentage,
              ) {
                print("------------>>>>>>"+cards.length.toString());
                print("------currentIndex----->>>>>>"+_currentIndex.toString());

                if(index>(cards.length-1)){
                  controller.moveTo(0);
                  return SizedBox();
                }
                return Stack(
                  children: [
                    cards[index],
                    Positioned(
                      left: 0.0,
                      right: MediaQuery.of(context).size.width / 2,
                      top: 0.0,
                      bottom: 0.0,
                      child: GestureDetector(
                        onTap: () => _goToPreviousImage(),
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                    Positioned(
                        top: 20,
                        left: 0,
                        right: 0,
                        child: _buildPageIndicator()),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 2,
                      right: 0.0,
                      top: 0.0,
                      bottom: 0.0,
                      child: GestureDetector(
                        onTap: () => _goToNextImage(),
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                  ],
                );
              })
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "추천 드릴 친구들을 준비 중이에요",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "매일 새로운 친구들을 소개시켜드려요",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void _goToPreviousImage() {
    if (_currentIndex > 0) {
      controller.moveTo(_currentIndex - 1);

      _currentIndex = _currentIndex - 1;
      setState(() {});
    }
  }

  void _goToNextImage() {
    if (_currentIndex < 4) {
      controller.moveTo(_currentIndex + 1);
      _currentIndex = _currentIndex + 1;
      setState(() {});
    }
  }

  void _handlingOnPageChanged(int page) {
    setState(() => _currentIndex = page);
  }

  Widget _buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < cards.length; i++) {
      row.children.add(_buildPageIndicatorItem(i));
      if (i != cards.length - 1)
        row.children.add(Container(
          width: 6,
        ));
    }
    return row;
  }

  Widget _buildPageIndicatorItem(int index) {
    return Container(
      width: index == _currentIndex ? 45 : 45,
      height: index == _currentIndex ? 6 : 6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: index == _currentIndex ? Colors.pink : Colors.grey),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {
      if (direction == CardSwiperDirection.left ||
          direction == CardSwiperDirection.bottom
          ) {
            print("=======   ${previousIndex}   ${currentIndex}");
        cards.removeAt(previousIndex);
        controller.moveTo(currentIndex??0);
        // controller.
      } else {
      _currentIndex = currentIndex ?? previousIndex;
      }
    });

    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    print(direction.name);
    print(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}

class Content {
  final String? text;
  final Color? color;

  Content({this.text, this.color});
}
