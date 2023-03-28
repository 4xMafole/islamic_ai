import 'package:flutter/material.dart';
import 'package:islamic_ai/common/widgets/custom_app_bar.dart';
import 'package:islamic_ai/features/answer/widgets/widgets.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class ShareView extends StatefulWidget {
  const ShareView({super.key});

  @override
  _ShareViewState createState() => _ShareViewState();
}

class _ShareViewState extends State<ShareView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconData: Icons.arrow_back_sharp,
        title: const Text(
          'Share',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: IAIColor.deepBlue,
          ),
        ),
        onPressed: () => Navigator.canPop(context),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: const [
                ReferenceItem(),
                AnswerBox(
                  hasToolBar: false,
                ),
                ReferenceList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
