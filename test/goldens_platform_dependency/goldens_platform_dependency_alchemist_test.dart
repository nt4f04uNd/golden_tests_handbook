import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

void main() {
  final child = Container(
    color: Colors.blue,
    padding: const EdgeInsets.all(20.0),
    child: Text('text'),
  );

  const isRunningInCi = bool.fromEnvironment('CI', defaultValue: false);
  // ignore: avoid_print
  print('Running in CI: $isRunningInCi');

  AlchemistConfig.runWithConfig(
    config: AlchemistConfig.current().copyWith(
      goldenTestTheme:
          GoldenTestTheme.standard().copyWith(backgroundColor: Colors.white)
              as GoldenTestTheme?,
      platformGoldensConfig: const PlatformGoldensConfig(
        enabled: !isRunningInCi,
      ),
    ),
    run:
        () => goldenTest(
          'Alchemist golden test',
          fileName: 'alchemist',
          pumpBeforeTest: pumpNTimes(1, Durations.medium1),
          builder: () => child,
        ),
  );
}
