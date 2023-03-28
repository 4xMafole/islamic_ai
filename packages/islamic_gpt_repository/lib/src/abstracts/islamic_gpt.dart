/// Abstraction repository
abstract class IslamicGPTRepo {
  /// Sends a [question] to the GPT-3 model and returns the AI-generated answer.
  ///
  /// Uses the CompleteText API for single-turn Q&A interactions.
  Future<String> answerQAndA(String question);

  /// Sends a [question] to the GPT-3 model and returns the AI-generated answer.
  ///
  /// Uses the ChatCompleteText API for multi-turn chat-based interactions.
  Future<List<String>> answerChat(String question);
}
