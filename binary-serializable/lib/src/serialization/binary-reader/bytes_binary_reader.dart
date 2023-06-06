import 'dart:typed_data';

import 'package:binary_serializable/src/serialization/extensions/uint8_list_extensions.dart';

import 'binary_reader.dart';

class BytesBinaryReader extends BinaryReader {
  final Uint8List _data;
  int _offset;

  BytesBinaryReader(Uint8List data, {int offset = 0})
      : _data = data,
        _offset = offset;

  @override
  Future<Uint8List> readPure(int length) {
    var result = _data.readPure(_offset, length);
    _offset += length;
    return Future.value(result);
  }

  @override
  Future<bool> readBoolean() {
    var (value, length) = _data.readBoolean(_offset);
    _offset += length;
    return Future.value(value);
  }

  @override
  Future<int> readInt() {
    var (value, length) = _data.readInt(_offset);
    _offset += length;
    return Future.value(value);
  }

  @override
  Future<String> readString() {
    var (value, length) = _data.readString(_offset);
    _offset += length;
    return Future.value(value);
  }

  @override
  Future<double> readDouble() {
    var (value, length) = _data.readDouble(_offset);
    _offset += length;
    return Future.value(value);
  }
}
