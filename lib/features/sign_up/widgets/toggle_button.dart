import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    super.key,
    this.isChecked = false,
  });
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isChecked ? IAIColor.deepBlue : IAIColor.containerBackground,
      ),
      child: isChecked
          ? const Icon(
              Icons.check,
              color: IAIColor.whiteColor,
              size: 14,
            )
          : const SizedBox(),
    );
  }
}
