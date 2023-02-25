import 'package:flutter/material.dart';
import 'package:themoviedb/api/movie.dart';

class Pelicula extends StatelessWidget {
  Movie movie;

  Pelicula({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: <Widget>[
          Image.network(movie.getImage()),
          Text(movie.overview)
        ],
      ),
    );
  }
}
