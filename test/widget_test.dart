import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_ecommerce/pages/items_page.dart';

void main() {
  testWidgets('ItemsPage displays product detail from route arguments', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/items',
                  arguments: {
                    'index': 0,
                    'name': 'Nike Air Max',
                    'description':
                        'Sepatu lari premium dengan bantalan udara untuk kenyamanan maksimal.',
                    'price': '\$50',
                    'image': 'images/items/1.jpg',
                  },
                );
              },
              child: const Text('Open item'),
            );
          },
        ),
        onGenerateRoute: (settings) {
          if (settings.name == '/items') {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const ItemsPage(),
            );
          }
          return null;
        },
      ),
    );

    await tester.tap(find.text('Open item'));
    await tester.pumpAndSettle();

    expect(find.text('Nike Air Max'), findsOneWidget);
    expect(
      find.text('Sepatu lari premium dengan bantalan udara untuk kenyamanan maksimal.'),
      findsOneWidget,
    );
  });
}
