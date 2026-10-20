import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

/// Круглий аватар: світла заливка та рамка primary 2 dp.
class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.size, this.child});

  final double size;

  /// Вміст аватара (ініціали або фото), за макетом — порожній.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.primary, width: 2),
      ),
      child: child,
    );
  }
}