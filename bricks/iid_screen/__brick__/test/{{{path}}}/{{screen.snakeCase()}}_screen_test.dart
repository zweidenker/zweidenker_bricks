import 'package:flutter_test/flutter_test.dart';

import 'package:{{package}}/{{{path}}}/{{screen.snakeCase()}}_screen.dart';
{{#golden}}
import 'package:alchemist/alchemist.dart';
import 'package:golden_toolkit/golden_toolkit.dart' show loadAppFonts;
{{/golden}}
import '{{{testToolPath}}}tool/mocks.dart';
import '{{{testToolPath}}}tool/test_app.dart';

void main() {
  {{#golden}}
  group('Golden Tests', () {
    setUpAll(() async {
      await loadAppFonts();
    });

    goldenTest(
      '{{screen.pascalCase()}}Screen',
      fileName: '{{screen.paramCase()}}-screen',
      constraints: const BoxConstraints(maxHeight: 1000, maxWidth: 1900),
      pumpBeforeTest: precacheImages,
      builder: () {
        return TestApp(
          repository: MockRepository(),
          child: const {{screen.pascalCase()}}Screen(),
        );
      },
    );
  });
  {{/golden}}
  group('Widget Tests', () {
    testWidgets('Create {{screen.pascalCase()}}Screen', (tester) async {
      await tester.pumpWidget(
        TestApp(
          repository: MockRepository(),
          child: const {{screen.pascalCase()}}Screen(),
        ),
      );
      await tester.pump();
      expect(find.byType({{screen.pascalCase()}}Screen), findsOneWidget);
    });
  });
}
