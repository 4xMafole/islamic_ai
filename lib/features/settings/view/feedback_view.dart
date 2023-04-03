import 'package:flutter/material.dart';
import 'package:islamic_ai/common/widgets/app_logo.dart';
import 'package:islamic_ai/common/widgets/widgets.dart';
import 'package:islamic_ai/features/settings/widgets/feedback_box.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconData: Icons.arrow_back,
        onPressed: () => Navigator.pop(context),
        title: const AppLogo(logoSize: 30, nameSize: 18),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 32,
              left: 16,
              right: 16,
            ),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Feedback',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: IAIColor.blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const FeedbackBox(
                    hintText: 'Please give us your honest feedback.',
                    inputType: TextInputType.multiline,
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: 'Submit',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
