import 'package:api_fetch_data/features/holidays/data/model/holidays.dart';

abstract class HolidaysRepository {
  Future<List<Holiday>> fetchHolidays(String countryCode);
}
