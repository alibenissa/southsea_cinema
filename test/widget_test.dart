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
  });
}
