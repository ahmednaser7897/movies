// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  String backdropPath="" ;
  List<int> genreIds = [];
  int id = 0;
  String overview = "";
  String title = "";
  double voteAverage = 0;
  String releaseDate="";

  Movie({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
  });

  
  @override
  List<Object?> get props =>
      [id, title, genreIds, backdropPath, overview, voteAverage,releaseDate];
}
