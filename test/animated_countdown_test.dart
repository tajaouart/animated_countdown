import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:animated_countdown/animated_countdown.dart';

void main() {
  testWidgets('Test count down value changing', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CountDownWidget(),
      ),
    );

    // Count Down initial value : 3
    expect(find.text('3'), findsOneWidget);
    expect(find.byKey(const Key('CountDownValue')), findsOneWidget);

    // Count Down value : 2
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('2'), findsOneWidget);
    expect(find.byKey(const Key('CountDownValue')), findsOneWidget);

    // Count Down value : 1
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('1'), findsOneWidget);
    expect(find.byKey(const Key('CountDownValue')), findsOneWidget);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Count Down value : None
    expect(find.byKey(const Key('CountDownValue')), findsNothing);
    expect(find.byKey(const Key('CountDownValueHidden')), findsOneWidget);
  });

  testWidgets('Test text size changing', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CountDownWidget(),
      ),
    );

    // initial text size value = 100
    final text1 = find.byType(AnimatedDefaultTextStyle).first;
    final size1 =
        (tester.firstWidget(text1) as AnimatedDefaultTextStyle).style.fontSize;
    expect(size1 == 100, true);

    await tester.pump(const Duration(milliseconds: 500));

    // after 500 milliseconds text size value should be less than 100
    final text2 = find.byType(AnimatedDefaultTextStyle).first;
    final size2 =
        (tester.firstWidget(text2) as AnimatedDefaultTextStyle).style.fontSize;
    expect(size2 == 100, false);
  });

  testWidgets('Test text color', (tester) async {
    const Color color = Color(0xfff44336);

    await tester.pumpWidget(
      const MaterialApp(
        home: CountDownWidget(
          textStyle: TextStyle(color: color),
        ),
      ),
    );

    final text = find.byType(AnimatedDefaultTextStyle).first;
    expect(
      (tester.firstWidget(text) as AnimatedDefaultTextStyle).style.color,
      color,
    );

    await tester.pumpAndSettle(const Duration(seconds: 3));
  });

  testWidgets('Test onEnd method call', (tester) async {
    bool methodIsCalled = false;
    onEnd() {
      methodIsCalled = true;
    }

    await tester.pumpWidget(
      MaterialApp(
        home: CountDownWidget(
          onEnd: onEnd,
        ),
      ),
    );
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(methodIsCalled, true);
  });
}
