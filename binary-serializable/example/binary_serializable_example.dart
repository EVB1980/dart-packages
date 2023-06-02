import 'dart:typed_data';

import 'package:binary_serializable/src/binary-serializable/binary_serializable_base.dart';
import 'package:useful_extensions/useful_extensions.dart';

class MySerializable extends BaseBinarySerializeable {
  @override
  int version() => 1;

  @override
  void write(BytesBuilder bb) {}

  @override
  void read(ByteData bd, int version) {}

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

void main() {
  var myObj = MySerializable(
    intField: 10,
    doubleField: 0.5,
    stringField: 'Some text',
  );

  var bytes = myObj.serializeToBytes();

  var myObjDes = MySerializable();
  myObjDes.deserializeFromBytes(bytes);

  print('test');
}
