import 'package:useful_extensions/useful_extensions.dart';

extension NullableListExtensions<T> on List<T>? {
  /// Compares [this] nullable list with [another] using items comparison function [compareItems]
  bool equalsToNullableList(List<T>? another, bool Function(T, T) compareItems) {
    return equalsToNullable(another, (a, b) => a.equalsToList(b, compareItems));
  }
}
