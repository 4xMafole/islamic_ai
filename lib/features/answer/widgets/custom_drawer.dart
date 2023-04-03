import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:islamic_ai/app/app.dart';
import 'package:islamic_ai/features/answer/widgets/widgets.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.context,
    required this.controller,
  });

  final BuildContext context;
  final AdvancedDrawerController controller;

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
          ProfileHeader(drawerController: controller),
          const SizedBox(
            height: 16,
          ),
          CustomListTile(
            icon: Icons.feedback_outlined,
            title: 'Feedback',
            onTap: () {
              controller.hideDrawer();
              Navigator.pushNamed(context, Routes.feedback);
            },
          ),
          CustomListTile(
            icon: Icons.privacy_tip_outlined,
            title: 'Term & Conditions',
            onTap: () {
              controller.hideDrawer();
              Navigator.pushNamed(context, Routes.termsCondition);
            },
          ),
          CustomListTile(
            icon: Icons.help_outline_sharp,
            title: 'Help & Support',
            onTap: () {
              controller.hideDrawer();
              Navigator.pushNamed(context, Routes.helpSupport);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomListTile(
            icon: Icons.logout,
            title: 'Sign Out',
            onTap: () {
              controller.hideDrawer();
              Navigator.pushNamed(context, Routes.signIn);
            },
          ),
        ],
      ),
    );
  }
}
