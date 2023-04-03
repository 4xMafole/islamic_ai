import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:islamic_ai/app/app.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.drawerController,
  });

  final AdvancedDrawerController drawerController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
            radius: 33.5,
          ),
          const SizedBox(height: 16),
          const Text(
            'Osman Ali',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 19,
              color: IAIColor.separator,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              drawerController.hideDrawer();
              Navigator.pushNamed(context, Routes.editProfile);
            },
            child: const Text(
              'Edit Profile',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: IAIColor.tabBarActive,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
