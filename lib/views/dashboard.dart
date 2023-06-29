import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/global.dart';
import 'detail_page.dart';
import 'home_page.dart';
import 'home_page1.dart';
import 'home_page3.dart';

enum Options { profile1, profile2, profile3, details }

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var appBarHeight = AppBar().preferredSize.height;

  dynamic selected = HomePage();
  @override
  Widget build(BuildContext context) {
    User? data = ModalRoute.of(context)!.settings.arguments as User?;
    // dynamic selected = HomePage(data: data,);

    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Exit App'),
            content: Text('Are you sure you want to exit?'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  // side: BorderSide(color: Colors.yellow, width: 5),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.normal),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: Text('Yes'),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  // side: BorderSide(color: Colors.yellow, width: 5),
                  textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontStyle: FontStyle.normal),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop(); // Pop the screen
                },
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text("Flutter App"),
          centerTitle: true,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                  backgroundColor: Colors.white38,
                  child: PopupMenuButton(
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: Colors.black,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    )),
                    offset: Offset(0.0, appBarHeight),
                    itemBuilder: (ctx) => [
                      _buildPopupMenuItem(
                          "Profile 1",
                          Icons.sports_basketball_outlined,
                          Options.profile1.index),
                      _buildPopupMenuItem("Profile 2", Icons.music_note,
                          Options.profile2.index),
                      _buildPopupMenuItem("Profile 3", Icons.mode_of_travel,
                          Options.profile3.index),
                      _buildPopupMenuItem("Details", Icons.details_outlined,
                          Options.details.index),
                    ],
                    onSelected: (value) {
                      _onSelectedItem(value as int);
                    },
                  )),
            )
          ],
        ),
        body: selected,
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      String title, IconData iconData, int position) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Icon(iconData, color: Colors.black)),
          Text(title),
        ],
      ),
    );
  }

  _onSelectedItem(int value) {
    if (value == Options.profile1.index) {
      print("Profile1 Menu Click");
      setState(() {
        print("**********************0");
        print("**********************0");
        print("${Global.displayName}");
        print("**********************0");
        print("**********************0");
        selected = HomePage();
      });
    } else if (value == Options.profile2.index) {
      print("Profile2 Menu Click");
      setState(() {
        selected = HomePage1();
      });
    } else if (value == Options.profile3.index) {
      print("Profile2 Menu Click");
      setState(() {
        selected = HomePage3();
      });
    } else {
      print("Detail Page :)");
      setState(() {
        selected = DetailPage();
      });
    }
  }
}
