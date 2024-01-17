
import 'package:flutter/material.dart';

class RadioTile extends StatelessWidget {
  final double height;
  final Widget leading;
  final Widget title;
  const RadioTile(
      {super.key,
      required this.height,
      required this.leading,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height + 15,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 15, right: 15, top: 7.5, bottom: 7.5),
            width: height + 30,
            child: leading,
          ),
          SizedBox(
            child: title,
          )
        ],
      ),
    );
  }
}



