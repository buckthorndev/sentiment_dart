class SentimentResult {
  final double score;
  final double comparative;
  final SentimentWordCategories words;

  const SentimentResult(
      {required this.score, required this.comparative, required this.words});

  @override
  String toString() =>
      '{score: $score, comparative: $comparative, words: $words}';
}

class SentimentWordCategories {
  final List<String> all;
  final Map<String, num> good;
  final Map<String, num> bad;

  const SentimentWordCategories(
      {required this.all, required this.good, required this.bad});

  @override
  String toString() {
    return '{all: $all, good: $good, bad: $bad}';
  }
}
