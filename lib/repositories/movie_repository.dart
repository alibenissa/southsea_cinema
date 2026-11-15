import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;
  List<Movie> getMovies() {
    final List<Movie>? cachedMovies = _cachedMovies;
    if (cachedMovies != null) {
      return cachedMovies;
    }
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

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movie movie = Movie.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }
}
