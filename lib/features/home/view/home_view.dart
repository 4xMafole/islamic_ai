import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_ai/features/home/widgets/widgets.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 192,
              bottom: 16,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/app_icon.svg',
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Islamic Ai',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: IAIColor.deepBlue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CustomSearchField(
                  hintText: 'Enter your Question',
                  inputType: TextInputType.text,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
