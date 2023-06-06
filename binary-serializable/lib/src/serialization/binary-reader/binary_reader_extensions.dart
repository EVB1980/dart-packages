import 'binary_reader.dart';

extension BinaryReaderExtensions on BinaryReader {
  /// Reads nullable object
  Future<T?> readNullable<T>(
      Future<T> Function(BinaryReader) deserialize) async {
    var isNull = await readBoolean();
    if (isNull) return null;
    return deserialize(this);
  }

  /// Reads nullable boolean
  Future<bool?> readNBoolean() {
    return readNullable((br) => br.readBoolean());
  }

  /// Reads nullable integer
  Future<int?> readNInt() {
    return readNullable((br) => br.readInt());
  }

  /// Reads nullable string
  Future<String?> readNString() {
    return readNullable((br) => br.readString());
  }

  /// Reads nullable double
  Future<double?> readNDouble() {
    return readNullable((br) => br.readDouble());
  }

  Stream<T> readItemsStream<T>(
      int count, Future<T> Function(BinaryReader) deseriaize) async* {
    for (var i = 0; i < count; i++) {
      yield await deseriaize(this);
    }
  }

  /// Reads list of objects
  Future<List<T>> readList<T>(
      Future<T> Function(BinaryReader) deseriaize) async {
    var length = await readInt();
    return await readItemsStream(length, deseriaize).toList();
  }

  /// Reads nullable list of object
  Future<List<T>?> readNList<T>(Future<T> Function(BinaryReader) deseriaize) {
    return readNullable((br) => br.readList(deseriaize));
  }

  /// Reads list of nullable objects
  Future<List<T?>> readListN<T>(Future<T> Function(BinaryReader) deseriaize) {
    return readList((br) => readNullable(deseriaize));
  }

  /// Reads nullable list of nullable objects
  Future<List<T?>?> readNListN<T>(Future<T> Function(BinaryReader) deseriaize) {
    return readNullable((br) => br.readListN(deseriaize));
  }
}
