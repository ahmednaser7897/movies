import 'package:equatable/equatable.dart';

import 'package:dartz/dartz.dart';


import '../../../core/erorr/extensions.dart';
import '../../../core/utils/base_use_case.dart';
import '../entities/recommendations_movie.dart';
import '../repository/base_movie_repository.dart';

class GetRecommendationMovie
    extends BaseUseCase<List<Recommendations>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetRecommendationMovie(this.baseMovieRepository);
  @override
  Future<Either< List<Recommendations>,Failure>> call(
      RecommendationParameters parameter) async {
    return await baseMovieRepository.getRecommendationsMovies(parameter);
  }
}

class RecommendationParameters extends Equatable {
  final int id;
  const RecommendationParameters({required this.id});

  @override
  List<Object?> get props => [id];
}
