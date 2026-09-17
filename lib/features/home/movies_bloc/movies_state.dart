
import 'package:equatable/equatable.dart';
import '../../../core/response/api_response.dart';
import '../model/movie_list_model.dart';

// Yahan state ke andar movies ka response store ho raha hai.
class MoviesState extends Equatable {
  final ApiResponse<MovieListModel> moviesList  ;
  const MoviesState({
    required this.moviesList ,
  }) ;
  MoviesState copyWith({ApiResponse<MovieListModel>? moviesList}) {
    return MoviesState(
      moviesList: moviesList ?? this.moviesList,
    );
  }
  @override
  List<Object?> get props => [moviesList];
}


