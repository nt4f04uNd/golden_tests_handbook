import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:golden_tests_handbook/components/confetti_button.dart';

void main() {
  testWidgets('$AnimationSheetBuilder', (tester) async {
    final animationSheet = AnimationSheetBuilder(frameSize: Size.square(200));
    addTearDown(animationSheet.dispose);

    target() => animationSheet.record(
      MediaQuery(
        data: MediaQueryData.fromView(
          tester.view,
        ).copyWith(size: Size.square(200)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Center(child: ConfettiButton(text: 'Wohoo!', onPressed: () {})),
        ),
      ),
    );

    await tester.pumpWidget(target());
    await tester.tap(find.text('Wohoo!'));
    await tester.pumpFrames(target(), const Duration(milliseconds: 316));

    await expectLater(
      animationSheet.collate(5),
      matchesGoldenFile('goldens/animation_sheet_test.png'),
    );
  });
}
