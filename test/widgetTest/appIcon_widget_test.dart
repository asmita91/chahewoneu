import 'package:chahewoneu/AdminScreens/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AppIcon displays correct icon and colors',
      (WidgetTester tester) async {
    final icon = Icons.person;
    final backgroundColor = Colors.blue;
    final iconColor = Colors.white;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AppIcon(
            icon: icon,
            backgroundcolor: backgroundColor,
            iconColor: iconColor,
          ),
        ),
      ),
    );

    final containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);

    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsOneWidget);
  });
}
