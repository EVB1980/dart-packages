import 'package:useful_extensions/useful_extensions.dart';

extension NullableListOfNullableIntsExtensions on List<int?>? {
  /// Compares two nullable lists of integers
  bool equalsToNullableListOfNullableInts(List<int?>? another) {
    return equalsToNullableListOfNullables(another, (a, b) => a==b);
  }
}
