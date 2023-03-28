// ignore_for_file: depend_on_referenced_packages

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

/// An AI package client which interacts with GPT-3 model.
///
/// This class provides methods to request AI-generated responses for Q&A and
/// chat-based interactions using the GPT-3 model.
class IslamicGpt {
  /// Creates an instance of IslamicGpt.
  ///
  /// Takes an [apiToken] required to authenticate with the GPT-3 API.
  IslamicGpt({required String apiToken}) {
    _openAI = OpenAI.instance.build(
      token: apiToken,
      baseOption: HttpSetup(
        receiveTimeout: const Duration(minutes: 1),
      ),
    );
  }

  late OpenAI _openAI;

  /// Sends a [question] to the GPT-3 model and returns the AI-generated answer.
  ///
  /// Uses the CompleteText API for single-turn Q&A interactions.
  Future<String> answerQAndA(String question) async {
    final request = CompleteText(
      prompt: question,
      model: kTextDavinci3,
      maxTokens: 200,
    );

    final response = await _openAI
        // ignore: deprecated_member_use
        .onCompletion(request: request);
    final answer = response?.choices.first.text ?? '';

    if (answer.isEmpty || answer.contains('AI model')) {
      return 'Sorry, I could not find the information you are looking for.';
    }

    return answer;
  }

  /// Sends a [question] to the GPT-3 model and returns the AI-generated answer.
  ///
  /// Uses the ChatCompleteText API for multi-turn chat-based interactions.
  Future<String> answerChat(String question) async {
    final messages = [
      {'role': 'user', 'content': question}
    ];

    final request = ChatCompleteText(
      model: kChatGptTurboModel,
      messages: messages,
      maxToken: 200,
      user: '1',
    );

    // Get the chat completion response
    final response = await _openAI.onChatCompletion(request: request);

    // Extract the answer
    final answer = response?.choices.first.message.content ?? '';

    // If no answer is found, return an error message
    if (answer.isEmpty || answer.contains('AI model')) {
      return 'Sorry, I could not find the information you are looking for.';
    }

    return answer;
  }
}
