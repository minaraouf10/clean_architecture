import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/usecase/base_usecase.dart';
import 'package:clean_architecture/movies/domain/entities/recommendation.dart';
import 'package:clean_architecture/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
    RecommendationParameters parameters,
  ) async {
 return await  baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];
}
