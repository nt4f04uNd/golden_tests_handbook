import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:golden_tests_handbook/main.dart';

void main() {
  goldenTest(
    'Idle $DelayedConfirmButton',
    fileName: 'delayed_confirm_button',
    builder:
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: DelayedConfirmButton(),
        ),
  );

  goldenTest(
    'Press on $DelayedConfirmButton',
    fileName: 'pressed_delayed_confirm_button',
    whilePerforming: (WidgetTester tester) async {
      await tester.tap(find.byType(DelayedConfirmButton));
      await tester.pump(Duration(milliseconds: 250));
      await tester.pump(Duration(milliseconds: 250));
      await tester.pump(Duration(milliseconds: 250));
      return null;
    },
    builder:
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: DelayedConfirmButton(),
        ),
  );
}
