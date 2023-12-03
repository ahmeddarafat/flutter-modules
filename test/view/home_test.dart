import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/testing/view/home_page.dart';
import 'package:flutter_modules/modules/testing/view_model/favorite.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

Widget createHomeScreen() => ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group('Home Page Widget Tests', () {
    // BEGINNING OF NEW CONTENT
    testWidgets('Testing if ListView shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget);
    });

    // END OF NEW CONTENT

    // WidgetTester tester: that provides the same resources to your widgets that they would have in a running app,
    testWidgets('Testing Scrolling', (tester) async {
      // pumpWidget method: kick off the process to render the UI from the given [widget]
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);

      //? need understanding
      await tester.fling(
        find.byType(ListView),
        const Offset(0, -200),
        3000,
      );

      //? need understanding
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });

    testWidgets('Testing IconButtons', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byIcon(Icons.favorite), findsNothing);
      await tester.tap(find.byIcon(Icons.favorite_border).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Added to favorites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsWidgets);
      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pumpAndSettle(const Duration(seconds: 1));
      expect(find.text('Removed from favorites.'), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsNothing);

    });

    testWidgets("find an item which it's deep on list", (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text("Item 5"), findsOneWidget);
    });
  });
}
