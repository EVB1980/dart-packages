import 'dart:io';
import 'dart:typed_data';

import 'package:binary_serializable/src/serialization/extensions/int_stream_extensions.dart';

import 'binary_reader.dart';

class FileBinaryReader implements BinaryReader {
  final Uri _uri;
  final int _bufferLength;
  late Stream<int> _stream;

  FileBinaryReader(Uri uri, {int bufferLength = 8192}) : _uri = uri, _bufferLength = bufferLength {
    _stream = readFromFile();
  }

  Stream<int> readFromFile() async* {
    var file = File.fromUri(_uri);
    var raf = await file.open();
    var length = await raf.length();
    var buffer = List<int>.filled(
        length < _bufferLength ? length : _bufferLength, 0,
        growable: false);
    var read = 0;
    do {
      read = await raf.readInto(buffer);
      for (var i = 0; i < read; i++) {
        yield buffer[i];
      }
    } while (true);
  }

  @override
  Future<Uint8List> readPure(int length) async {
    return _stream.readPure(length);
  }

  @override
  Future<bool> readBoolean() async {
    return _stream.readBoolean();
  }

  @override
  Future<int> readInt() {
    return _stream.readInt();
  }

  @override
  Future<String> readString() {
    return _stream.readString();
  }

  @override
  Future<double> readDouble() {
    return _stream.readDouble();
  }
}
