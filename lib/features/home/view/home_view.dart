import 'package:flutter/material.dart';
import 'package:islamic_ai/common/widgets/app_logo.dart';
import 'package:islamic_ai/features/home/widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
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
                const AppLogo(logoSize: 60, nameSize: 24),
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
