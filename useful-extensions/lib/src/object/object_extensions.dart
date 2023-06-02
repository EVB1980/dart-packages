extension ObjectExtensions<T> on T? {
  /// Compares [this] object to [another] nullable, with comparison function
  bool equalsToNullable(T? another, bool Function(T, T) compare) {
    var t = this;
    if (identical(t, another)) return true;
    if (t == null || another == null) return false;
    return compare(t, another);
  }
}






