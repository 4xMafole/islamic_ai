import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class AnswerToolBar extends StatelessWidget {
  const AnswerToolBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [
              Icon(Icons.clear),
              Text(
                'Clear',
                style: TextStyle(
                  color: IAIColor.subTitle,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Icon(Icons.share),
              Text(
                'Share',
                style: TextStyle(
                  color: IAIColor.subTitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
