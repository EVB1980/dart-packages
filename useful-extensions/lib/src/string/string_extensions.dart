import 'dart:convert';

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

  /// Returns true if this string is equals to [other]
  bool equalsToString(String other) {
    if (length != other.length) return false;
    for (var i = 0; i < length; i++) {
      if (this[i] != other[i]) return false;
    }
    return true;
  }

  /// Returns true if this string is equals to [other]
  bool equalsToStringIgnoreCase(String other) {
    if (length != other.length) return false;
    int next = 0;
    String a;
    String b;
    for (var i = 0; i < length;) {
      next = indexOf(' ', i);
      if (next > 0) {
        a = substring(i, next);
        b = other.substring(i, next);
      } else {
        a = substring(i);
        b = other.substring(i);
      }
      a = a.toUpperCase();
      b = b.toUpperCase();
      if (!a.equalsToString(b)) return false;
      i += a.length + 1;
    }
    return true;
  }

  /// Tabs single-line or multiline string
  String tab(int tab) {
    var tabString = ''.padLeft(tab * 4);
    var lineSplitter = LineSplitter();
    var lines = lineSplitter.convert(this);
    var buffer = StringBuffer();
    var lastLineIdx = lines.length - 1;
    for (var i = 0; i < lines.length; i++) {
      buffer.write(tabString);
      if (i < lastLineIdx)
        buffer.writeln(lines[i]);
      else
        buffer.write(lines[i]);
    }
    return buffer.toString();
  }
}
