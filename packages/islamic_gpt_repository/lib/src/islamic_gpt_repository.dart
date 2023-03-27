import 'package:islamic_gpt/islamic_gpt.dart';
import 'package:islamic_gpt_repository/src/abstracts/abstracts.dart';
import 'package:islamic_gpt_repository/src/utils/utils.dart';

/// An AI package repository for the IslamicGpt client.
///
/// This repository class provides an interface to interact with the IslamicGpt
/// client and retrieve answers from different Islamic books.
class IslamicGptRepository extends IslamicGPTRepo {
  /// Creates an instance of IslamicGptRepository.
  ///
  /// Takes a required [islamicGPT] parameter, which is an instance of the
  /// IslamicGpt client.
  IslamicGptRepository({required this.islamicGPT});

  /// Instance of islamic gpt client.
  final IslamicGpt islamicGPT;

  /// Sends a [question] to the GPT-3 model and returns a list of AI-generated
  /// answers, one for each book in the `books` list.
  ///
  /// This method sends a chat-based question with a specific book reference,
  /// iterating through each book in the `books` list.
  @override
  Future<List<String>> answerChat(String question) async {
    const books = Book.values;
    const queryFormat = format;
    final answers = List<String>.filled(books.length, '');
    for (var i = 0; i < books.length; i++) {
      final answer = await islamicGPT.answerChat(
        "$question. Use ${books[i].name} book as reference. Please provide the answer in the following format: '$queryFormat'",
      );
      answers[i] = answer;
    }

    return answers;
  }

  /// Sends a [question] to the GPT-3 model and returns the AI-generated answer.
  ///
  /// This method sends a single-turn Q&A question without specifying a
  /// particular book reference.
  @override
  Future<String> answerQAndA(String question) async {
    return islamicGPT.answerQAndA(question);
  }
}
