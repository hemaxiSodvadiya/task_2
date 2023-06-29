import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_10_31_22/views/music_page.dart';
import 'package:firebase_10_31_22/views/travel_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import '../model/global.dart';
import '../model/tabbar_style.dart';

List<Widget> _listOfWidget = <Widget>[
  MusicPage(),
  TravelPage(),
];

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  late PageController _pageController;
  int selectedIndex = 0;
  bool _colorful = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(
      selectedIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfWidget,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        inactiveColor: Colors.white,
        backgroundColor: Colors.black,
        onButtonPressed: onButtonPressed,
        iconSize: 30,
        activeColor: Colors.amber,
        fontSize: 20,
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.music_note_outlined,
            title: 'Music',
          ),
          BarItem(
            icon: Icons.mode_of_travel_outlined,
            title: 'Travel',
          ),
        ],
      ),
    );
  }
}
