import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/usecase/base_usecase.dart';
import 'package:clean_architecture/movies/domain/entities/movie.dart';
import 'package:clean_architecture/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters> {
  BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);
@override
  Future<Either<Failure,List<Movie>>> call(parameters) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}