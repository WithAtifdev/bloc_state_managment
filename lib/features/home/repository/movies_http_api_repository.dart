import '../../../core/network/network_api_services.dart';
import '../../../core/res/constants/app_url.dart';
import '../model/movie_list_model.dart';
import 'movies_api_repository.dart';


class MoviesHttpApiRepository implements MoviesApiRepository {
  final _apiServices = NetworkApiService();
  @override
  Future<MovieListModel> fetchMoviesList() async {
    final response = await _apiServices.getApi(AppUrl.popularMoviesListEndPoint);
    return MovieListModel.fromJson(response);
  }
}
