import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.inputType,
    this.isPassword = false,
  });
  final String hintText;
  final TextInputType inputType;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
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
        _focusNode.hasFocus ? IAIColor.deepBlue : Colors.transparent;
    final iconColor = _focusNode.hasFocus ? IAIColor.separator : Colors.grey;

    return Container(
      width: 345,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: IAIColor.containerBackground,
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Center(
        child: TextField(
          focusNode: _focusNode,
          keyboardType: widget.inputType,
          cursorColor: IAIColor.separator,
          obscureText: _obscureText,
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
