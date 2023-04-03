import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
  });
  final String text;
  final void Function() onTap;
  final bool isLoading;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.9).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (!widget.isLoading) {
      _controller.forward();
      widget.onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            width: 345,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: IAIColor.termsHighlight,
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 15),
                  spreadRadius: -20,
                  blurRadius: 25,
                  color: IAIColor.termsHighlight,
                )
              ],
            ),
            child: Center(
              child: widget.isLoading
                  ? LoadingAnimationWidget.threeArchedCircle(
                      color: IAIColor.whiteColor,
                      size: MediaQuery.of(context).size.width * 0.08,
                    )
                  : Text(
                      widget.text,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: IAIColor.whiteColor,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
