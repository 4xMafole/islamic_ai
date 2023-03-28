import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:islamic_ai/common/widgets/app_logo.dart';
import 'package:islamic_ai/common/widgets/separator_line.dart';
import 'package:islamic_ai/features/answer/widgets/widgets.dart';
import 'package:islamic_ai/features/home/widgets/widgets.dart';
import 'package:islamic_ai/features/theme/theme.dart';
import 'package:faker/faker.dart';

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
      drawer: CustomDrawer(context: context),
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.menu,
                color: IAIColor.deepBlue,
              ),
              onPressed: _advancedDrawerController.showDrawer,
            ),
            title: const AppLogo(logoSize: 30, nameSize: 18)),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const AnswerContainer(),
                const ReferenceList(),
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

class AnswerContainer extends StatelessWidget {
  const AnswerContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: IAIColor.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        border: Border.all(color: IAIColor.textGray),
      ),
      child: Column(
        children: [
          const AnswerToolBar(),
          Container(
            height: 1,
            color: IAIColor.textGray,
          ),
          const AnswerTextBox(),
        ],
      ),
    );
  }
}
