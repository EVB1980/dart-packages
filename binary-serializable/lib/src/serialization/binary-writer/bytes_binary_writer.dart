import 'dart:typed_data';

import 'package:binary_serializable/src/serialization/binary-writer/binary_writer.dart';
import 'package:binary_serializable/src/serialization/extensions/bytes_builder_extension.dart';

class BytesBinaryWriter extends BinaryWriter {
  final BytesBuilder _builder;

  BytesBinaryWriter() : _builder = BytesBuilder();

  @override
  Future<BinaryWriter> writePure(Uint8List data) {
    _builder.writePure(data);
    return Future.value(this);
  }

  @override
  Future<BinaryWriter> writeBoolean(bool value) {
    _builder.writeBoolean(value);
    return Future.value(this);
  }

  @override
  Future<BinaryWriter> writeInt(int value) {
    _builder.writeInt(value);
    return Future.value(this);
  }

  @override
  Future<BinaryWriter> writeDouble(double value) {
    _builder.writeDouble(value);
    return Future.value(this);
  }

  @override
  Future<BinaryWriter> writeString(String value) {
    _builder.writeString(value);
    return Future.value(this);
  }

  Uint8List takeBytes() {
    return _builder.takeBytes();
  }
}
