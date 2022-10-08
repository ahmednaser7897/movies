// ignore_for_file: must_be_immutable

import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.backdropPath,
      required super.genreIds,
      required super.id,
      required super.overview,
      required super.title,
      required super.voteAverage,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      overview: json['overview'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['release_date'] = releaseDate;
    data['overview'] = overview;

    data['title'] = title;

    data['vote_average'] = voteAverage;

    return data;
  }
}
