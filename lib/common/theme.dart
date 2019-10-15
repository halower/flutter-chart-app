import 'dart:ui';
import 'package:flutter/material.dart';

class LayoutColors {

  const LayoutColors();

  static const Color loginGradientStart = Colors.blueAccent;
  static const Color loginGradientEnd = Colors.lightBlueAccent;

  static const primaryGradient = const LinearGradient(
    colors: const [loginGradientStart, loginGradientEnd],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}