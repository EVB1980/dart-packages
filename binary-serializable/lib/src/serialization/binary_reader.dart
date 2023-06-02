import 'dart:typed_data';

import 'package:binary_serializable/src/serialization/uint8_list_extensions.dart';

class BinaryReader {
  final Uint8List _data;
  int _offset;

  BinaryReader(Uint8List data, {int offset = 0})
      : _data = data,
        _offset = offset;

  Uint8List readPure(int length) {
    var result = _data.readPure(_offset, length);
    _offset += length;
    return result;
  }

  bool readBoolean() {
    var (value, length) = _data.readBoolean(_offset);
    _offset += length;
    return value;
  }

  int readInt() {
    var (value, length) = _data.readInt(_offset);
    _offset += length;
    return value;
  }

  String readString() {
    var (value, length) = _data.readString(_offset);
    _offset += length;
    return value;
  }

  double readDouble() {
    var (value, length) = _data.readDouble(_offset);
    _offset += length;
    return value;
  }

  T? readNullable<T>(T Function(BinaryReader) deserialize) {
    var isNull = readBoolean();
    if (isNull) return null;
    return deserialize(this);
  }

  bool? readNBoolean() {
    return readNullable((br) => br.readBoolean());
  }

  int? readNInt() {
    return readNullable((br) => br.readInt());
  }

  String? readNString() {
    return readNullable((br) => br.readString());
  }

  double? readNDouble() {
    return readNullable((br) => br.readDouble());
  }

  List<T> readList<T>(T Function(BinaryReader) deseriaize) {
    return List<T>.generate(readInt(), (index) => deseriaize(this));
  }

  List<T>? readNList<T>(T Function(BinaryReader) deseriaize) {
    return readNullable((br) => br.readList(deseriaize));
  }

  List<T?> readListN<T>(T Function(BinaryReader) deseriaize) {
    return List<T?>.generate(readInt(), (index) => readNullable((br)=>deseriaize(br)));
  }

  List<T?>? readNListN<T>(T Function(BinaryReader) deseriaize) {
    return readNullable((br) => br.readListN(deseriaize));
  }
}
