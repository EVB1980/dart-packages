import 'dart:typed_data';

abstract class BinaryWriter {
  /// Writes array of bytes of specified length
  Future<BinaryWriter> writePure(Uint8List list);

  /// Writes boolean
  Future<BinaryWriter> writeBoolean(bool value);

  /// Writes integer
  Future<BinaryWriter> writeInt(int value);

  /// Writes string in UTF8
  Future<BinaryWriter> writeString(String value);

  /// Writes double
  Future<BinaryWriter> writeDouble(double value);
}
