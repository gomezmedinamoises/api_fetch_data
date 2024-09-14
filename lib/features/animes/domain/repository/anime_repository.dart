import 'package:api_fetch_data/features/animes/data/model/anime.dart';

abstract class AnimeRepository {
  Future<List<Anime>> fetchAnimeList();
}
