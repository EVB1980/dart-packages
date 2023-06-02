import 'package:binary_serializable/src/serialization/binary_reader.dart';
import 'package:binary_serializable/src/serialization/binary_writer.dart';
import 'package:binary_serializable/src/number_types.dart';
import 'package:test/test.dart';
import 'package:useful_extensions/useful_extensions.dart';

void main() {
  group('Serialization of ints', () {
    var zero = 0;
    var minInt8 = NumberTypes.MIN_INT8;
    var maxInt8 = NumberTypes.MAX_INT8;
    var minInt16 = NumberTypes.MIN_INT16;
    var maxInt16 = NumberTypes.MAX_INT16;
    var minInt32 = NumberTypes.MIN_INT32;
    var maxInt32 = NumberTypes.MAX_INT32;
    var minInt = NumberTypes.MIN_INT;
    var maxInt = NumberTypes.MAX_INT;

    int writeRead(int val) {
      var bw = BinaryWriter();
      bw.writeInt(val);
      var bytes = bw.takeBytes();
      var br = BinaryReader(bytes);
      return br.readInt();
    }

    test('zero', () {
      expect(writeRead(zero) == zero, isTrue);
    });

    test('minInt8', () {
      expect(writeRead(minInt8) == minInt8, isTrue);
    });

    test('maxInt8', () {
      expect(writeRead(maxInt8) == maxInt8, isTrue);
    });

    test('minInt16', () {
      expect(writeRead(minInt16) == minInt16, isTrue);
    });

    test('maxInt16', () {
      expect(writeRead(maxInt16) == maxInt16, isTrue);
    });

    test('minInt32', () {
      expect(writeRead(minInt32) == minInt32, isTrue);
    });

    test('maxInt32', () {
      expect(writeRead(maxInt32) == maxInt32, isTrue);
    });

    test('minInt', () {
      expect(writeRead(minInt) == minInt, isTrue);
    });

    test('maxInt', () {
      expect(writeRead(maxInt) == maxInt, isTrue);
    });
  });

  group('Serialization of doubles', () {
    var zero = 0.0;
    var negative = -25.4568787;
    var positive = -99.2878743;

    double writeRead(double val) {
      var bw = BinaryWriter();
      bw.writeDouble(val);
      var bytes = bw.takeBytes();
      var br = BinaryReader(bytes);
      return br.readDouble();
    }

    test('zero', () {
      expect(writeRead(zero) == zero, isTrue);
    });

    test('negative', () {
      expect(writeRead(negative) == negative, isTrue);
    });

    test('positive', () {
      expect(writeRead(positive) == positive, isTrue);
    });
  });

  group('Serialization of strings', () {
    String? nullStr;
    var singleLine = 'Single line value';
    var multiLine = '''A multi-line
string''';

    String? writeRead(String? val) {
      var bw = BinaryWriter();
      bw.writeNString(val);
      var bytes = bw.takeBytes();
      var br = BinaryReader(bytes);
      return br.readNString();
    }

    test('nullstr', () {
      expect(writeRead(nullStr) == nullStr, isTrue);
    });

    test('singleLine', () {
      expect(writeRead(singleLine)!.compareTo(singleLine) == 0, isTrue);
    });

    test('multiLine', () {
      expect(writeRead(multiLine)!.compareTo(multiLine) == 0, isTrue);
    });
  });

  group('Serialization of nullables ints', () {
    int? nInt;
    int? nIntVal = 10;

    int? writeRead(int? val) {
      var bw = BinaryWriter();
      bw.writeNInt(val);
      var bytes = bw.takeBytes();
      var br = BinaryReader(bytes);
      return br.readNInt();
    }

    test('nInt', () {
      expect(writeRead(nInt) == nInt, isTrue);
    });

    test('nIntVal', () {
      expect(writeRead(nIntVal) == nIntVal, isTrue);
    });
  });

  group('Serialization of int-lists', () {
    List<int> intList = [1, 3, 5, 7];
    List<int> writeRead(List<int> val) {
      var bw = BinaryWriter();
      bw.writeList(val, (bw, i) => bw.writeInt(i));
      var bytes = bw.takeBytes();
      var br = BinaryReader(bytes);
      return br.readList((bw) => bw.readInt());
    }

    test('intList', () {
      expect(writeRead(intList).equalsToListOfInts(intList), isTrue);
    });
  });
}
