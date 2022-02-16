import 'package:flutter/material.dart';
import 'package:flutter_base_project/shared/color_constants.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
    this.icon,
    this.hintText,
    required this.onChanged,
    this.value,
    this.controller,
    this.isPassword = false,
  }) : super(key: key);

  final Widget? icon;
  final String? hintText;
  final bool isPassword;
  final ValueChanged<String> onChanged;
  final String? value;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (value != null && value!.isNotEmpty && controller != null) {
      controller!.text = value!;
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: isPassword,
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey[800], fontSize: 16),
          hintText: hintText,
        ),
      ),
    );
  }
}
