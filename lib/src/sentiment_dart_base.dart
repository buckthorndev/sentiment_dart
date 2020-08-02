import 'package:remove_emoji/remove_emoji.dart';
import 'package:sentiment_dart/src/lang/emoji/emoji.dart';
import 'package:sentiment_dart/src/lang/english/english.dart';
import 'package:sentiment_dart/src/lang/french/french.dart';
import 'package:sentiment_dart/src/lang/italian/italian.dart';

import 'lang/german/german.dart';

/// Sentiment class
class Sentiment {
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
  Map<String, dynamic> analysis(String text,
      {Map customLang, bool emoji = false, String languageCode}) {
    try {
      if (text.isEmpty) throw ('err');
      languageCode ??= 'en';
      var sentiments = {};
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
      var score = 0;
      var goodwords = [], badwords = [];
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
              badwords.add([key, value]);
            } else {
              goodwords.add([key, value]);
            }
          }
        });
      }
      var result = {
        'score': score,
        'comparative': wordlist.isNotEmpty ? score / wordlist.length : 0,
        'words': wordlist,
        'good words': goodwords,
        'badword': badwords
      };
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
