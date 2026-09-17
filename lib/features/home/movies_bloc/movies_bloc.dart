
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../core/response/api_response.dart';
import '../repository/movies_api_repository.dart';
import 'movie_events.dart';
import 'movies_state.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesApiRepository moviesApiRepository;
  MoviesBloc({required this.moviesApiRepository}) : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetch>(fetchMoviesListApi);
  }

  Future<void> fetchMoviesListApi(MoviesFetch event, Emitter<MoviesState> emit) async {
    await moviesApiRepository.fetchMoviesList().then((response) {
      emit(state.copyWith(moviesList: ApiResponse.completed(response)));
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(stackTrace);
        print(error);
      }
      emit(state.copyWith(
        moviesList: ApiResponse.error(error.toString()),
      ));
    });
  }
}
