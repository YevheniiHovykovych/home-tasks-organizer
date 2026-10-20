import 'package:flutter_test/flutter_test.dart';
import 'package:home_tasks_organizer/app.dart';

void main() {
  testWidgets('Стартовий екран показує форму входу', (tester) async {
    await tester.pumpWidget(const HomeTasksApp());
    await tester.pumpAndSettle();

    expect(find.text('Вхід'), findsOneWidget);
    expect(find.text('Електронна пошта'), findsOneWidget);
    expect(find.text('Увійти'), findsOneWidget);
  });
}