import 'package:flutter_test/flutter_test.dart';

import 'package:cv_flutter_josbelle/main.dart';

void main() {
  testWidgets('Login page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CvApp());

    // Verify that login elements exist.
    expect(find.text('Connexion CV'), findsOneWidget);
    expect(find.text('Se connecter'), findsOneWidget);
  });
}
