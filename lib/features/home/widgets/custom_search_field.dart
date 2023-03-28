import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    super.key,
    required this.hintText,
    required this.inputType,
    required this.onPressed,
  });
  final String hintText;
  final TextInputType inputType;
  final void Function()? onPressed;

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
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
    final borderColor =
        _focusNode.hasFocus ? IAIColor.deepBlue : IAIColor.textGray;

    return Container(
      width: 345,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: IAIColor.whiteColor,
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Center(
        child: TextField(
          focusNode: _focusNode,
          keyboardType: widget.inputType,
          cursorColor: IAIColor.separator,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: IAIColor.textGray),
            border: InputBorder.none,
            prefixIcon: const Icon(
              Icons.search,
              color: IAIColor.subTitle,
            ),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.mic,
                color: IAIColor.subTitle,
              ),
              onPressed: widget.onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
