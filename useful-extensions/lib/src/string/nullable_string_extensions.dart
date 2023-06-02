import 'package:useful_extensions/src/string/string_extensions.dart';

extension NullableStringExtensions on String? {
  /// Returns true if string is null or empty
  bool isStringNullOrEmpty() {
    return this == null || this!.isStringEmpty();
  }

  /// Returns true if string is null or whitespace
  bool isStringNullOrWhiteSpace() {
    return this == null || this!.isWhiteSpace();
  }

  /// Returns true if string is null or whitespace
  bool isStringNullOrEmptyOrWhiteSpace() {
    return this == null || this!.isStringEmpty() || this!.isWhiteSpace();
  }
}
