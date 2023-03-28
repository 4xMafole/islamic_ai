import 'package:flutter/material.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        CircleAvatar(
          backgroundColor: IAIColor.tabBarInactive,
          backgroundImage: AssetImage('assets/images/default_profile.png'),
          radius: 50,
        ),
        SizedBox(height: 10),
        Text(
          'Osman Ali',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: IAIColor.separator,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Osman.Ali@gmail.com',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: IAIColor.subTitle,
          ),
        ),
      ],
    );
  }
}
