import 'package:useful_extensions/src/object/object_extensions.dart';
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

  /// Returns true if this nullable string equals to [other] nullable string
  bool equalsToNullableString(String? other) {
    return equalsToNullable(other, (a, b) => a.equalsToString(b));
  }

  /// Returns true if this nullable string equals to [other] nullable string
  bool equalsToNullableStringIgnoreCase(String? other) {
    return equalsToNullable(other, (a, b) => a.equalsToStringIgnoreCase(b));
  }
}
