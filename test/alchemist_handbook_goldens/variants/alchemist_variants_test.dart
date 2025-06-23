import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:golden_tests_handbook/components/confirm_button.dart';

import 'make_golden_test.dart';

void main() {
  makeGoldenTest(
    description: 'Confirm button variants',
    fileName: 'confirm_button_variants',
    cases: [
      GoldenTestScenario(
        name: 'enabled',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConfirmButton(
            text: 'Enabled',
            icon: Icons.done,
            onPressed: () {},
          ),
        ),
      ),
    ],
  );
}
