import 'package:api_fetch_data/features/holidays/presentation/screens/holiday_list_screen.dart';
import 'package:flutter/material.dart';

import '../../animes/presentation/screens/anime_list_screen.dart';
import '../presentation/widgets/custom_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: const [
            CustomButton(title: 'Holidays', child: HolidayListScreen()),
            CustomButton(title: 'Anime List', child: AnimeListScreen())
          ],
        ),
      ),
    );
  }
}
