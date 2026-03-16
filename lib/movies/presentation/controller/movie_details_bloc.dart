import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/utils/enums.dart';
import 'package:clean_architecture/movies/domain/entities/movie_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsState()) {
    on<MovieDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
