import 'dart:async';

import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/entities/recommendations_movie.dart';
import '../../../domain/usecase/get_recommendations_movie.dart';
import '../../../domain/usecase/movie_details_usecases.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  // call use cae
  final MovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationMovie getRecommendationMovie;
  //final GetActorsMovieUseCase getActorsMovieUseCase;
  MovieDetailsBloc(
    this.getMovieDetailsUseCase,
    this.getRecommendationMovie,
    //this.getActorsMovieUseCase,
  ) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendations);
    //on<GetActorsMovieEvent>(_getActors);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase
        .call(event.id);
    result.fold(
      (l) {
       
        emit(
        state.copyWith(
          movieDetailsState: RequestState.loaded,
          movieDetails: l,
        ),
      );
      },
      (r) => emit(
         state.copyWith(
          movieDetailsMessage: r.messege,
          movieDetailsState: RequestState.erorr,
        ),
       
      ),
    );
  }

  FutureOr<void> _getRecommendations(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationMovie.call(
      RecommendationParameters(id: event.id),
    );
    result.fold(
      (l) {
       
        emit(
        state.copyWith(
          recommendationsState: RequestState.loaded,
          recommendations: l,
        ),
      );
      },
      (r) => emit(state.copyWith(
        recommendationsState: RequestState.erorr,
        recommendationsMessage: r.messege,
      )),
    );
  }
/*
  FutureOr<void> _getActors(
      GetActorsMovieEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getActorsMovieUseCase.call(ActorsParameters(movieId: event.id));
    result.fold(
      (l) => emit(state.copyWith(
        actorsState: RequestState.error,
        actorsMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          actorsState: RequestState.loaded,
          actorsList: r,
        ),
      ),
    );
  }*/
}