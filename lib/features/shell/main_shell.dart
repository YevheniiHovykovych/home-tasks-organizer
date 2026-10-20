import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/widgets.dart';
import '../home/home_screen.dart';
import '../household/household_screen.dart';
import '../profile/profile_screen.dart';
import '../tasks/task_form_screen.dart';
import '../tasks/task_list_screen.dart';

/// Оболонка з нижньою навігацією: Головна, Завдання, Дім, Профіль.
///
/// [IndexedStack] зберігає стан вкладок під час перемикання.
class MainShell extends StatefulWidget {
  const MainShell({
    super.key,
    this.initialIndex = 0,
    this.hasHousehold = true,
  });

  /// Вкладка, яка відкривається першою (0 — Головна ... 3 — Профіль).
  final int initialIndex;

  /// `false` — користувач щойно зареєструвався й ще не створив
  /// домогосподарство та не приєднався до нього.
  final bool hasHousehold;

  /// Відкриває оболонку як кореневий екран: історію переходів очищено,
  /// тому кнопка «Назад» не повертає на вхід чи реєстрацію.
  static void open(
    BuildContext context, {
    int initialIndex = 0,
    bool hasHousehold = true,
  }) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(
        builder: (_) => MainShell(
          initialIndex: initialIndex,
          hasHousehold: hasHousehold,
        ),
      ),
      (route) => false,
    );
  }

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
  }

  /// Перехід «FAB «+» → Нове завдання» (екран 04 у схемі навігації).
  void _openNewTask() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const TaskFormScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Клавіатуру обробляють вкладені Scaffold окремих екранів.
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: _index,
        children: [
          HomeScreen(onOpenProfile: () => setState(() => _index = 3)),
          const TaskListScreen(),
          HouseholdScreen(hasHousehold: widget.hasHousehold),
          const ProfileScreen(),
        ],
      ),
      // FAB «+» є лише на вкладках «Головна» та «Завдання».
      floatingActionButton: _index <= 1
          ? FloatingActionButton(
              onPressed: _openNewTask,
              tooltip: 'Додати завдання',
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, size: 28),
            )
          : null,
      bottomNavigationBar: AppBottomNav(
        currentIndex: _index,
        onTap: (index) => setState(() => _index = index),
      ),
    );
  }
}