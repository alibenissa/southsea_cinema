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
        'Booking flow: book Interstellar, go back, then book Oppenheimer',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      final Finder interstellarBookNow = find.descendant(
        of: find.widgetWithText(MovieCard, 'Interstellar'),
        matching: find.text('Book Now'),
      );

      await tester.tap(interstellarBookNow);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Interstellar'), findsOneWidget);
      expect(find.text('12A'), findsOneWidget);
      expect(find.text('169 mins'), findsOneWidget);

      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(
        find.text('Please select at least 1 ticket'),
        findsOneWidget,
      );

      final NavigatorState navigator = tester.state(find.byType(Navigator));
      navigator.pop();
      await tester.pumpAndSettle();

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.byType(MovieListing), findsNothing);

      final Finder oppenheimerBookNow = find.descendant(
        of: find.widgetWithText(MovieCard, 'Oppenheimer'),
        matching: find.text('Book Now'),
      );

      await tester.ensureVisible(oppenheimerBookNow);
      await tester.tap(oppenheimerBookNow);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Oppenheimer'), findsOneWidget);
      expect(find.text('15'), findsOneWidget);
      expect(find.text('180 mins'), findsOneWidget);

      expect(find.textContaining('Added'), findsNothing);

      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(
        find.text('Please select at least 1 ticket'),
        findsOneWidget,
      );
    });
  });
}
