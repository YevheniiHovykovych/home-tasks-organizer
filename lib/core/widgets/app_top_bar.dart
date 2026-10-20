import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../theme/app_text_styles.dart';

/// Верхня панель за макетом Figma: висота 56 dp, фон primary, тінь.
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({
    super.key,
    required this.title,
    this.showBack = false,
    this.leading,
    this.actions,
  });

  final String title;

  /// Показати кнопку «Назад» (шеврон) зліва.
  final bool showBack;

  /// Власний віджет ліворуч (наприклад, «×» на формі завдання).
  final Widget? leading;

  /// Кнопки дій праворуч.
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget = leading;
    if (leadingWidget == null && showBack) {
      leadingWidget = IconButton(
        tooltip: 'Назад',
        icon: const Icon(Icons.arrow_back_ios_new, size: 18),
        onPressed: () => Navigator.of(context).maybePop(),
      );
    }

    return AppBar(
      automaticallyImplyLeading: false,
      leading: leadingWidget,
      title: Text(title),
      actions: actions,
      centerTitle: false,
      titleSpacing: leadingWidget == null ? 16.0 : 0.0,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 3,
      scrolledUnderElevation: 3,
      shadowColor: AppColors.shadowStrong,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppTextStyles.appBarTitle,
    );
  }
}