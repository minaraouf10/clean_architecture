import 'package:clean_architecture/movies/data/model/genre_model.dart';
import 'package:clean_architecture/movies/domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runTime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
    backdropPath: json['backdrop_path'],
    id: json['id'],
    overview: json['overview'],
    releaseDate: json['release_date'],
    runTime: json['runtime'],
    title: json['title'],
    voteAverage: json['vote_average'],
    genres: List<GenreModel>.from(json["genres"].map((e)=>GenreModel.fromJson(e))),
  );
}
