
//https://api.themoviedb.org/3/movie/610150?api_key=47a5882632510c50e01d28853cd434c6
class AppConstant {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "ef0c112addee4a1604eee4b05ebfe1c6";

  static const String getNowPlayingMove =
      "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String getPopularMovies =
      "$baseUrl/movie/popular?api_key=$apiKey&page=1";
static const String getTopRatedMovies =
      "$baseUrl/movie/top_rated?api_key=$apiKey&page=1";

  static const String getUpcomingMovie =
      "$baseUrl/movie/upcoming?api_key=$apiKey";
  //
  static String getRefreshPopularMovie(int index) =>
      "$baseUrl/movie/popular?api_key=$apiKey&page=$index";
  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";
  //https://api.themoviedb.org/3/movie/610150/recommendations?api_key=47a5882632510c50e01d28853cd434c6
  static String recommendationsMoviePath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  //get movie cast
  static String getMovieCastPath(int movieId) =>
      "$baseUrl/movie/$movieId/credits?api_key=$apiKey&&language=en-US";
  // deteils about actor
  static String getActorDetailsPath(int actorId) =>
      "$baseUrl/person/$actorId?api_key=$apiKey&&language=en-US";
  static String getActorMovieCreditsPath(int actorId) =>
      "$baseUrl/person/$actorId/movie_credits?api_key=$apiKey&&language=en-US";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => '$baseImageUrl$path';
}