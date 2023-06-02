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
  group('Object extensions tests', () {
    group('equalsToNullable', () {
      test('positive (null == null)', () {
        SomeObject? a;
        SomeObject? b;
        expect(a.equalsToNullable(b, SomeObject.compare), isTrue);
      });

      test('positive (!null == !null)', () {
        SomeObject? a = SomeObject(1);
        SomeObject? b = SomeObject(1);
        expect(a.equalsToNullable(b, SomeObject.compare), isTrue);
      });

      test('negative (!null == null)', () {
        SomeObject a = SomeObject(1);
        SomeObject? b;
        expect(a.equalsToNullable(b, SomeObject.compare), isFalse);
      });

      test('negative (null == !null)', () {
        SomeObject? a;
        SomeObject b = SomeObject(1);
        expect(a.equalsToNullable(b, SomeObject.compare), isFalse);
      });
    });
  });
}
