import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:yamibo/app.dart';

void main() {
  testWidgets('App renders bottom navigation', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: YamiboApp()));
    await tester.pump();

    expect(find.text('收藏'), findsWidgets);
    expect(find.text('论坛'), findsWidgets);
    expect(find.text('我的'), findsWidgets);
  });
}
