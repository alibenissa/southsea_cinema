import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/ticket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie1 = Movie(
  id: 'interstellar',
  title: 'Interstellar',
  synopsis: 'Test synopsis',
  ageRating: '12A',
  screeningTime: '169 mins',
  ticketPrice: 7.50,
  posterImagePath: 'assets/images/interstellar.jpeg',
);

const Movie testMovie2 = Movie(
  id: 'oppenheimer',
  title: 'Oppenheimer',
  synopsis: 'Test synopsis',
  ageRating: '15',
  screeningTime: '180 mins',
  ticketPrice: 8.00,
  posterImagePath: 'assets/images/oppenheimer.jpeg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository tests', () {
    test('starts with empty basket and zero total', () {
      final BasketRepository basket = BasketRepository.instance;
      expect(basket.getItems().length, 0);
      expect(basket.getTotalTickets(), 0);
      expect(basket.getTotal(), 0.0);
    });

    test('adds tickets and calculates total correctly', () {
      final BasketRepository basket = BasketRepository.instance;
      const TicketItem item1 = TicketItem(
        movie: testMovie1,
        quantity: 2,
      );
      const TicketItem item2 = TicketItem(
        movie: testMovie2,
        quantity: 3,
      );

      basket.addItem(item1);
      basket.addItem(item2);

      expect(basket.getItems().length, 2);
      expect(basket.getTotalTickets(), 5);
      expect(basket.getTotal(), 39.0);
    });

    test('removes tickets correctly', () {
      final BasketRepository basket = BasketRepository.instance;
      const TicketItem item = TicketItem(
        movie: testMovie1,
        quantity: 1,
      );

      basket.addItem(item);
      expect(basket.getItems().length, 1);

      basket.removeItem(0);
      expect(basket.getItems().length, 0);
      expect(basket.getTotal(), 0.0);
    });

    test('clears all tickets', () {
      final BasketRepository basket = BasketRepository.instance;
      const TicketItem item1 = TicketItem(
        movie: testMovie1,
        quantity: 2,
      );
      const TicketItem item2 = TicketItem(
        movie: testMovie2,
        quantity: 1,
      );

      basket.addItem(item1);
      basket.addItem(item2);
      basket.clear();

      expect(basket.getItems().length, 0);
      expect(basket.getTotal(), 0.0);
    });
  });
}