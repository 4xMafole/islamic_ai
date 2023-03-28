import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class AnswerTextBox extends StatelessWidget {
  const AnswerTextBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          faker.lorem.sentences(5).map((e) => e).toString() +
              faker.lorem.sentences(5).map((e) => e).toString(),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xFF7C8BA0),
          ),
        ),
      ),
    );
  }
}
