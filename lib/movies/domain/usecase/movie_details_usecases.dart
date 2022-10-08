  
 import 'package:movies_app/core/erorr/extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/utils/base_use_case.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';

import '../repository/base_movie_repository.dart';

class MovieDetailsUseCase extends BaseUseCase<MovieDetails,int>{
  final BaseMovieRepository baseMovieRepository;

  MovieDetailsUseCase(this.baseMovieRepository);
  
  @override
  Future<Either<MovieDetails, Failure>> call(int parameter) async{
    return await baseMovieRepository.getMoivesDetails(parameter);
  }
}