import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_tests_handbook/components/confirm_button.dart';

void main() {
  group('$ConfirmButton', () {
    testWidgets('enabled', (tester) async {
      Widget wrapper(Widget child) => MaterialApp(
        home: Center(
          child: RepaintBoundary(
            child: SizedBox(
              width: 200,
              height: 100,
              child: Center(child: child),
            ),
          ),
        ),
      );

      await tester.pumpWidget(
        wrapper(ConfirmButton(text: 'Enabled', onPressed: () {})),
      );

      await expectLater(
        find.byType(ConfirmButton),
        matchesGoldenFile('goldens/confirm_button.png'),
      );
    });
  });
}
