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
  });
}
