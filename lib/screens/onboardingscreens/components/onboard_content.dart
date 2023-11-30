import 'package:d_mans/utils/colors.dart';
import 'package:flutter/material.dart';

class OnBoardContent extends StatefulWidget {
  const OnBoardContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  State<OnBoardContent> createState() => _OnBoardContentState();
}

class _OnBoardContentState extends State<OnBoardContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          "D'Mans",
          style: TextStyle(
            fontSize: 32,
            color: mainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          widget.image!,
          height: 265,
          width: 235,
        ),
      ],
    );
  }
}
