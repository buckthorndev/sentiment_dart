import 'package:remove_emoji/remove_emoji.dart';
import 'package:sentiment_dart/src/lang/emoji/emoji.dart';
import 'package:sentiment_dart/src/lang/english/english.dart';
import 'package:sentiment_dart/src/lang/french/french.dart';
import 'package:sentiment_dart/src/lang/german/german.dart';
import 'package:sentiment_dart/src/lang/italian/italian.dart';
import 'package:sentiment_dart/src/sentiment_result.dart';

/// Sentiment class
abstract class Sentiment {
  Sentiment._();
  /// Analysis function
  ///
  /// syntax `analysis(String text,{Map customLang, bool emoji = false, String languageCode})`
  ///
  /// return `Map<String, dynamic>`
  ///
  /// example:
  /// ```dart
  ///  final sentiment = Sentiment();
  ///  print(sentiment.analysis('i hate you piece of shit 💩'));
  /// // {score: -7, comparative: -1.1666666666666667, words: [i, hate, you, piece, of, shit], good words: [], badword: [[hate, -3], [shit, -4]]}
  ///```
  static SentimentResult analysis(
    String text, {
    Map<String,num>? customLang,
    bool emoji = false,
     String languageCode = 'en',
  }) {
    try {
      if (text.isEmpty) throw ('The provided text mus not be empty.');
      var sentiments = <String,num>{};
      if (emoji) sentiments.addAll(emojis);
      if (customLang == null) {
        switch (languageCode) {

          /// english
          case 'en':
            sentiments.addAll(en);
            break;

          /// italian
          case 'it':
            sentiments.addAll(it);
            break;

          /// french
          case 'fr':
            sentiments.addAll(fr);
            break;

          /// german
          case 'de':
            sentiments.addAll(de);
            break;
          default:
            throw ('err');
        }
      } else {
        sentiments.addAll(customLang);
      }
      var score = 0.0;
      var goodWords = <String,num>{}, badWords = <String,num>{};
      var wordlist = emoji
          ? text
              .toLowerCase()
              .replaceAll('\n', ' ')
              .replaceAll('s\s+', ' ')
              .replaceAll(RegExp(r'[.,\/#!?$%\^&\*;:{}=_`\"~()]'), '')
              .trim()
              .split(' ')
          : text
              .toLowerCase()
              .replaceAll('\n', ' ')
              .replaceAll('s\s+', ' ')
              .replaceAll(RegExp(r'[.,\/#!?$%\^&\*;:{}=_`\"~()]'), '')
              .removemoji
              .trim()
              .split(' ');
      for (var i = 0; i < wordlist.length; i++) {
        sentiments.forEach((key, value) {
          if (key == wordlist[i]) {
            score += value;
            if (value < 0) {
              badWords[key]=value;
            } else{
              goodWords[key]=value;
            }
          }
        });
      }
      return SentimentResult(score: score, comparative: wordlist.isNotEmpty ? score / wordlist.length : 0, words: SentimentWordCategories(all: wordlist,good: goodWords, bad: badWords));

    } catch (e) {
      throw Exception(e);
    }
  }

  /// maps Emoji Strings to a score
  static const Map<String,num> emojiScores = emojis;
}
