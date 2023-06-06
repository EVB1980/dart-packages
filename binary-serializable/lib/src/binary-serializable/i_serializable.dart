import 'dart:typed_data';

import 'package:binary_serializable/src/serialization/binary-reader/bytes_binary_reader.dart';
import 'package:binary_serializable/src/serialization/binary-writer/bytes_binary_writer.dart';

import '../serialization/binary-reader/binary_reader.dart';
import '../serialization/binary-writer/binary_writer.dart';

abstract class ISerializable {
  Future serialize(BinaryWriter bw);

  Future deserialize(BinaryReader br);
}

extension ISerializableExtensions on ISerializable{
  Uint8List serializeToBytes() {
    var bw = BytesBinaryWriter();
    serialize(bw);
    return bw.takeBytes();
  }

  void deserializeFromBytes(Uint8List bytes){
    var br = BytesBinaryReader(bytes);
    deserialize(br);
  }
}