// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:islamic_gpt/islamic_gpt.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

import '../shared_preferences_mock.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    // Add these lines
    SharedPreferencesStorePlatform.instance = SharedPreferencesMock();
  });
  group('IslamicGpt', () {
    // test('can be instantiated', () {
    //   expect(IslamicGpt(), isNotNull);
    // });

    test('open AI q&a', () async {
      final openAI = OpenAI.instance.build(
        token: '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',
        baseOption: HttpSetup(
          receiveTimeout: const Duration(seconds: 30),
        ),
        isLog: true,
      );

      final request = CompleteText(
        prompt:
            '''Give summary of this book, MUSLIMS OF SPAIN: A BRIEF INTRODUCTION TO ALJAMIADO LITERATURE IN GOLDEN AGE SPAIN''',
        model: kTextDavinci3,
        maxTokens: 200,
      );

      final response = await openAI
          // ignore: deprecated_member_use
          .onCompletion(request: request);

      expect(response, isNotNull);
    });

    test(
      'answerChat',
      () async {
        final islamicGpt = IslamicGpt(
          apiToken: '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',
        );
        final books = [
          'The Quran - in English',
          'Sahih al-Bukhari',
          'Sahih Muslim',
          'Sunan Abu Dawud',
          'Al-Muwatta',
        ];
        final answers = List<String>.filled(books.length, '');

        const format =
            '''[exact words quoted, if it is a list, then list the items first]. \n Book: [Book name] [Book reference, if available]. \n In-book reference: [In-book reference, if available]. \n ''';

        const question = 'When is Ramadan ?';

        for (var i = 0; i < books.length; i++) {
          final answer = await islamicGpt.answerChat(
            ''' $question. Use ${books[i]} book as reference. Please provide the answer in the following format: '$format' ''',
          );
          if (kDebugMode) {
            print(answer);
          }
          answers[i] = answer;
        }

        expect(answers, isNotNull);
      },
      timeout: Timeout(Duration(minutes: 1)),
    );
  });
}
