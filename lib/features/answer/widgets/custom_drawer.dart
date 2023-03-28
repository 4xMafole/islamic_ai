import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      color: IAIColor.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add your drawer items here
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle navigation
            },
          ),
          // Add more drawer items as needed
        ],
      ),
    );
  }
}
