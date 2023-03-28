import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
            radius: 33.5,
          ),
          SizedBox(height: 16),
          Text(
            'Osman Ali',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 19,
              color: IAIColor.separator,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Check your profile',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: IAIColor.tabBarActive,
            ),
          ),
        ],
      ),
    );
  }
}
