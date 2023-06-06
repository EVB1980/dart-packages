import 'package:binary_serializable/src/serialization/binary-reader/binary_reader_extensions.dart';
import 'package:binary_serializable/src/serialization/binary-reader/bytes_binary_reader.dart';
import 'package:binary_serializable/src/serialization/binary-writer/binary_writer_extensions.dart';
import 'package:binary_serializable/src/serialization/binary-writer/bytes_binary_writer.dart';
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

    Future<int> writeRead(int val) {
      var bw = BytesBinaryWriter();
      bw.writeInt(val);
      var bytes = bw.takeBytes();
      var br = BytesBinaryReader(bytes);
      return br.readInt();
    }

    test('zero', () async {
      expect(await writeRead(zero) == zero, isTrue);
    });

    test('minInt8', ()async {
      expect(await writeRead(minInt8) == minInt8, isTrue);
    });

    test('maxInt8', ()async {
      expect(await writeRead(maxInt8) == maxInt8, isTrue);
    });

    test('minInt16', ()async {
      expect(await writeRead(minInt16) == minInt16, isTrue);
    });

    test('maxInt16', ()async {
      expect(await writeRead(maxInt16) == maxInt16, isTrue);
    });

    test('minInt32', () async{
      expect(await writeRead(minInt32) == minInt32, isTrue);
    });

    test('maxInt32', () async{
      expect(await writeRead(maxInt32) == maxInt32, isTrue);
    });

    test('minInt', ()async {
      expect(await writeRead(minInt) == minInt, isTrue);
    });

    test('maxInt', ()async {
      expect(await writeRead(maxInt) == maxInt, isTrue);
    });
  });

  group('Serialization of doubles', () {
    var zero = 0.0;
    var negative = -25.4568787;
    var positive = -99.2878743;

    Future<double> writeRead(double val) async {
      var bw = BytesBinaryWriter();
      await bw.writeDouble(val);
      var bytes = bw.takeBytes();
      var br = BytesBinaryReader(bytes);
      return br.readDouble();
    }

    test('zero', ()async {
      expect(await writeRead(zero) == zero, isTrue);
    });

    test('negative', ()async {
      expect(await writeRead(negative) == negative, isTrue);
    });

    test('positive', () async{
      expect(await writeRead(positive) == positive, isTrue);
    });
  });

  group('Serialization of strings', () {
    String? nullStr;
    var singleLine = 'Single line value';
    var multiLine = '''A multi-line
string''';

    Future<String?> writeRead(String? val) async {
      var bw = BytesBinaryWriter();
      await bw.writeNString(val);
      var bytes = bw.takeBytes();
      var br = BytesBinaryReader(bytes);
      return br.readNString();
    }

    test('nullstr', ()async {
      expect(await writeRead(nullStr) == nullStr, isTrue);
    });

    test('singleLine', () async{
      expect((await writeRead(singleLine))!.compareTo(singleLine) == 0, isTrue);
    });

    test('multiLine', ()async {
      expect((await writeRead(multiLine))!.compareTo(multiLine) == 0, isTrue);
    });
  });

  group('Serialization of nullables ints', () {
    int? nInt;
    int? nIntVal = 10;

    Future<int?> writeRead(int? val) async {
      var bw = BytesBinaryWriter();
      await bw.writeNInt(val);
      var bytes = bw.takeBytes();
      var br = BytesBinaryReader(bytes);
      return br.readNInt();
    }

    test('nInt', () async {
      expect(await writeRead(nInt) == nInt, isTrue);
    });

    test('nIntVal', () async{
      expect(await writeRead(nIntVal) == nIntVal, isTrue);
    });
  });

  group('Serialization of int-lists', () {
    List<int> intList = [1, 3, 5, 7];
    Future<List<int>> writeRead(List<int> val) async {
      var bw = BytesBinaryWriter();
      await bw.writeList(val, (bw, i) => bw.writeInt(i));
      var bytes = bw.takeBytes();
      var br = BytesBinaryReader(bytes);
      return br.readList((bw) => bw.readInt());
    }

    test('intList', () async {
      expect((await writeRead(intList)).equalsToListOfInts(intList), isTrue);
    });
  });
}
