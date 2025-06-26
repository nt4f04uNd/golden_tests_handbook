import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';

void makeGoldenTest({
  required String description,
  required String fileName,
  required List<GoldenTestScenario> cases,
}) {
  for (final isDarkTheme in [false, true]) {
    final themeName = isDarkTheme ? 'dark' : 'light';

    for (final textDirection in [TextDirection.ltr, TextDirection.rtl]) {
      final textDirectionName = textDirection.name;

      // Логика вариантов...
      // Модификация имени файла и описания теста
      final modifiedFileName = '$fileName.$themeName.$textDirectionName';
      final modifiedDescription =
          '$description | $themeName | $textDirectionName';

      // Переопределение темы и конфигурации Alchemist
      final theme = isDarkTheme ? ThemeData.dark() : ThemeData.light();
      final modifiedConfig = AlchemistConfig.current().merge(
        AlchemistConfig(
          theme: theme,
          goldenTestTheme:
              AlchemistConfig.current().goldenTestTheme?.copyWith(
                    backgroundColor: theme.scaffoldBackgroundColor,
                  )
                  as GoldenTestTheme?,
        ),
      );

      AlchemistConfig.runWithConfig(
        config: modifiedConfig,
        run:
            // Создание теста на каждый вариант
            () => goldenTest(
              modifiedDescription,
              fileName: modifiedFileName,
              builder:
                  // Использование Directionality для поддержки RTL
                  () => Directionality(
                    textDirection: textDirection,
                    child: GoldenTestGroup(columns: 1, children: cases),
                  ),
            ),
      );
    }
  }
}
