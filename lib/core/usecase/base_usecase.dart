import 'package:clean_architecture/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<T, Parameters> {
  Future <Either<Failure, T>> call(Parameters parameters);
}

class NoParameters {
  const NoParameters();

  List<Object> get props => [];
}