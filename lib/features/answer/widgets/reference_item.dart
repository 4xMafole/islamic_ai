import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class ReferenceItem extends StatelessWidget {
  const ReferenceItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: IAIColor.whiteColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: IAIColor.textGray),
        ),
        child: Text(
          faker.lorem.sentence(),
          style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: IAIColor.sentence,
          ),
        ),
      ),
    );
  }
}
