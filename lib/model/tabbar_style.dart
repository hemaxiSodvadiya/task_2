import 'package:flutter/material.dart';

class CustomTabView extends StatefulWidget {
  final Function(int) changeTab;
  final int index;
  const CustomTabView({Key? key, required this.changeTab, required this.index})
      : super(key: key);

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = ["Sports", "Matches", "Upcoming", "Live"];
  final kPrimaryColor = Color(0xff6849ef);
  final kPrimaryLight = Color(0xff8a72f1);
  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(
          gradient: widget.index == index
              ? LinearGradient(
                  colors: [
                    Color(0xfff7bca8),
                    Color(0xffed6b4e),
                  ],
                )
              : null,
          // color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
            color: widget.index != index ? Colors.grey : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color(0xfff7bca8).withOpacity(0.25),
        border: Border.all(
          color: Color(0xffed6b4e),
          width: 1,
        ),
      ),
      child: Row(
        children: _tags
            .asMap()
            .entries
            .map((MapEntry map) => _buildTags(map.key))
            .toList(),
      ),
    );
  }
}
