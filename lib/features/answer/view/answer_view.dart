import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:islamic_ai/common/widgets/app_logo.dart';
import 'package:islamic_ai/common/widgets/widgets.dart';
import 'package:islamic_ai/features/answer/widgets/widgets.dart';
import 'package:islamic_ai/features/home/widgets/widgets.dart';

class AnswerView extends StatefulWidget {
  const AnswerView({super.key});

  @override
  _AnswerViewState createState() => _AnswerViewState();
}

class _AnswerViewState extends State<AnswerView> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      rtlOpening: true,
      openRatio: 0.5,
      drawer: CustomDrawer(context: context),
      child: Scaffold(
        appBar: CustomAppBar(
          leadingIconData: Icons.menu,
          onPressed: _advancedDrawerController.showDrawer,
          title: const AppLogo(logoSize: 30, nameSize: 18),
          
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                AnswerBox(),
                ReferenceList(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomSearchField(
          hintText: 'Enter your Question here',
          inputType: TextInputType.text,
          hasBorder: false,
          onPressed: () {
            // Add search action or voice input action here.
          },
        ),
      ),
    );
  }
}
