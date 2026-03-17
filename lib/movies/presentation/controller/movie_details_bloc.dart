import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/utils/enums.dart';
import 'package:clean_architecture/movies/domain/entities/movie_detail.dart';
import 'package:clean_architecture/movies/domain/entities/recommendation.dart';
import 'package:clean_architecture/movies/domain/use_case/get_movie_detalis_usecase.dart';
import 'package:clean_architecture/movies/domain/use_case/get_recommendation_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailUseCase, this.getRecommendationUseCase) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRecommendationEvent>(_getRecommendationsEvent);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetailsEvent(
    GetMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    final result = await getMovieDetailUseCase(
      MovieDetailsParameters(movieId: event.id),
    );

    return result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestsState.error,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(movieDetail: r, movieDetailsState: RequestsState.loaded),
      ),
    );
  }

  FutureOr<void> _getRecommendationsEvent(GetMovieRecommendationEvent event, Emitter<MovieDetailsState> emit)async {

  final result = await getRecommendationUseCase(RecommendationParameters(id: event.id));

  return result.fold(
        (l) => emit(
      state.copyWith(
        recommendationState: RequestsState.error,
        recommendationMessage: l.message,
      ),
    ),
        (r) => emit(
      state.copyWith(recommendation: r, recommendationState: RequestsState.loaded),
    ),
  );

  }
}
