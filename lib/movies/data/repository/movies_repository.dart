import 'package:clean_architecture/core/error/exception.dart';
import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/movies/data/data_source/movie_remote_data_source.dart';
import 'package:clean_architecture/movies/domain/entities/movie.dart';
import 'package:clean_architecture/movies/domain/entities/movie_detail.dart';
import 'package:clean_architecture/movies/domain/entities/recommendation.dart';
import 'package:clean_architecture/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_architecture/movies/domain/use_case/get_movie_detalis_usecase.dart';
import 'package:clean_architecture/movies/domain/use_case/get_recommendation_use_case.dart';
import 'package:dartz/dartz.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies()async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();

  try {
    return Right(result);
  }on ServerException catch (e) {
    return Left(ServerFailure(e.errorMessageModel.statusMessage));
  }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(MovieDetailsParameters parameters) async{
  final result =await baseMovieRemoteDataSource.getMovieDetails(parameters);

  try{
    return Right(result);
  }on ServerException catch (failure){
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
  }

  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(RecommendationParameters parameters)async {
    final result =
    await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
    return Right(result);
    } on ServerException catch (failure) {
    return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }
}
