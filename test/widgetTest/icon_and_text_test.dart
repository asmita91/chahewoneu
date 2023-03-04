import 'package:chahewoneu/UserScreens/navpages/icons_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('IconAndTextWidget displays icon and subtext',
      (WidgetTester tester) async {
    // Define test data
    const IconData testIcon = Icons.favorite;
    const String testSubtext = 'Test subtext';
    const Color testIconColor = Colors.red;

    // Build the widget tree
    await tester.pumpWidget(
      MaterialApp(
        home: IconAndTextWidget(
          icon: testIcon,
          subText: testSubtext,
          iconColor: testIconColor,
        ),
      ),
    );

    // Verify that the icon and subtext are displayed
    expect(find.byIcon(testIcon), findsOneWidget);
    expect(find.text(testSubtext), findsOneWidget);
  });
}
