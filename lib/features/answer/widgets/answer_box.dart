import 'package:flutter/material.dart';
import 'package:islamic_ai/features/answer/widgets/widgets.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class AnswerBox extends StatelessWidget {
  const AnswerBox({
    super.key,
    this.hasToolBar = true,
  });

  final bool hasToolBar;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: IAIColor.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        border: Border.all(color: IAIColor.textGray),
      ),
      child: Column(
        children: [
          if (hasToolBar) ...[
            const AnswerToolBar(),
            Container(
              height: 1,
              color: IAIColor.textGray,
            ),
          ],
          const AnswerTextBox(),
        ],
      ),
    );
  }
}
