import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:golden_tests_handbook/components/confirm_button.dart';

void main() {
  goldenTest(
    '$ConfirmButton',
    fileName: 'confirm_button',
    builder:
        () => GoldenTestGroup(
          columns: 1,
          children: [
            GoldenTestScenario(
              name: 'enabled',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConfirmButton(text: 'Enabled', onPressed: () {}),
              ),
            ),
            GoldenTestScenario(
              name: 'loading',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConfirmButton(
                  text: 'Loading',
                  onPressed: () {},
                  state: ConfirmButtonState.loading,
                ),
              ),
            ),
          ],
        ),
  );
}
