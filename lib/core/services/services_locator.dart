
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_datasource.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_moives_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_moives_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

import '../../movies/domain/usecase/get_recommendations_movie.dart';
import '../../movies/domain/usecase/movie_details_usecases.dart';
import '../../movies/presentation/controller/bloc/movie_details_bloc.dart';


final sl = GetIt.instance;

class ServicesLocator {
  void init() {
  sl.registerFactory(() => MovieBloc());
   sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

  
  //use case
   sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
   sl.registerLazySingleton(() => GetPopularMoivesUseCase(sl()));
   sl.registerLazySingleton(() => GetTopMoivesUseCase(sl()));
   sl.registerLazySingleton(() => MovieDetailsUseCase(sl()));
   sl.registerLazySingleton(() => GetRecommendationMovie(sl()));
  //repo
   sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
  //data source
   sl.registerLazySingleton<BaseMovieDataSource>(() => MovieDataSource());
  }
}