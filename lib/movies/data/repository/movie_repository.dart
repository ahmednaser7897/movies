
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/erorr/extensions.dart';
import 'package:movies_app/movies/data/datasource/movie_datasource.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../../domain/entities/recommendations_movie.dart';
import '../../domain/usecase/get_recommendations_movie.dart';

class MovieRepository extends BaseMovieRepository{
  final BaseMovieDataSource baseMovieDataSource;

  MovieRepository(this.baseMovieDataSource);
  @override
  Future<Either< List<Movie>,Failure >> getNowPlaying() async {
    try{
      final result =await baseMovieDataSource.getNowPlaying();
      return left(result);
    }on ServerExtension catch(e){
      return Right(ServerFailure(e.erorrMessegeModel.statusMessege));
    } 
  }
  
  @override
  Future<Either<List<Movie>, Failure>> getPopularMoives() async{
     try{
      final result =await baseMovieDataSource.getPopularMoives();
      return left(result);
    }on ServerExtension catch(e){
      return Right(ServerFailure(e.erorrMessegeModel.statusMessege));
    } 
  }
  
  @override
  Future<Either<List<Movie>, Failure>> getTopMoives() async{
    try{
      final result =await baseMovieDataSource.getTopMoives();
      return left(result);
    }on ServerExtension catch(e){ 
      return Right(ServerFailure(e.erorrMessegeModel.statusMessege));
    } 
  }
  
  @override
  Future<Either<MovieDetails, Failure>> getMoivesDetails(int id)async {
     try{
      final result =await baseMovieDataSource.getMoivesDetails(id);
      return left(result);
    }on ServerExtension catch(e){
      return Right(ServerFailure(e.erorrMessegeModel.statusMessege));
    } 
  }
  
   @override
  Future<Either< List<Recommendations>,Failure>> getRecommendationsMovies(
      RecommendationParameters parameters) async {
   
    try {
       final result =
        await baseMovieDataSource.getRecommendationsMovie(parameters);
      return left(result);
    } on ServerExtension catch (failure) {
      return right(
          ServerFailure( failure.erorrMessegeModel.statusMessege));
    }
  }

 
}