import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/usecase/base_usecase.dart';
import 'package:clean_architecture/movies/domain/entities/movie.dart';
import 'package:clean_architecture/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);
@override
  Future<Either<Failure,List<Movie>>> call(parameters) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
