import 'package:useful_extensions/useful_extensions.dart';

extension NullableListOfIntsExtensions on List<int>? {
  /// Compares two nullable lists of integers
  bool equalsToNullableListOfInts(List<int>? another) {
    return equalsToNullable(another, (a, b) => a.equalsToListOfInts(b));
  }
}
