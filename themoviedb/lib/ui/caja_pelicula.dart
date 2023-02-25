import 'package:flutter/material.dart';
import 'package:themoviedb/api/movie.dart';
import 'package:themoviedb/ui/pelicula.dart';

class CajaPelicula extends StatelessWidget {
  Movie peli;

  CajaPelicula({required this.peli});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(peli.title),
      subtitle: Text('${peli.voteAverage} (${peli.voteCount})'),
      trailing: Image.network(peli.getImage()),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Pelicula(movie: peli)));
      },
    );
  }
}
