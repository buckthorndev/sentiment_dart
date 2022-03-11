<h1 align="center"> Sentiment Dart </h1>

Sentiment Dart is a dart module that uses the [AFINN-165 wordlist](https://www2.imm.dtu.dk/pubdb/views/publication_details.php?id=6010) and Emoji Sentiment Ranking to perform sentiment analysis on arbitrary blocks of input text. Sentiment Dart heavily inspired by the Javascript package [sentiment](https://www.npmjs.com/package/sentiment)

## Usage

```dart
import 'package:sentiment_dart/sentiment_dart.dart';

main() {
  void main() {

  print(Sentiment.analysis('i hate you piece of shit 💩'));

  print(Sentiment.analysis('i hate you piece of shit 💩',emoji: true));
}
}
```

_output_

```output
{score: -7, comparative: -1.1666666666666667, words: [i, hate, you, piece, of, shit], good words: [], badword: [[hate, -3], [shit, -4]]}

{score: -8, comparative: -1.1428571428571428, words: [i, hate, you, piece, of, shit, 💩], good words: [], badword: [[hate, -3], [shit, -4], [💩, -1]]}
```

### Other language

_example_

```dart
import 'package:sentiment_dart/sentiment_dart.dart';

main() {
  void main() {


  print(Sentiment.analysis('ti odio un pezzo di merda 💩',languageCode: 'it'));

  print(Sentiment.analysis('ti odio un pezzo di merda 💩',emoji: true,languageCode: 'it'));

}
}
```

_output_

```output
{score: -7, comparative: -1.1666666666666667, words: [ti, odio, un, pezzo, di, merda], good words: [], badword: [[odio, -3], [merda, -4]]}

{score: -8, comparative: -1.1428571428571428, words: [ti, odio, un, pezzo, di, merda, 💩], good words: [], badword: [[odio, -3], [merda, -4], [💩, -1]]}
```

### Custom language

_example_

```dart
import 'package:sentiment_dart/sentiment_dart.dart';

main() {
  void main() {


  var customLang = {'i': 1, 'love': 1, 'dart': 5,'car':2};
  print(Sentiment.analysis('i love dart',customLang: customLang));
}
}
```

_output_

```output
{score: 7, comparative: 2.3333333333333335, words: [i, love, dart], good words: [[i, 1], [love, 1], [dart, 5]], badword: []}

```

## How it works ?

AFINN is a list of words rated for valence with an integer between minus five (negative) and plus five (positive). Sentiment analysis is performed by cross-checking the string tokens (words, emojis) with the AFINN list and getting their respective scores.

[source](https://github.com/thisandagain/sentiment#afinn)

## Languages and code

| language | code |
| -------- | ---- |
| English  | en   |
| Italian  | it   |
| french   | fr   |
| german   | de   |


## Contribution 🤓

Happy 😍 to recieve or provide contributions related to this package.

## Features and bugs 🐛

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/buckthorndev/sentiment_dart/issues

## Contact 📧

if you have any questions , feel free to wite us on

- [Buckthorn Twitter](https://twitter.com/buckthorndev)
- [n4ze3m Twitter](https://twitter.com/n4ze3m)
