import 'package:useful_extensions/src/string/nullable_string_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('String extensions tests', () {
    group('isStringNullOrEmpty', () {
      test('positive ("")', () {
        expect(''.isStringNullOrEmpty(), isTrue);
      });

      test('positive (null)', () {
        String? s;
        expect(s.isStringNullOrEmpty(), isTrue);
      });
    });

    group('isStringNullOrWhiteSpace', () {
      test('positive ("")', () {
        expect(''.isStringNullOrWhiteSpace(), isTrue);
      });

      test('positive (" \n\r")', () {
        expect(''.isStringNullOrWhiteSpace(), isTrue);
      });

      test('positive (null)', () {
        String? s;
        expect(s.isStringNullOrWhiteSpace(), isTrue);
      });
    });

    group('isStringNullOrEmptyOrWhiteSpace', () {
      test('positive (null)', () {
        String? s;
        expect(s.isStringNullOrEmptyOrWhiteSpace(), isTrue);
      });

      test('positive ("")', () {
        expect(''.isStringNullOrEmptyOrWhiteSpace(), isTrue);
      });

      test('positive (" \n\r")', () {
        expect(' \n\r'.isStringNullOrEmptyOrWhiteSpace(), isTrue);
      });

      test('negative ("a \n\r")', () {
        expect('a \n\r'.isStringNullOrEmptyOrWhiteSpace(), isFalse);
      });

      test('negative (" \n\ra")', () {
        expect(' \n\ra'.isStringNullOrEmptyOrWhiteSpace(), isFalse);
      });
    });

    group('equalsToNullableString', () {
      test('positive (null = null)', () {
        String? a;
        String? b;
        expect(a.equalsToNullableString(b), isTrue);
      });

      test('positive ("" = "")', () {
        expect(''.equalsToNullableString(''), isTrue);
      });

      test('positive ("abc" = "abc")', () {
        expect('abc'.equalsToNullableString('abc'), isTrue);
      });

      test('negative ("abc" = "bca")', () {
        expect('abc'.equalsToNullableString('bca'), isFalse);
      });
    });

    group('equalsToNullableStringIgnoreCase', () {
      test('positive (null = null)', () {
        String? a;
        String? b;
        expect(a.equalsToNullableStringIgnoreCase(b), isTrue);
      });

      test('positive ("" = "")', () {
        expect(''.equalsToNullableStringIgnoreCase(''), isTrue);
      });      

      test('positive ("abc" = "ABC")', () {
        expect('abc'.equalsToNullableStringIgnoreCase('ABC'), isTrue);
      });

      test('positive ("abc def" = "ABC DEF")', () {
        expect('abc def'.equalsToNullableStringIgnoreCase('ABC DEF'), isTrue);
      });

      test('positive ("abc def" = "abc def")', () {
        expect('abc def'.equalsToNullableStringIgnoreCase('abc def'), isTrue);
      });

      test('negative ("abc" = "BCA")', () {
        expect('abc'.equalsToNullableStringIgnoreCase('BCA'), isFalse);
      });

      test('negative (null = "BCA")', () {
        expect(null.equalsToNullableStringIgnoreCase('BCA'), isFalse);
      });

      test('negative ("abc" = null)', () {
        expect('abc'.equalsToNullableStringIgnoreCase(null), isFalse);
      });
    });
  });
}
