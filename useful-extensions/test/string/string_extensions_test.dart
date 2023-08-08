import 'package:useful_extensions/src/string/string_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('String extensions tests', () {
    group('isStringEmpty', () {
      test('positive ("")', () {
        expect(''.isStringEmpty(), isTrue);
      });

      test('negative ("a")', () {
        expect('a'.isStringEmpty(), isFalse);
      });
    });

    group('isWhiteSpace', () {
      test('positive ("")', () {
        expect(''.isWhiteSpace(), isTrue);
      });

      test('positive (" \n\r")', () {
        expect(' \n\r'.isWhiteSpace(), isTrue);
      });

      test('negative ("a \n\r")', () {
        expect('a \n\r'.isWhiteSpace(), isFalse);
      });

      test('negative (" \n\ra")', () {
        expect(' \n\ra'.isWhiteSpace(), isFalse);
      });
    });

    group('equalsToString', () {
      test('positive ("" = "")', () {
        expect(''.equalsToString(''), isTrue);
      });

      test('positive ("abc" = "abc")', () {
        expect('abc'.equalsToString('abc'), isTrue);
      });

      test('negative ("abc" = "bca")', () {
        expect('abc'.equalsToString('bca'), isFalse);
      });
    });

    group('equalsToStringIgnoreCase', () {
      test('positive ("" = "")', () {
        expect(''.equalsToStringIgnoreCase(''), isTrue);
      });

      test('positive ("abc" = "ABC")', () {
        expect('abc'.equalsToStringIgnoreCase('ABC'), isTrue);
      });

      test('positive ("abc def" = "ABC DEF")', () {
        expect('abc def'.equalsToStringIgnoreCase('ABC DEF'), isTrue);
      });

      test('positive ("abc def" = "abc def")', () {
        expect('abc def'.equalsToStringIgnoreCase('abc def'), isTrue);
      });

      test('negative ("abc" = "BCA")', () {
        expect('abc'.equalsToStringIgnoreCase('BCA'), isFalse);
      });
    });

    group('tab', () {
      test('tab single line', () {
        var source = "A";
        var expected = "        A";
        var tabbed = source.tab(2);
        expect(tabbed.equalsToString(expected), isTrue);
      });

      test('tab multiline line', () {
        var source = '''A
B
C''';
        var expected = '''    A
    B
    C''';
        var tabbed = source.tab(1);
        expect(tabbed.equalsToString(expected), isTrue);
      });
    });
  });
}
