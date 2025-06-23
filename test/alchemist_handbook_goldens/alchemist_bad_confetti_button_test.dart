import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:golden_tests_handbook/components/confetti_button.dart';

void main() {
  goldenTest(
    '$ConfettiButton',
    fileName: 'confetti_button',
    pumpBeforeTest: pumpNTimes(1, Durations.medium1),
    whilePerforming: (WidgetTester tester) async {
      await tester.tap(find.text('Wohoo!'));
      await tester.pump(Durations.medium1);
      await tester.pump(Durations.medium1);
      await tester.pump(Durations.medium1);
      await tester.pump(Durations.medium1);
      return null;
    },
    constraints: BoxConstraints.tightFor(width: 200, height: 200),
    builder: () => ConfettiButton(text: 'Wohoo!', onPressed: () {}),
  );
}
