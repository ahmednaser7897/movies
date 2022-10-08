// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieState {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessege;
  final List<Movie> topMovies;
  final RequestState topState;
  final String topMessege;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessege;
  MovieState({
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessege = '',
    this.topMovies = const [],
    this.topState = RequestState.loading,
    this.topMessege = '',
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessege = '',
  });
  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessege,
    List<Movie>? topMovies,
    RequestState? topState,
    String? topMessege,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessege,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMessege: nowPlayingMessege ?? this.nowPlayingMessege,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMessege: popularMessege ?? this.popularMessege,
      popularState: popularState ?? this.popularState,
      topMovies: topMovies ?? this.topMovies,
      topMessege: topMessege ?? this.topMessege,
      topState: topState ?? this.topState,
    );
  }
}
