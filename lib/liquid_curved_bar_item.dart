import 'package:flutter/material.dart';

class LiquidCurvedBarItem {
  /// Icon of [LiquidCurvedBarItem].
  final Widget child;

  /// Text of [LiquidCurvedBarItem].
  final String? label;

  /// TextStyle for [label].
  final TextStyle? labelStyle;

  const LiquidCurvedBarItem({
    required this.child,
    this.label,
    this.labelStyle,
  });
}
