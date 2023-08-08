import 'package:binary_serializable/binary_serializable.dart';
import 'package:e_book/src/b_block_types.dart';
import 'package:e_book/src/blocks/base/b_block.dart';

class BBlocksBinarySerializationHelper {
  static Future<BBlock> deserialize(BinaryReader br) async {
    var idx = await br.readInt();
    var type = BBlockTypes.values[idx];
    switch (type) {
      default:
        throw AssertionError('Type "$type" is not supported!');
    }
  }

  static Future serialize(BinaryWriter bw, BBlock block) async {
    await bw.writeInt(block.type.index);
    await block.serialize(bw);
  }
}
