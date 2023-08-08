import 'dart:io';
import 'dart:typed_data';

import 'package:binary_serializable/src/serialization/extensions/bytes_builder_extension.dart';

import 'binary_writer.dart';

class FileBinaryWriter implements BinaryWriter {
  final Uri _uri;
  final int _bufferLength;
  final BytesBuilder _builder;

  FileBinaryWriter(Uri uri, {int bufferLength = 8192})
      : _uri = uri,
        _bufferLength = bufferLength,
        _builder = BytesBuilder(copy: false);

  Future<FileBinaryWriter> writeToFile(
      void Function(BytesBuilder) write) async {
    var file = File.fromUri(_uri);
    var raf = await file.open(mode: FileMode.write);
    write(_builder);
    if (_builder.length < _bufferLength) return this;

    var data = _builder.takeBytes();
    var buffersCount = data.length ~/ _bufferLength;
    for (var i = 0; i < buffersCount; i++) {
      raf.writeFrom(data.sublist(i * _bufferLength, (i + 1) * _bufferLength));
    }
    _builder.add(data.sublist(buffersCount * _bufferLength));
    return this;
  }

  @override
  Future<FileBinaryWriter> writePure(Uint8List bytes) async {
    return writeToFile((bb) => bb.add(bytes));
  }

  @override
  Future<FileBinaryWriter> writeBoolean(bool value) async {
    return writeToFile((bb) => bb.writeBoolean(value));
  }

  @override
  Future<FileBinaryWriter> writeInt(int value) {
    return writeToFile((bb) => bb.writeInt(value));
  }

  @override
  Future<FileBinaryWriter> writeString(String value) {
    return writeToFile((bb) => bb.writeString(value));
  }

  @override
  Future<FileBinaryWriter> writeDouble(double value) {
    return writeToFile((bb) => bb.writeDouble(value));
  }
}
