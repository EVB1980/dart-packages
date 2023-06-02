import 'package:useful_extensions/useful_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('List of integers extensions tests', () {
    group('equalsToListOfInts', () {
      test('positive (non-empty)', () {
        var a = [1, 2];
        var b = [1, 2];

        expect(a.equalsToListOfInts(b), isTrue);
      });

      test('positive (empty)', () {
        var a = <int>[];
        var b = <int>[];

        expect(a.equalsToListOfInts(b), isTrue);
      });

      test('negative (a.length < b.length)', () {
        var a = [1, 2];
        var b = [1, 2, 3];

        expect(a.equalsToListOfInts(b), isFalse);
      });

      test('negative (a.length > b.length)', () {
        var a = [1, 3, 2];
        var b = [1, 2];

        expect(a.equalsToListOfInts(b), isFalse);
      });
    });
  });
}
