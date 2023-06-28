import 'package:flutter_test/flutter_test.dart';

import '../../../lib/src/screens/home_screen.dart';
import '../../tool/mocks.dart';
import '../../tool/test_app.dart';

void main() {
  testWidgets('HomeScreen Displays', (tester) async {
    final repository = MockRepository();
    final target = TestApp(
      repository: repository,
      child: HomeScreen(),
    );

    await tester.pumpWidget(target);
    await tester.pump();
    expect(find.text('{{name.pascalCase()}} - Home'), findsOneWidget);
  });
}
