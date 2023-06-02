import 'dart:typed_data';

import 'package:binary_serializable/src/serialization/bytes_builder_extension.dart';
import 'package:binary_serializable/src/serialization/uint8_list_extensions.dart';

abstract class BaseBinarySerializeable {
  /// Returns last serialization algorithm version
  int version();

  /// Serializes object to bytes
  Uint8List serializeToBytes() {
    var bytesBuilder = BytesBuilder();
    bytesBuilder.writeInt(version());
    write(bytesBuilder);
    return bytesBuilder.toBytes();
  }

  /// Writes object to BytesBuilder
  void write(BytesBuilder bb);

  /// Deserializes object from bytes
  void deserializeFromBytes(Uint8List data) {
    var (version, offset) = data.readInt(0);
    read(data.buffer.asByteData(offset), version);
  }

  void read(ByteData bd, int version);
}

