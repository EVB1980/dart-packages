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
  group('List extensions tests', () {
    group('isEmptyList', () {
      test('positive', () {
        var a = <SomeObject>[];
        expect(a.isEmptyList(), isTrue);
      });

      test('negative', () {
        var a = <SomeObject>[SomeObject(5)];
        expect(a.isEmptyList(), isFalse);
      });
    });

    group('equalsToList', () {
      test('positive (empty)', () {
        var a = <SomeObject>[];
        var b = <SomeObject>[];

        expect(a.equalsToList(b, SomeObject.compare), isTrue);
      });

      test('positive (non-empty)', () {
        var a = [SomeObject(1), SomeObject(2)];
        var b = [SomeObject(1), SomeObject(2)];

        expect(a.equalsToList(b, SomeObject.compare), isTrue);
      });

      test('negative (same lengths)', () {
        var a = [SomeObject(1), SomeObject(2)];
        var b = [SomeObject(4), SomeObject(5)];

        expect(!a.equalsToList(b, SomeObject.compare), isTrue);
      });

      test('negative (diff lengths)', () {
        var a = [SomeObject(1), SomeObject(2)];
        var b = [SomeObject(1), SomeObject(2), SomeObject(2)];

        expect(!a.equalsToList(b, SomeObject.compare), isTrue);
      });
    });
  });
}
