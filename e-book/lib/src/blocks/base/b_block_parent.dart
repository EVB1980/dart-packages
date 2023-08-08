import 'package:binary_serializable/binary_serializable.dart';
import 'package:e_book/src/b_blocks_binary_serialization_helper.dart';
import 'package:e_book/src/blocks/base/b_block.dart';
import 'package:e_book/src/b_block_types.dart';

abstract class BBlockParent extends BBlock {
  int level = 0;

  List<BBlock>? children;

  BBlockParent(BBlockTypes type, {int version = 1}) : super(type, version: version);

  void addChild(BBlock? b) {
    if (b == null) return;
    children ??= [];
    children!.add(b);
  }

  @override
  Future serialize(BinaryWriter bw) async {
    super.serialize(bw);

    switch (version) {
      case 1:
        bw.writeNList(
          children,
          (bw, b) async {
            await b.serialize(bw);
            return bw;
          },
        );
    }
  }

  @override
  Future deserialize(BinaryReader br) async {
    children = await br.readNList(BBlocksBinarySerializationHelper.deserialize);
  }
}
