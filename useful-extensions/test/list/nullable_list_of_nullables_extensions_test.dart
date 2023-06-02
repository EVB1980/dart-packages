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
  group('Nullable list of nullables extensions tests', () {
    group('equalsToNullableListOfNullables', () {
      test('positive', () {
        List<SomeObject?>? a = [SomeObject(1), null, SomeObject(2)];
        List<SomeObject?>? b = [SomeObject(1), null, SomeObject(2)];

        expect(a.equalsToNullableListOfNullables(b, SomeObject.compare), isTrue);
      });

      test('negative', () {
        List<SomeObject>? a = [SomeObject(1), SomeObject(2)];
        List<SomeObject>? b;

        expect(a.equalsToNullableListOfNullables(b, SomeObject.compare), isFalse);
      });
    });
  });
}
