// TODO: Put public facing types in this file.

import 'package:binary_serializable/binary_serializable.dart';
import 'package:e_book/src/b_block_types.dart';

abstract class BBlock extends ISerializable {
  //Type is discriminator and should not be normally serialized from inside
  BBlockTypes type;

  int version;

  BBlock(this.type, {this.version = 1});

  @override
  Future serialize(BinaryWriter bw) async {
    await bw.writeInt(version);

    switch (version) {
      case 1:
        break;
      default:
        throw Exception('Version ${version} is not supported');
    }
  }

  @override
  Future deserialize(BinaryReader br) async {
    version = await br.readInt();
  }
}
