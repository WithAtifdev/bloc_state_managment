

import 'dependency_injection.dart';
import '../features/auth/repository/auth_api_repository.dart';
import '../features/auth/repository/auth_http_api_repository.dart';
import '../features/home/repository/movies_api_repository.dart';
import '../features/home/repository/movies_http_api_repository.dart';

class ServiceLocator {
  void servicesLocator() {
    getIt.registerLazySingleton<AuthApiRepository>(()
     => AuthHttpApiRepository()); 

    getIt.registerLazySingleton<MoviesApiRepository>(()
     => MoviesHttpApiRepository()); 
  }

}

