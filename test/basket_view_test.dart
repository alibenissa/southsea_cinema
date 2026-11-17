import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

const Movie testMovie = Movie(
  id: 'interstellar',
  title: 'Interstellar',
  synopsis: 'Test synopsis',
  ageRating: '12A',
  screeningTime: '169 mins',
  ticketPrice: 7.50,
  posterImagePath: 'assets/images/interstellar.jpeg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  testWidgets('BasketView displays empty message when basket has no tickets',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('Buy Tickets'), findsNothing);
  });

  testWidgets('BasketView renders tickets and removes item when delete pressed',
      (WidgetTester tester) async {
    const TicketItem item = TicketItem(
      movie: testMovie,
      quantity: 2,
    );
    BasketRepository.instance.addItem(item);

    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('My Order'), findsOneWidget);
    expect(find.text('2 x Interstellar'), findsOneWidget);
    expect(find.text('£15.00'), findsWidgets);
    expect(find.text('Buy Tickets'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();

    expect(find.text('Your basket is empty'), findsOneWidget);
  });

  testWidgets('Buy Tickets clears basket and shows confirmation',
      (WidgetTester tester) async {
    const TicketItem item = TicketItem(
      movie: testMovie,
      quantity: 1,
    );
    BasketRepository.instance.addItem(item);

    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    await tester.tap(find.text('Buy Tickets'));
    await tester.pump();

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('Thanks, your tickets are booked'), findsOneWidget);
  });
}
