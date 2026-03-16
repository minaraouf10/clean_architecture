import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/movies/domain/entities/movie.dart';
import 'package:clean_architecture/movies/domain/entities/movie_detail.dart';
import 'package:clean_architecture/movies/domain/use_case/get_movie_detalis_usecase.dart';
import 'package:dartz/dartz.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();

  Future<Either<Failure,List<Movie>>> getPopularMovies();

  Future<Either<Failure,List<Movie>>> getTopRatedMovies();

  Future<Either<Failure,MovieDetail>> getMovieDetail(MovieDetailsParameters parameters);

}