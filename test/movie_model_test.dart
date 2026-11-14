import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('creates Movie instance with given properties', () {
      const movie = Movie(
        id: 'interstellar',
        title: 'Interstellar',
        synopsis: 'A team of explorers travel through a wormhole in space.',
        ageRating: '12A',
        screeningTime: '169 mins',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/interstellar.jpeg',
      );

      expect(movie.id, 'interstellar');
      expect(movie.title, 'Interstellar');
      expect(movie.synopsis,
          'A team of explorers travel through a wormhole in space.');
      expect(movie.ageRating, '12A');
      expect(movie.screeningTime, '169 mins');
      expect(movie.ticketPrice, 7.50);
      expect(movie.posterImagePath, 'assets/images/interstellar.jpeg');
    });

    test('formattedPrice shows pence with two decimal places', () {
      const movie = Movie(
        id: 'interstellar',
        title: 'Interstellar',
        synopsis: 'Test synopsis',
        ageRating: '12A',
        screeningTime: '169 mins',
        ticketPrice: 7.5,
        posterImagePath: 'assets/images/interstellar.jpeg',
      );

      expect(movie.formattedPrice, '£7.50');
    });

    test('formattedPrice shows whole pounds with two decimal places', () {
      const movie = Movie(
        id: 'oppenheimer',
        title: 'Oppenheimer',
        synopsis: 'Test synopsis',
        ageRating: '15',
        screeningTime: '180 mins',
        ticketPrice: 8,
        posterImagePath: 'assets/images/oppenheimer.jpeg',
      );

      expect(movie.formattedPrice, '£8.00');
    });
  });
}
