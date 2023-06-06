import 'dart:typed_data';

abstract class BinaryReader {
  /// Reads aaray of bytes of specified length
  Future<Uint8List> readPure(int length);

  /// Reads boolean
  Future<bool> readBoolean();

  /// REads integer
  Future<int> readInt();

  /// Reads string in UTF8
  Future<String> readString();

  /// Reads double
  Future<double> readDouble();
}


