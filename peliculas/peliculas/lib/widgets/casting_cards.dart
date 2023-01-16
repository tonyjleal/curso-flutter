import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return StreamBuilder<Movie>(
        stream: null,
        builder: (context, snapshot) {
          return FutureBuilder(
              future: moviesProvider.getMovieCast(movieId),
              builder: ((_, snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox(
                      width: double.infinity,
                      height: 180,
                      child: Center(child: CircularProgressIndicator()));
                }

                final cast = snapshot.data!;

                return Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 180,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: ((_, index) => _CastCard(
                          actor: cast[index],
                        )),
                    scrollDirection: Axis.horizontal,
                  ),
                );
              }));
        });
  }
}

class _CastCard extends StatelessWidget {
  final Cast actor;

  const _CastCard({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: 110,
      height: 100,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            image: NetworkImage(actor.fullProfilePath),
            placeholder: const AssetImage('assets/no-image.jpg'),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          actor.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}
