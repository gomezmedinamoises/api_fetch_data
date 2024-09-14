import 'package:api_fetch_data/features/animes/data/model/anime.dart';
import 'package:api_fetch_data/features/animes/presentation/widgets/anime_list.dart';
import 'package:flutter/material.dart';

import '../../data/repository/anime_repository_impl.dart';
import '../../domain/repository/anime_repository.dart';

class AnimeListScreen extends StatefulWidget {
  const AnimeListScreen({super.key});

  @override
  State<AnimeListScreen> createState() => _AnimeListScreenState();
}

class _AnimeListScreenState extends State<AnimeListScreen> {
  List<Anime> animeList = [];
  String error = '';
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _fetchAnimeList();
  }

  void _fetchAnimeList() async {
    try {
      final AnimeRepository animeRepository = AnimeRepositoryImpl();
      setState(() => loading = true);
      animeList = await animeRepository.fetchAnimeList();
      error = '';
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime List'),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : error.isEmpty
              ? AnimeList(animeList: animeList)
              : _buildError(),
    );
  }

  Widget _buildError() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: _fetchAnimeList,
              child: const Text('Retry'),
            )
          ],
        ),
      ),
    );
  }
}
