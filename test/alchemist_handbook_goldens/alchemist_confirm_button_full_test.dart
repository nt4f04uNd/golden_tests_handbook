import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:golden_tests_handbook/components/confirm_button.dart';

void main() {
  for (final icon in [null, Icons.done]) {
    goldenTest(
      '$ConfirmButton ${icon == null ? '' : 'with icon'}',
      fileName: 'confirm_button${icon == null ? '' : '_with_icon'}',
      pumpBeforeTest: pumpNTimes(1, Durations.medium1),
      builder:
          () => GoldenTestGroup(
            columns: 1,
            children: [
              GoldenTestScenario(
                name: 'enabled',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConfirmButton(
                    text: 'Enabled',
                    icon: icon,
                    onPressed: () {},
                  ),
                ),
              ),
              GoldenTestScenario(
                name: 'loading',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConfirmButton(
                    text: 'Loading',
                    icon: icon,
                    onPressed: () {},
                    state: ConfirmButtonState.loading,
                  ),
                ),
              ),
              GoldenTestScenario(
                name: 'disabled',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConfirmButton(
                    text: 'Disabled',
                    icon: icon,
                    onPressed: () {},
                    state: ConfirmButtonState.disabled,
                  ),
                ),
              ),
              GoldenTestScenario(
                name: 'green button',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConfirmButton(
                    text: 'Green',
                    icon: icon,
                    onPressed: () {},
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
              GoldenTestScenario(
                name: 'green disabled button',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ConfirmButton(
                    text: 'Green',
                    icon: icon,
                    onPressed: () {},
                    state: ConfirmButtonState.disabled,
                    disabledColor: Colors.green[900],
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
