import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:{{name.snakeCase()}}/src/screens/home_screen.dart';
import 'package:alchemist/alchemist.dart';
import 'package:golden_toolkit/golden_toolkit.dart' show loadAppFonts;
import '../../tool/mocks.dart';
import '../../tool/test_app.dart';

void main() {
  group('Golden Tests', () {
    setUpAll(() async {
      await loadAppFonts();
    });

    goldenTest(
      'HomeScreen',
      fileName: 'home-screen',
      constraints: const BoxConstraints(maxHeight: 955, maxWidth: 485),
      pumpBeforeTest: precacheImages,
      builder: () {
        return TestApp(
          repository: MockRepository(),
          child: const HomeScreen(),
        );
      },
    );
  });

  group('Widget Tests', () {
    testWidgets('HomeScreen Displays', (tester) async {
      final repository = MockRepository();
      final target = TestApp(
        repository: repository,
        child: const HomeScreen(),
      );

      await tester.pumpWidget(target);
      await tester.pump();
      expect(find.text('{{name.pascalCase()}} - Home'), findsOneWidget);
    });
  });
}
