import 'dart:convert';
import 'dart:typed_data';

import '../../number_types.dart';

extension IntStreamExtensions on Stream<int> {
  Future<Uint8List> readPure(int length) async {
    return Uint8List.fromList(await take(length).toList());
  }

  Future<int> readInt() async {
    var type = await first;
    var numType = NumberTypes.values.firstWhere((e) => e.type == type);
    var size = numType.getBytesCount();
    var bytesData =
        Uint8List.fromList(await take(size).toList()).buffer.asByteData();

    int result;
    switch (numType) {
      case NumberTypes.byte:
        result = bytesData.getInt8(0);
        break;
      case NumberTypes.int16:
        result = bytesData.getInt16(0, Endian.big);
        break;
      case NumberTypes.int32:
        result = bytesData.getInt32(0, Endian.big);
        break;
      case NumberTypes.int64:
        result = bytesData.getInt64(0, Endian.big);
        break;
      case NumberTypes.double:
        throw Exception('Impossible case $type');
    }
    return result;
  }

  Future<double> readDouble() async {
    var result =
        (await readPure(8)).buffer.asByteData().getFloat64(0, Endian.big);
    return result;
  }

  Future<bool> readBoolean() async {
    var val = await first;
    assert(val == 0 || val == 1);
    return val == 1;
  }

  Future<String> readString() async {
    var length = await readInt();
    var bytes = await take(length).toList();
    return utf8.decode(bytes);
  }
}
