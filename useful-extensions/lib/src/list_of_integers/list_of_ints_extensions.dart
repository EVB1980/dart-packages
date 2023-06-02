import 'package:useful_extensions/useful_extensions.dart';

extension ListOfIntsExtensions on List<int> {
  /// Compares two lists of integers
  bool equalsToListOfInts(List<int> another) {
    return equalsToList(another, (a, b) => a == b);
  }
}
