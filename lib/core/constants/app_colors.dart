import 'package:flutter/material.dart';

/// Кольорова палітра застосунку (design tokens із макета Figma).
class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF3D4CC9); // rgb(61, 76, 201)
  static const Color primaryLight = Color(0xFFE0E3FC); // rgb(224, 227, 252)
  static const Color background = Color(0xFFFAFAFC); // rgb(250, 250, 252)
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFCCCCD4); // rgb(204, 204, 212)
  static const Color textPrimary = Color(0xFF1C1C21); // rgb(28, 28, 33)
  static const Color textSecondary = Color(0xFF757580); // rgb(117, 117, 128)

  static const Color blue = Color(0xFF598CF2); // rgb(89, 140, 242)
  static const Color green = Color(0xFF40B266); // rgb(64, 178, 102)
  static const Color amber = Color(0xFFF2B226); // rgb(242, 178, 38)
  static const Color red = Color(0xFFE54D4D); // rgb(229, 77, 77)
  static const Color error = red;

  /// Тінь карток і кнопок (чорний, 10 %).
  static const Color shadow = Color(0x1A000000);

  /// Тінь верхньої панелі та нижньої навігації (чорний, 20 %).
  static const Color shadowStrong = Color(0x33000000);
}