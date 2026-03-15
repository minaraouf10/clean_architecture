import 'package:clean_architecture/movies/domain/entities/genres.dart';
import 'package:equatable/equatable.dart';

class MovieDetail extends Equatable {
  final String backdropPath;
  final int id;
  final String overview;
  final String releaseDate;
  final int runTime;
  final String title;
  final String voteAverage;
  final List<Genres> genres;


  const MovieDetail({
    required this.backdropPath,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.runTime,
    required this.title,
    required this.voteAverage,
    required this.genres,
  });

  @override
  List<Object> get props =>
      [backdropPath, id, overview, releaseDate, runTime, title, voteAverage,genres];
}
