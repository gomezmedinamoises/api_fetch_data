import 'package:api_fetch_data/data/model/holidays.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/holidays_repository.dart';

class HolidaysRepositoryImpl implements HolidaysRepository {
  @override
  Future<List<Holiday>> fetchHolidays(String countryCode) async {
    try {
      final Response response = await Dio()
          .get('https://date.nager.at/api/v2/publicholidays/2020/$countryCode');
      final holidaysList = response.data;
      final holidays = [
        for (final holiday in holidaysList) Holiday.fromMap(holiday)
      ];
      return holidays;
    } catch (e) {
      rethrow;
    }
  }
}
