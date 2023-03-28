import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.value,
    required this.dropDownItems,
    required this.onChanged,
  });
  final String hintText;
  final String? value;
  final List<String> dropDownItems;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: const Icon(Icons.keyboard_arrow_down),
          value: value,
          hint: Text(
            hintText,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: IAIColor.subTitle,
            ),
          ),
          items: dropDownItems.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
