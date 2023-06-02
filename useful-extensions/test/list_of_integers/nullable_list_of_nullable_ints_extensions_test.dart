import 'package:useful_extensions/useful_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('Nullable list of nullable integers extensions tests', () {
    group('equalsToNullableListOfNullableInts', () {
      test('positive (non-empty)', () {
        List<int?>? a = [1, 2];
        List<int?>? b = [1, 2];

        expect(a.equalsToNullableListOfNullableInts(b), isTrue);
      });

      test('positive (empty)', () {
        List<int?>? a = <int>[];
        List<int?>? b = <int>[];

        expect(a.equalsToNullableListOfNullableInts(b), isTrue);
      });

      test('positive (null)', () {
        List<int?>? a;
        List<int?>? b;

        expect(a.equalsToNullableListOfNullableInts(b), isTrue);
      });

      test('negative (a.length < b.length)', () {
        List<int?>? a = [1, 2];
        List<int?>? b = [1, 2, 3];

        expect(a.equalsToNullableListOfNullableInts(b), isFalse);
      });

      test('negative (a.length > b.length)', () {
        List<int?>? a = [1, 3, 2];
        List<int?>? b = [1, 2];

        expect(a.equalsToNullableListOfNullableInts(b), isFalse);
      });
    });
  });
}
