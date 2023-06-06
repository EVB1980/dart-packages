import 'dart:io';

import 'package:binary_serializable/src/binary-serializable/i_serializable.dart';
import 'package:binary_serializable/src/serialization/binary-reader/binary_reader.dart';
import 'package:binary_serializable/src/serialization/binary-reader/binary_reader_extensions.dart';
import 'package:binary_serializable/src/serialization/binary-reader/file_binary_reader.dart';
import 'package:binary_serializable/src/serialization/binary-writer/binary_writer.dart';
import 'package:binary_serializable/src/serialization/binary-writer/binary_writer_extensions.dart';
import 'package:useful_extensions/useful_extensions.dart';

class MySerializable extends ISerializable {
  int version() => 1;

  @override
  Future serialize(BinaryWriter bw) async {
    return bw
      ..writeInt(version())
      ..writeNInt(intField)
      ..writeNDouble(doubleField)
      ..writeNString(stringField);
  }

  @override
  Future deserialize(BinaryReader br) async {
    var version = await br.readInt();
    switch (version) {
      case 1:
        intField = await br.readNInt();
        doubleField = await br.readNDouble();
        stringField = await br.readNString();
        break;
      default:
        throw AssertionError('Version $version is not supported!');
    }
  }

  int? intField;

  double? doubleField;

  String? stringField;

  MySerializable({this.intField, this.doubleField, this.stringField});

  bool equals(MySerializable other) {
    return intField == other.intField &&
        doubleField == other.doubleField &&
        stringField.equalsToNullableString(other.stringField);
  }
}

void main() async {
  var myObj = MySerializable(
    intField: 10,
    doubleField: 0.5,
    stringField: 'Some text',
  );

  await bytesSerializationExample(myObj);
}

Future bytesSerializationExample(MySerializable myObj) async {
  print("==bytesSerializationExample:");

  var bytes = myObj.serializeToBytes();

  var myObjDes = MySerializable();
  myObjDes.deserializeFromBytes(bytes);

  assert(myObj.equals(myObjDes));

  print("It's OK!");
}

Future fileSerializationExample(MySerializable myObj) async {
  var uri = Uri.file("./serialization_test.data");
  var fbr = FileBinaryReader(uri);
  var file = File.fromUri(uri);
  var wf = await file.open(mode: FileMode.writeOnly);
  wf.writeFrom(myObj.serializeToBytes());
  await wf.close();
  var rf = await file.open();
}
