extension ListExtensions<T> on List<T> {
  /// Checks if list is empty
  bool isEmptyList() => isEmpty;

  /// Compares [this] list with [another] using items comparison function [compareItems]
  bool equalsToList(List<T> another, bool Function(T, T) compareItems) {
    if (length != another.length) return false;
    for (var i = 0; i < length; i++) {
      if (!compareItems(this[i], another[i])) return false;
    }
    return true;
  }
}
