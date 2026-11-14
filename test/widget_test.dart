import 'package:flutter/material.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  group('App smoke tests', () {
    testWidgets('App displays HomeView with title',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema'), findsOneWidget);
    });

    testWidgets('Displays movie cards with titles, prices and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.byType(MovieCard), findsNWidgets(2));

      expect(find.text('Interstellar'), findsOneWidget);
      expect(find.text('£7.50'), findsOneWidget);

      expect(find.text('Oppenheimer'), findsOneWidget);
      expect(find.text('£8.00'), findsOneWidget);

      expect(find.text('Book Now'), findsNWidgets(2));
    });
    testWidgets(
        'Tapping Book Now opens MovieListing and Add to order shows feedback',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      // Find the Book Now button inside the Interstellar card
      final Finder interstellarBookNow = find.descendant(
        of: find.widgetWithText(MovieCard, 'Interstellar'),
        matching: find.text('Book Now'),
      );

      await tester.tap(interstellarBookNow);
      await tester.pumpAndSettle();

      // Check the listing page shows Interstellar's details
      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Interstellar'), findsOneWidget);
      expect(find.text('12A'), findsOneWidget);
      expect(find.text('169 mins'), findsOneWidget);

      // Tap Add to order and check the feedback message
      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(
        find.text('Added 0 ticket(s) to your order for Interstellar!'),
        findsOneWidget,
      );
    });
  });
}
