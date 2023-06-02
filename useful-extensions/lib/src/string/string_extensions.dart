extension StringExtensions on String {
  /// Returns true if string is empty
  bool isStringEmpty() {
    return isEmpty;
  }

  /// Returns true if string is whitespace
  bool isWhiteSpace() {    
    for (var i = 0; i < length; i++) {
      switch (this[i]) {
        case ' ':
        case '\r':
        case '\n':
          continue;
      }
      return false;
    }
    return true;
  }
}
