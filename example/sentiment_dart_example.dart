import 'package:sentiment_dart/sentiment_dart.dart';

void main() {
  var customLang = {'i': 1, 'love': 1, 'dart': 5, 'car': 2};
  print(Sentiment.analysis('i love dart', customLang: customLang));

  print(Sentiment.analysis('i hate you piece of shit 💩'));

  print(Sentiment.analysis('i hate you piece of shit 💩', emoji: true));

  print(Sentiment.analysis('ti odio un pezzo di merda 💩', languageCode: 'it'));

  print(Sentiment.analysis('ti odio un pezzo di merda 💩',
      emoji: true, languageCode: 'it'));

  print(Sentiment.analysis('je te déteste merde 💩', languageCode: 'fr'));

  print(Sentiment.analysis('je te déteste merde 💩',
      emoji: true, languageCode: 'fr'));
}
