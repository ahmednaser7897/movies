

import '../../domain/entities/recommendations_movie.dart';

class RecommendationModel extends Recommendations {
  const RecommendationModel({super.backdropPath, required super.id});
  factory RecommendationModel.fromJason(Map<String, dynamic> json) {
    return RecommendationModel(
        backdropPath:
            json['backdrop_path'] ?? "/ta17TltHGdZ5PZz6oUD3N5BRurb.jpg",
        id: json['id']);
  }
}
