import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/global.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "${Global.data!.email}",
              style: GoogleFonts.lora(fontSize: 20, color: Colors.black),
            ),
          ),
          DottedLine(
            dashLength: 10,
            dashGapLength: 5,
            lineThickness: 1,
            dashColor: Colors.grey.shade700,
            dashGapColor: Colors.transparent,
            direction: Axis.horizontal,
            lineLength: 350,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("${Global.sport}"),
                Text("${Global.music}"),
                Text("${Global.food}"),
                Text("${Global.travel}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
