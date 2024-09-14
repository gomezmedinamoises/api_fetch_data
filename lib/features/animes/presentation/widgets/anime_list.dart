// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_fetch_data/features/animes/data/model/anime.dart';
import 'package:flutter/material.dart';

class AnimeList extends StatelessWidget {
  const AnimeList({
    super.key,
    required this.animeList,
  });

  final List<Anime> animeList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {

        final anime = animeList[index];
        return ListTile(
          onTap: () {
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => HolidayDetailsScreen(holiday: holiday),
            //   ),
            // );
          },
          leading: CircleAvatar(
            child: Text(anime.score.toString()),
          ),
          title: Text(anime.title),
          subtitle: Text(anime.synopsis, maxLines: 3, overflow: TextOverflow.ellipsis,),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: animeList.length,
    );
  }
}
