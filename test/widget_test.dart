import 'package:flutter_test/flutter_test.dart';
import 'package:wallet_nfc/main.dart';

void main() {
  testWidgets('Load DotEnv Successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
