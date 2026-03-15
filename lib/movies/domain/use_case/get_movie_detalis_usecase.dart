import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/usecase/base_usecase.dart';
import 'package:clean_architecture/movies/domain/entities/movie_detail.dart';
import 'package:clean_architecture/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailUseCase extends BaseUseCase<MovieDetail,int> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(int parameters) async {
  return await baseMoviesRepository.getMovieDetail();
  }
}
