import 'package:test/test.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

void main() {
  group('A group of tests', () {
    test('First Test', () {
      expect(Sentiment.analysis('I love you').score, greaterThan(0));
    });

    test('Expect throw error for invalid language code', () {
      expect(() => Sentiment.analysis('I love you', languageCode: 'ml'),
          throwsException);
    });
  });
}
