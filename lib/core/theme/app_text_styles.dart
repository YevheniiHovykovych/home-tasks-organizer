import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Текстові стилі з макета Figma (шрифт Roboto — типовий для Android).
class AppTextStyles {
  AppTextStyles._();

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle title = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle heading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle input = TextStyle(
    fontSize: 14,
    height: 1.3,
    color: AppColors.textPrimary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle lead = TextStyle(
    fontSize: 13,
    color: AppColors.textSecondary,
  );

  static const TextStyle member = TextStyle(
    fontSize: 13,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 12,
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMuted = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  static const TextStyle link = TextStyle(
    fontSize: 12,
    color: AppColors.primary,
  );

  static const TextStyle chip = TextStyle(fontSize: 12);

  static const TextStyle caption = TextStyle(
    fontSize: 11,
    color: AppColors.textSecondary,
  );

  static const TextStyle captionSmall = TextStyle(
    fontSize: 10,
    color: AppColors.textSecondary,
  );

  static const TextStyle badge = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle navLabel = TextStyle(fontSize: 9);
}