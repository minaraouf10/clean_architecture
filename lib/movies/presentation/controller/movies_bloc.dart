import 'package:clean_architecture/core/utils/enums.dart';
import 'package:clean_architecture/movies/domain/use_case/get_now_playing_movies_use_case.dart';
import 'package:clean_architecture/movies/domain/use_case/get_popular_movies_use_case.dart';
import 'package:clean_architecture/movies/domain/use_case/get_top_rated_movies_use_case.dart';
import 'package:clean_architecture/movies/presentation/controller/movies_event.dart';
import 'package:clean_architecture/movies/presentation/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold(
        (l) => emit(
          state.copyWith(
            nowPlayingState: RequestsState.error,
            nowPlayingMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            nowPlayingMovies: r,
            nowPlayingState: RequestsState.loaded,
          ),
        ),
      );
    });

    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUseCase.execute();

      result.fold(
        (l) => emit(
          state.copyWith(
            popularState: RequestsState.error,
            popularMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(popularMovies: r, popularState: RequestsState.loaded),
        ),
      );
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUseCase.execute();

      result.fold(
        (l) => emit(
          state.copyWith(
            topRatedState: RequestsState.error,
            topRatedMessage: l.message,
          ),
        ),
        (r) => emit(
          state.copyWith(
            topRatedMovies: r,
            topRatedState: RequestsState.loaded,
          ),
        ),
      );
    });
  }
}
