import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/food_helper.dart';
import '../helper/sport_helper.dart';
import '../model/global.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: CloudFirebaseHelper1.cloudFirebaseHelper1.selectRecord(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(" something error cheak please...${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            QuerySnapshot? data = snapshot.data;

            List<QueryDocumentSnapshot> documents = data!.docs;

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    print("**********************0");
                    print("**********************0");
                    print("${Global.displayName}");
                    print("**********************0");
                    print("**********************0");
                    Global.food = "Food";
                  },
                  child: Container(
                    width: 300,
                    height: 200,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(documents[i]['image'])),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(10, 20),
                          blurRadius: 30,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 20,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.75),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "${documents[i]['name']}",
                            style: GoogleFonts.lora(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: documents.length,
            );
          }
          return Center(
            child: Text("not possiable..."),
          );
        },
      ),
    );
  }
}
