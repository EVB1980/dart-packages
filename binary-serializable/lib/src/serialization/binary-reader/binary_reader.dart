import 'dart:typed_data';

abstract class BinaryReader {
  /// Reads array of bytes of specified length
  Future<Uint8List> readPure(int length);

  /// Reads boolean
  Future<bool> readBoolean();

  /// Reads integer
  Future<int> readInt();

  /// Reads string in UTF8
  Future<String> readString();

  /// Reads double
  Future<double> readDouble();
}


