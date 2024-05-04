import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: Center(
          child: SizedBox(
            height: Get.height * 0.7,
            child: PageView(
              children: [
                Container(
                  height: Get.height * 0.7,
                  width: double.infinity,
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    // image: DecorationImage(image: AssetImage("assets/image1.png")),
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
                            "assets/image1.png",
                            fit: BoxFit.cover,
                            height: Get.height * 0.7,
                            width: double.infinity,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              // image: DecorationImage(image: AssetImage("assets/image1.png")),
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
                                              fontSize: 28,
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
                                    Image.asset("assets/btcon_48.png",height: 48,width: 48,)
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          )),
    );
  }
}
