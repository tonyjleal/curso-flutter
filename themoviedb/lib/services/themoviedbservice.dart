import 'dart:convert';

import 'package:themoviedb/api/movie.dart';
import 'package:http/http.dart' as http;
import 'package:themoviedb/api/movies.dart';

class TheMovieDBService {
  static const String apiUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "e7b35d23e31e3f6e3026250ff7493827";

  static Future<List<Movie>> getTopRatedMovies() async {
    var url = "$apiUrl/movie/top_rated?api_key=$apiKey&language=es";

    final respuesta = await http.get(Uri.parse(url));

    if (respuesta.statusCode == 200) {
      final respuestaJSON = json.decode(respuesta.body);
      final peliculasMejorValoradas =
          Movies.fromJsonList(respuestaJSON["results"]);
      return peliculasMejorValoradas;
    }

    return <Movie>[];
  }
}
