import 'package:flutter/material.dart';
import 'package:islamic_ai/features/answer/widgets/widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add your drawer items here
          const SizedBox(
            height: 64,
          ),
          const ProfileHeader(),
          const SizedBox(
            height: 16,
          ),
          CustomListTile(
            icon: Icons.feedback_outlined,
            title: 'Feedback',
            onTap: () {
              // Handle navigation
            },
          ),
          CustomListTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Term & Conditions',
            onTap: () {
              // Handle navigation
            },
          ),
          CustomListTile(
            icon: Icons.help_outline_sharp,
            title: 'Help & Support',
            onTap: () {
              // Handle navigation
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomListTile(
            icon: Icons.logout,
            title: 'Sign Out',
            onTap: () {
              // Handle navigation
            },
          ),
        ],
      ),
    );
  }
}
