import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/utils/enums.dart';
import 'package:clean_architecture/movies/domain/entities/movie_detail.dart';
import 'package:clean_architecture/movies/domain/use_case/get_movie_detalis_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailUseCase) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
  }

  final GetMovieDetailUseCase getMovieDetailUseCase;

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
}
