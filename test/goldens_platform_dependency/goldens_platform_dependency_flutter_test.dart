import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final child = Container(
    color: Colors.blue,
    padding: const EdgeInsets.all(20.0),
    child: Text('text'),
  );

  testWidgets('Flutter golden test', (tester) async {
    Widget wrapper(Widget child) => MaterialApp(
      home: Center(
        child: RepaintBoundary(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Center(
              child: Material(color: Colors.transparent, child: child),
            ),
          ),
        ),
      ),
    );

    await tester.pumpWidget(wrapper(child));

    await expectLater(
      find.byType(Text),
      matchesGoldenFile('goldens/flutter.png'),
    );
  });
}
