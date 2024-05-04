// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:luvit/home/page/home_page.dart';

class BottombarPage extends StatefulWidget {
  const BottombarPage({super.key});

  @override
  State<BottombarPage> createState() => _BottombarPageState();
}

class _BottombarPageState extends State<BottombarPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pageList = [
    HomePage(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      
      body: pageList[_selectedIndex],
      
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        color: Colors.black,
        notchMargin: 8.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {
                _onItemTapped(0);
              },
              child: Column(
                children: [
                  Image.asset(
                    "assets/ic_GNB.png",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "홈",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () => _onItemTapped(1),
              child: Column(
                children: [
                  Image.asset(
                    "assets/Ikon (1).png",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "스팟",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(width: 40.0), // Give space for the FAB
            InkWell(
              onTap: () => _onItemTapped(2),
              child: Column(
                children: [
                  Image.asset(
                    "assets/ic_GNB (1).png",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "채팅",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () => _onItemTapped(3),
              child: Column(
                children: [
                  Image.asset(
                    "assets/Group.png",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "마이",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
          height: 60,
          width: 60,
          margin: const EdgeInsets.only(top: 35),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Colors.grey)),
          child: Image.asset(
            "assets/ic_GNB_like.png",
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          )),
    );
  }
}
