import 'package:flutter/material.dart';
import 'package:islamic_ai/common/widgets/widgets.dart';
import 'package:islamic_ai/features/settings/widgets/feedback_box.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  _FeedbackViewState createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconData: Icons.arrow_back,
        onPressed: () => Navigator.canPop(context),
        title: const Text(
          'Feedback',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 24,
            color: IAIColor.deepBlue,
          ),
        ),
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
                children: const [
                  SizedBox(height: 32),
                  FeedbackBox(
                    hintText: 'Please give us your honest feedback.',
                    inputType: TextInputType.multiline,
                  ),
                  SizedBox(height: 32),
                  CustomButton(text: 'Submit')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
