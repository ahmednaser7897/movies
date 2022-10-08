import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../../../core/erorr/extensions.dart';
import '../../../core/utils/base_use_case.dart';

class GetNowPlayingUseCase extends BaseUseCase< List<Movie>,NoParameters>{
  final BaseMovieRepository baseMovieRepository;
  GetNowPlayingUseCase(this.baseMovieRepository);

  
  @override
  Future<Either< List<Movie>,Failure >> call(NoParameters parameter) async{
    return await baseMovieRepository.getNowPlaying();
  }
}