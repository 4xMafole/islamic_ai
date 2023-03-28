import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.leadingIconData,
    required this.onPressed,
    required this.title,
  });
  final IconData leadingIconData;
  final void Function() onPressed;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      shadowColor: IAIColor.tabBarActive.withOpacity(0.4),
      child: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            leadingIconData,
            color: IAIColor.separator,
          ),
          onPressed: onPressed,
        ),
        title: Center(child: title),
        actions: [
          IconButton(
            icon: Opacity(opacity: 0, child: Icon(leadingIconData)),
            onPressed: null,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
