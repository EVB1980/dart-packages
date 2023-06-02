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
  });
}
