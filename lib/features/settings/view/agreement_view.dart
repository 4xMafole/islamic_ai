import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:islamic_ai/common/widgets/app_logo.dart';
import 'package:islamic_ai/common/widgets/widgets.dart';
import 'package:islamic_ai/features/theme/theme.dart';

class AgreementView extends StatefulWidget {
  const AgreementView({super.key});

  @override
  State<AgreementView> createState() => _AgreementViewState();
}

class _AgreementViewState extends State<AgreementView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconData: Icons.arrow_back,
        onPressed: () => Navigator.canPop(context),
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
              bottom: 16,
            ),
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Term & Conditions',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: IAIColor.blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    faker.lorem.sentences(50).toString(),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: IAIColor.subTitle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
