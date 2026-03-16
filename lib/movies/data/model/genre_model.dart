import 'package:clean_architecture/movies/domain/entities/genres.dart';

class GenreModel extends Genres {
 const GenreModel({required super.name, required super.id});

 factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
   name: json['name'],
   id: json['id'],
 );
}
