import 'package:clean_architecture/movies/data/data_source/movie_remote_data_source.dart';
import 'package:clean_architecture/movies/data/repository/movies_repository.dart';
import 'package:clean_architecture/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_architecture/movies/domain/use_case/get_movie_detalis_usecase.dart';
import 'package:clean_architecture/movies/domain/use_case/get_now_playing_movies_use_case.dart';
import 'package:clean_architecture/movies/domain/use_case/get_popular_movies_use_case.dart';
import 'package:clean_architecture/movies/domain/use_case/get_recommendation_use_case.dart';
import 'package:clean_architecture/movies/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:clean_architecture/movies/presentation/controller/movie_details_bloc.dart';
import 'package:clean_architecture/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));

    sl.registerFactory(() => MovieDetailsBloc(sl(),sl()));

    ///USE CASE
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));

    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));

    sl.registerLazySingleton(() => GetRecommendationUseCase(sl()));

    /// REPOSITORIES
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(sl()),
    );

    /// DAta sources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
