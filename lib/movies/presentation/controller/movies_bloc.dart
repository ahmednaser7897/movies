import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/base_use_case.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_moives_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_moives_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:movies_app/movies/presentation/controller/movies_states.dart';
import '../../../core/services/services_locator.dart';
import '../../domain/usecase/get_now_playing_usecase.dart';

class MovieBloc extends Bloc<MovieEvient, MovieState> {
  MovieBloc() : super(MovieState()) {
    on<GetNowPlaying>(getNowPlaying);
    on<GetPopularMoives>(getPopularMoives);
    on<GetTopMoives>(getTopMoives);
  }

  FutureOr<void> getTopMoives(event, emit) async {
    var ruselt = await GetTopMoivesUseCase(sl())(const NoParameters());
    //print(ruselt);
    ruselt.fold((l) {
      emit(state.copyWith(topState: RequestState.loaded, topMovies: l));
    }, (r) {
      emit(state.copyWith(topMessege: r.messege, topState: RequestState.erorr));
    });
  }

  FutureOr<void> getPopularMoives(event, emit) async {
    var ruselt = await GetPopularMoivesUseCase(sl())(const NoParameters());
    //print(ruselt);
    ruselt.fold((l) {
      emit(state.copyWith(popularState: RequestState.loaded, popularMovies: l));
    }, (r) {
      emit(state.copyWith(
          popularMessege: r.messege, popularState: RequestState.erorr));
    });
  }

  FutureOr<void> getNowPlaying(event, emit) async {
    var ruselt = await GetNowPlayingUseCase(sl())(const NoParameters());
    //print(ruselt);
    ruselt.fold((l) {
      emit(state.copyWith(
          nowPlayingState: RequestState.loaded, nowPlayingMovies: l));
    }, (r) {
      emit(state.copyWith(
          nowPlayingMessege: r.messege, nowPlayingState: RequestState.erorr));
    });
  }
}
