import 'package:flutter/material.dart';
import 'package:flutter_base_project/shared/color_constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.enable = true,
  }) : super(key: key);

  final VoidCallback press;
  final String title;
  final Color color, textColor;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          onPressed: enable ? press : null,
          child: Text(
            title,
            style: TextStyle(color: textColor),
          ),
          style: ElevatedButton.styleFrom(
            primary: color,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
        ),
      ),
    );
  }
}
