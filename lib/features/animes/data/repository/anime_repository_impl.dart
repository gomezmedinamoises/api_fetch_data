import 'package:api_fetch_data/features/animes/data/model/anime.dart';
import 'package:api_fetch_data/features/animes/domain/repository/anime_repository.dart';
import 'package:dio/dio.dart';

class AnimeRepositoryImpl implements AnimeRepository {
  @override
  Future<List<Anime>> fetchAnimeList() async {
    try {
      final Response response =
          await Dio().get('https://api.jikan.moe/v4/anime');

      final animeDataList = response.data['data'];

      final result = [for (final anime in animeDataList) Anime.fromMap(anime)];

      return result;
    } catch (e) {
      rethrow;
    }
  }
}