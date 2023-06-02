import 'dart:convert';
import 'dart:typed_data';

import 'package:binary_serializable/src/number_types.dart';

extension BytesBuilderExtension on BytesBuilder {
  /// Writes bytes as is
  BytesBuilder writePure(Uint8List data) {
    add(data);
    return this;
  }

  /// Writes nullable object
  BytesBuilder writeNullable<T>(
    T? nullableValue,
    void Function(T value) serialize,
  ) {
    if (nullableValue == null) {
      writeBoolean(true);
    } else {
      writeBoolean(false);
      serialize(nullableValue);
    }
    return this;
  }

  /// Writes int
  BytesBuilder writeInt(int value) {
    var type = NumberTypes.get(value);
    var bytesCount = type.getBytesCount();

    addByte(type.type);

    var bytes = Uint8List(bytesCount);
    var bytesData = bytes.buffer.asByteData();
    switch (type) {
      case NumberTypes.byte:
        bytesData.setInt8(0, value);
        break;
      case NumberTypes.int16:
        bytesData.setInt16(0, value, Endian.big);
        break;
      case NumberTypes.int32:
        bytesData.setInt32(0, value, Endian.big);
        break;
      case NumberTypes.int64:
        bytesData.setInt64(0, value, Endian.big);
        break;
      case NumberTypes.double:
        throw Exception('Impossible case $type');
    }

    add(bytes);
    return this;
  }

  /// Writes double
  BytesBuilder writeDouble(double value) {
    var bytes = Uint8List(8)
      ..buffer.asByteData().setFloat64(0, value, Endian.big);
    add(bytes);
    return this;
  }

  /// Writes boolean
  BytesBuilder writeBoolean(bool value) {
    addByte(value ? 1 : 0);
    return this;
  }

  BytesBuilder writeString(String value) {
    var bytes = utf8.encode(value);    
    writeInt(bytes.length);
    add(bytes);
    return this;
  }
}
