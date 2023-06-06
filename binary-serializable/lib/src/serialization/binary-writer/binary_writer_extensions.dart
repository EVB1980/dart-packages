import 'binary_writer.dart';

extension BinaryWriterExtensions on BinaryWriter {
  /// Writes nullable object
  Future<BinaryWriter> writeNullable<T>(
    T? value,
    Future<BinaryWriter> Function(BinaryWriter, T) serialize,
  ) async {
    await writeBoolean(value == null);
    if (value == null) return this;
    return await serialize(this, value);
  }

  /// Writes nullable boolean
  Future<BinaryWriter> writeNBoolean(bool? value) {
    return writeNullable(value, (br, v) => br.writeBoolean(v));
  }

  /// Writes nullable integer
  Future<BinaryWriter> writeNInt(int? value) {
    return writeNullable(value, (br, v) => br.writeInt(v));
  }

  /// Writes nullable string
  Future<BinaryWriter> writeNString(String? value) {
    return writeNullable(value, (br, v) => br.writeString(v));
  }

  /// Writes nullable double
  Future<BinaryWriter> writeNDouble(double? value) {
    return writeNullable(value, (br, v) => br.writeDouble(v));
  }

  /// Writes list of objects
  Future<BinaryWriter> writeList<T>(
    List<T> value,
    Future<BinaryWriter> Function(BinaryWriter, T) serialize,
  ) async {
    await writeInt(value.length);
    for (var i = 0; i < value.length; i++) {
      await serialize(this, value[i]);
    }
    return this;
  }

  /// Writes nullable list of object
  Future<BinaryWriter> writeNList<T>(
    List<T>? value,
    Future<BinaryWriter> Function(BinaryWriter, T) serialize,
  ) {
    return writeNullable(value, (br, v) => br.writeList(v, serialize));
  }

  /// Writes list of nullable objects
  Future<BinaryWriter> writeListN<T>(
    List<T?> value,
    Future<BinaryWriter> Function(BinaryWriter, T) serialize,
  ) {
    return writeList(value, (br, v) => br.writeNullable(v, serialize));
  }

  /// Writes nullable list of nullable objects
  Future<BinaryWriter> writeNListN<T>(
    List<T?>? value,
    Future<BinaryWriter> Function(BinaryWriter, T) serialize,
  ) {
    return writeNullable(value, (br, v) => br.writeListN(v, serialize));
  }
}
