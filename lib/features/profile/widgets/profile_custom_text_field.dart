import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class ProfileCustomTextField extends StatelessWidget {
  const ProfileCustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: IAIColor.whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: IAIColor.tabBarInactive,
            spreadRadius: -10,
            blurRadius: 20,
          )
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: IAIColor.subTitle,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
