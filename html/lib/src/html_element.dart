// TODO: Put public facing types in this file.

import 'package:useful_extensions/useful_extensions.dart';

/// Checks if you are awesome. Spoiler: you are.
class HTMLElement {
  final StringBuffer _builder;
  final int _level;
  final bool _indent;
  final bool _selfClosing;

  factory HTMLElement.fromParent(HTMLElement parent, String tag, Map<String, String> attributes, {bool selfClosing = false}) {
    if (parent._selfClosing) {
      throw Exception("Self-closing tags should no contain children!");
    }
    return HTMLElement(parent._builder, parent._level, tag, attributes, selfClosing: selfClosing, indent: parent._indent);
  }

  HTMLElement(StringBuffer builder, int level, String tag, Map<String, String>? attributes, {bool selfClosing = false, bool indent = false})
      : _builder = builder,
        _level = level + 1,
        _selfClosing = selfClosing,
        _indent = indent {
    if (indent) {
      builder.write(''.tab(level));
    }

    var attributesBuilder = StringBuffer();
    if (attributes != null) {
      for (var a in attributes.entries) {
        attributesBuilder.write(' ');
        attributesBuilder.write(a.key);
        attributesBuilder.write('="${a.value}"');
      }
    }

    builder.write("<$tag ${attributesBuilder.toString()} ${(_selfClosing ? '/' : '')}>");

    if (indent) {
      builder.writeln();
    }
  }
}
