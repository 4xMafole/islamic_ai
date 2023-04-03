import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_ai/features/theme/theme.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignInOption extends StatefulWidget {
  const SignInOption({
    super.key,
    required this.assetPath,
    required this.text,
    required this.onTap,
    this.bgColor = IAIColor.containerBackground,
    this.loadingIconColor = IAIColor.tabBarActive,
    this.isLoading = false,
  });
  final String assetPath;
  final String text;
  final Color bgColor;
  final Color loadingIconColor;
  final void Function() onTap;
  final bool isLoading;

  @override
  State<SignInOption> createState() => _SignInOptionState();
}

class _SignInOptionState extends State<SignInOption>
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
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: widget.bgColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.isLoading
                  ? [
                      LoadingAnimationWidget.threeArchedCircle(
                        color: widget.loadingIconColor,
                        size: MediaQuery.of(context).size.width * 0.05,
                      )
                    ]
                  : [
                      SvgPicture.asset(widget.assetPath),
                      const SizedBox(width: 8),
                      Text(widget.text),
                    ],
            ),
          ),
        ),
      ),
    );
  }
}
