import 'package:useful_extensions/useful_extensions.dart';

extension NullableListOfNullablesExtensions<T> on List<T?>? {
  /// Compares [this] nullable list of nullables with [another] one using items comparison function [compareItems]
  bool equalsToNullableListOfNullables(List<T?>? another, bool Function(T, T) compareItems) {
    return equalsToNullableList(another, (a, b) => a.equalsToNullable(b, compareItems));
  }
}
