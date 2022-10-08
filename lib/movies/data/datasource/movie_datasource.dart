// ignore_for_file: avoid_print

import 'package:movies_app/core/network/erorr_messege.dart';
import 'package:movies_app/core/utils/app_constance.dart';
import 'package:movies_app/core/network/dio_helper.dart';
import 'package:movies_app/movies/data/models/movie_details_model.dart';
import 'package:movies_app/movies/data/models/movies_model.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';


import '../../../core/erorr/extensions.dart';
import '../../domain/entities/recommendations_movie.dart';
import '../../domain/usecase/get_recommendations_movie.dart';
import '../models/recommendation_model.dart';
abstract class BaseMovieDataSource{
  Future<List<Movie>>getNowPlaying();
  Future<List<Movie>>getPopularMoives();
  Future<List<Movie>>getTopMoives();
  Future<MovieDetails>getMoivesDetails(int id);
  Future<List<Recommendations>> getRecommendationsMovie(RecommendationParameters parameters);
  
} 
class MovieDataSource extends BaseMovieDataSource {
  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final results = await DioHelper.getData(url: AppConstant.getNowPlayingMove);
    if (results.statusCode == 200) {
      return List<MovieModel>.from(
          (results.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      print("Erorr getNowPlaying");
      throw ServerExtension(ErorrMessegeModel.fromMap(results.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMoives() async{
     final results = await DioHelper.getData(url: AppConstant.getPopularMovies);

    if (results.statusCode == 200) {
      return List<MovieModel>.from(
          (results.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      print("Erorr getNowPlaying");
      throw ServerExtension(ErorrMessegeModel.fromMap(results.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopMoives() async{
     final results = await DioHelper.getData(url: AppConstant.getTopRatedMovies);
    
    if (results.statusCode == 200) {
      return List<MovieModel>.from(
          (results.data['results'] as List).map((e) => MovieModel.fromJson(e)));
    } else {
      print("Erorr getNowPlaying");
      throw ServerExtension(ErorrMessegeModel.fromMap(results.data));
    }
  }
  
  @override
  Future<MovieDetails> getMoivesDetails(int id) async{
     final results = await DioHelper.getData(url: AppConstant.movieDetailsPath(id));
    if (results.statusCode == 200) {
      return MovieDetailsModel.fromJason(results.data);
    } else {
      print("Erorr getMoivesDetails");
      throw ServerExtension(ErorrMessegeModel.fromMap(results.data));
    }
  }
  @override
  Future<List<Recommendations>> getRecommendationsMovie(
    RecommendationParameters parameters,
  ) async {
    final response =
        await DioHelper.getData(url:AppConstant.recommendationsMoviePath(parameters.id));
    if (response.statusCode == 200) {
      return List<Recommendations>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJason(e)));
    } else {
      throw ServerExtension(
           ErorrMessegeModel.fromJson(response.data));
    }
  }
}
