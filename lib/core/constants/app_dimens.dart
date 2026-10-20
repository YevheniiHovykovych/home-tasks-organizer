import 'package:flutter/material.dart';

/// Відступи (spacing tokens із макета Figma).
class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double s = 8;
  static const double m = 12;
  static const double l = 16;

  /// Поля екрана: 16 dp з усіх боків.
  static const EdgeInsets screen = EdgeInsets.all(l);

  /// Нижній відступ списків на вкладках, щоб FAB не перекривав
  /// останню картку (56 dp кнопка + 2 × 16 dp відступів).
  static const double fabSafeBottom = 88;
}

/// Радіуси скруглення елементів.
class AppRadius {
  AppRadius._();

  static const double field = 8;
  static const double stat = 10;
  static const double badge = 12;
  static const double card = 16;
}