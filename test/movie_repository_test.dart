import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains valid Interstellar and Oppenheimer films', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie interstellar = movies[0];
      expect(interstellar.id, 'interstellar');
      expect(interstellar.title, 'Interstellar');
      expect(interstellar.ageRating, '12A');
      expect(interstellar.ticketPrice, 7.50);
      expect(interstellar.posterImagePath, isNotEmpty);

      final Movie oppenheimer = movies[1];
      expect(oppenheimer.id, 'oppenheimer');
      expect(oppenheimer.title, 'Oppenheimer');
      expect(oppenheimer.ageRating, '15');
      expect(oppenheimer.ticketPrice, 8.00);
      expect(oppenheimer.posterImagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('oppenheimer');

      expect(movie, isNotNull);
      expect(movie?.title, 'Oppenheimer');
      expect(movie?.ticketPrice, 8.00);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
    test('loadMoviesFromAsset reads every film from the JSON file', () async {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = await repository.loadMoviesFromAsset();

      expect(movies.length, 2);
      expect(movies[0].id, 'interstellar');
      expect(movies[0].title, 'Interstellar');
      expect(movies[0].ticketPrice, 7.50);
      expect(movies[1].id, 'oppenheimer');
      expect(movies[1].title, 'Oppenheimer');
      expect(movies[1].ticketPrice, 8.00);
      expect(repository.getMovies(), movies);
    });
  });
}
