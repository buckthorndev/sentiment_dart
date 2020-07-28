import 'package:sentiment_dart/sentiment_dart.dart';

void main() {
  final sentiment = Sentiment();
  var customLang = {'i': 1, 'love': 1, 'dart': 5,'car':2};
  print(sentiment.analysis('i love dart',customLang: customLang));
  
  print(sentiment.analysis('i hate you piece of shit 💩'));

  print(sentiment.analysis('i hate you piece of shit 💩',emoji: true));

  print(sentiment.analysis('ti odio un pezzo di merda 💩',languageCode: 'it'));

  print(sentiment.analysis('ti odio un pezzo di merda 💩',emoji: true,languageCode: 'it'));

  print(sentiment.analysis('je te déteste merde 💩',languageCode: 'fr'));

  print(sentiment.analysis('je te déteste merde 💩',emoji: true,languageCode: 'fr'));
}
