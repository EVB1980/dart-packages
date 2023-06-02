import 'dart:convert';
import 'dart:typed_data';

import 'package:binary_serializable/src/number_types.dart';

extension Uint8ListExtension on Uint8List {
  /// Reads bytes array from [offset] with specified [length]
  Uint8List readPure(int offset, int length) {
    return sublist(offset, offset + length);
  }

  /// Reads int from [offset]
  (int result, int size) readInt(int offset) {
    var type = this[offset++];
    var numType = NumberTypes.values.firstWhere((e) => e.type == type);
    var size = numType.getBytesCount();
    var bytesData = buffer.asByteData(offset, size);

    int result;
    switch (numType) {
      case NumberTypes.byte:
        result = bytesData.getInt8(0);
        break;
      case NumberTypes.int16:
        result = bytesData.getInt16(0, Endian.big);
        break;
      case NumberTypes.int32:
        result = bytesData.getInt32(0, Endian.big);
        break;
      case NumberTypes.int64:
        result = bytesData.getInt64(0, Endian.big);
        break;
      case NumberTypes.double:
        throw Exception('Impossible case $type');
    }

    return (result, 1 + size);
  }

  /// Reads double from [offset]
  (double result, int size) readDouble(int offset) {
    var result = buffer.asByteData(offset, 8).getFloat64(0, Endian.big);
    return (result, 8);
  }

  /// Reads bool from [offset]
  (bool result, int size) readBoolean(int offset) {
    var val = this[offset];
    assert(val == 0 || val == 1);
    return (val == 1, 1);
  }

  /// Reads string from [offset]
  (String result, int size) readString(int offset) {
    var (length, lengthSize) = readInt(offset);
    var bytes = readPure(offset + lengthSize, length);
    return (utf8.decode(bytes), lengthSize + length);
  }
}
