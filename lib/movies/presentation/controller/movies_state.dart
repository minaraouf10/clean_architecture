import 'package:clean_architecture/core/utils/enums.dart';
import 'package:clean_architecture/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable {
  final RequestsState nowPlayingState;
  final List<Movie> nowPlayingMovies;
  final String nowPlayingMessage;

  final RequestsState popularState;
  final List<Movie> popularMovies;
  final String popularMessage;

  final RequestsState topRatedState;
  final List<Movie> topRatedMovies;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingState = RequestsState.loading,
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage = '',
    this.popularState = RequestsState.loading,
    this.popularMovies = const [],
    this.popularMessage = '',
    this.topRatedState = RequestsState.loading,
    this.topRatedMovies = const [],
    this.topRatedMessage = '',
  });

  MoviesState copyWith({
    RequestsState? nowPlayingState,
    List<Movie>? nowPlayingMovies,
    String? nowPlayingMessage,

    RequestsState? popularState,
    List<Movie>? popularMovies,
    String? popularMessage,

    RequestsState? topRatedState,
    List<Movie>? topRatedMovies,
    String? topRatedMessage,
  }) {
    return MoviesState(
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularState: popularState ?? this.popularState,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage
    );
  }

  @override
  List<Object> get props =>
      [
        nowPlayingState,
        nowPlayingMovies,
        nowPlayingMessage,
        popularState,
        popularMovies,
        popularMessage,
        topRatedState,
        topRatedMovies,
        topRatedMessage,
      ];
}
