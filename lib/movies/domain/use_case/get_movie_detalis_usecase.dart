import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/usecase/base_usecase.dart';
import 'package:clean_architecture/movies/domain/entities/movie_detail.dart';
import 'package:clean_architecture/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetail(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
