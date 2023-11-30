import 'package:d_mans/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: mainColor,
    minimumSize: const Size(88, 44),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: mainColor,
        border: Border.all(color: colorBlack),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        style: flatButtonStyle,
        onPressed: press,
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
