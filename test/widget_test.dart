import 'package:flutter_test/flutter_test.dart';
import 'package:sourav_portfolio/app.dart';

void main() {
  testWidgets('home page shows the name', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.text('Sourav Sathyan CP'), findsWidgets);
  });
}
