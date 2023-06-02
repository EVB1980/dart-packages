import 'package:useful_extensions/useful_extensions.dart';
import 'package:test/test.dart';

class SomeObject {
  static bool compare(SomeObject a, SomeObject b) {
    return a.someProp == b.someProp;
  }

  final int someProp;

  SomeObject(this.someProp);
}

void main() {
  group('Nullable list extensions tests', () {
    group('equalsToNullableList', () {
      test('positive', () {
        List<SomeObject>? a = [SomeObject(1), SomeObject(2)];
        List<SomeObject>? b = [SomeObject(1), SomeObject(2)];

        expect(a.equalsToNullableList(b, SomeObject.compare), isTrue);
      });

      test('negative', () {
        List<SomeObject>? a = [SomeObject(1), SomeObject(2)];
        List<SomeObject>? b;

        expect(a.equalsToNullableList(b, SomeObject.compare), isFalse);
      });
    });
  });
}
