import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class FeedbackBox extends StatefulWidget {
  const FeedbackBox({
    super.key,
    required this.hintText,
    required this.inputType,
    this.hasBorder = true,
  });
  final String hintText;
  final TextInputType inputType;
  final bool hasBorder;
  @override
  _FeedbackBoxState createState() => _FeedbackBoxState();
}

class _FeedbackBoxState extends State<FeedbackBox> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = widget.hasBorder
        ? _focusNode.hasFocus
            ? IAIColor.deepBlue
            : IAIColor.textGray
        : Colors.transparent;

    return Container(
      padding: const EdgeInsets.all(8),
      width: 345,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: IAIColor.whiteColor,
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: TextField(
        focusNode: _focusNode,
        keyboardType: widget.inputType,
        cursorColor: IAIColor.separator,
        maxLines: null,
        expands: true,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: IAIColor.textGray),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
