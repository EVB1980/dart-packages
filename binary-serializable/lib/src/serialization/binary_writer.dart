import 'dart:typed_data';

import 'package:binary_serializable/src/serialization/bytes_builder_extension.dart';

class BinaryWriter {
  final BytesBuilder _builder;

  BinaryWriter() : _builder = BytesBuilder();

  BinaryWriter writePure(Uint8List data) {
    _builder.writePure(data);
    return this;
  }

  BinaryWriter writeBoolean(bool value) {
    _builder.writeBoolean(value);
    return this;
  }

  BinaryWriter writeInt(int value) {
    _builder.writeInt(value);
    return this;
  }

  BinaryWriter writeDouble(double value) {
    _builder.writeDouble(value);
    return this;
  }

  BinaryWriter writeString(String value) {
    _builder.writeString(value);
    return this;
  }

  BinaryWriter writeNullable<T>(
      T? nValue, void Function(BinaryWriter, T) serialize) {
    _builder.writeNullable(nValue, (value) {
      serialize(this, value);
    });
    return this;
  }

  BinaryWriter writeNBoolean(bool? nValue) {
    writeNullable(nValue, (bw, value) => bw.writeBoolean(value));
    return this;
  }

  BinaryWriter writeNInt(int? nValue) {
    writeNullable(nValue, (bw, value) => bw.writeInt(value));
    return this;
  }

  BinaryWriter writeNDouble(double? nValue) {
    writeNullable(nValue, (bw, value) => bw.writeDouble(value));
    return this;
  }

  BinaryWriter writeNString(String? nValue) {
    writeNullable(nValue, (bw, value) => bw.writeString(value));
    return this;
  }

  BinaryWriter writeList<T>(
    List<T> list,
    void Function(BinaryWriter, T) serialize,
  ) {
    writeInt(list.length);
    for (var item in list) {
      serialize(this, item);
    }
    return this;
  }

  BinaryWriter writeListN<T>(
    List<T?> list,
    void Function(BinaryWriter, T?) serialize,
  ) {
    writeInt(list.length);
    for (var item in list) {
      serialize(this, item);
    }
    return this;
  }

  BinaryWriter writeNList<T>(
    List<T>? nList,
    void Function(BinaryWriter, T) serialize,
  ) {
    writeNullable(nList, (bw, list) => bw.writeList(list, serialize));
    return this;
  }

  BinaryWriter writeNListN<T>(
    List<T?>? nList,
    void Function(BinaryWriter, T) serialize,
  ) {
    writeNullable(nList, (bw, list) => bw.writeNList(list, (bw, item)=>bw.writeNullable(item, serialize)));
    return this;
  }

  Uint8List takeBytes() {
    return _builder.takeBytes();
  }
}
