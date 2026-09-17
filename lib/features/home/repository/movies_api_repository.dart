
import '../model/movie_list_model.dart';

abstract class MoviesApiRepository {
  Future<MovieListModel> fetchMoviesList();
}
