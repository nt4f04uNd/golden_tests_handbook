import 'package:alchemist/alchemist.dart';
import 'package:golden_tests_handbook/components/ishihara_image.dart';

void main() {
  goldenTest(
    'Color vision test',
    fileName: 'color_vision_test',
    pumpBeforeTest: precacheImages, // <--
    builder:
        () => GoldenTestGroup(
          columns: 1,
          children: [
            GoldenTestScenario(name: 'Ishihara', child: IshiharaImage()),
          ],
        ),
  );
}
