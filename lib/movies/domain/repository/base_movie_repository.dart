
import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

import '../../../core/erorr/extensions.dart';
import '../entities/recommendations_movie.dart';
import '../usecase/get_recommendations_movie.dart';

abstract class BaseMovieRepository{
  Future<Either< List<Movie>,Failure >> getNowPlaying();
  Future<Either< List<Movie>,Failure >> getPopularMoives();
  Future<Either< List<Movie>,Failure >> getTopMoives();
  Future<Either< MovieDetails,Failure>> getMoivesDetails(int id);
  Future<Either< List<Recommendations>,Failure>> getRecommendationsMovies(
      RecommendationParameters parameters);
  
} 