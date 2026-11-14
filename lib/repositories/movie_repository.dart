import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'interstellar',
        title: 'Interstellar',
        synopsis:
            'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
        ageRating: '12A',
        screeningTime: '169 mins',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/interstellar.jpeg',
      ),
      Movie(
        id: 'oppenheimer',
        title: 'Oppenheimer',
        synopsis:
            'The story of American scientist J. Robert Oppenheimer and his role in the development of the atomic bomb.',
        ageRating: '15',
        screeningTime: '180 mins',
        ticketPrice: 8.00,
        posterImagePath: 'assets/images/oppenheimer.jpeg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final Movie movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}
