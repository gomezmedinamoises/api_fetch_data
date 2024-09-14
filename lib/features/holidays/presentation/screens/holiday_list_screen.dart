import 'package:api_fetch_data/features/holidays/data/repository/holidays_repository_impl.dart';
import 'package:api_fetch_data/features/holidays/domain/repository/holidays_repository.dart';
import 'package:flutter/material.dart';

import '../../data/model/holidays.dart';
import '../widgets/holiday_list.dart';

class HolidayListScreen extends StatefulWidget {
  const HolidayListScreen({super.key});

  @override
  State<HolidayListScreen> createState() => _HolidayListScreenState();
}

class _HolidayListScreenState extends State<HolidayListScreen> {
  List<Holiday> holidays = [];
  String error = '';
  bool loading = false;

  final List<Map<String, String>> countries = [
    {'name': 'United States', 'code': 'US'},
    {'name': 'Venezuela', 'code': 'VE'},
    {'name': 'Colombia', 'code': 'CO'},
    {'name': 'Mexico', 'code': 'MX'},
    {'name': 'Argentina', 'code': 'AR'},
    {'name': 'Costa Rica', 'code': 'CR'},
  ];

  String selectedCountryCode = 'US';

  @override
  void initState() {
    super.initState();
    _fetchHolidays();
  }

  void _fetchHolidays() async {
    try {
      final HolidaysRepository holidaysRepository = HolidaysRepositoryImpl();
      setState(() => loading = true);
      holidays = await holidaysRepository.fetchHolidays(selectedCountryCode);
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
        title: const Text('Holidays'),
        actions: [
          DropdownButton(
            value: selectedCountryCode,
            items: countries.map((country) {
              return DropdownMenuItem(
                value: country['code'],
                child: Text(country['name']!),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedCountryCode = newValue!;
                _fetchHolidays();
              });
            },
          )
        ],
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : error.isEmpty
              ? HolidayList(holidays: holidays)
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
              onPressed: _fetchHolidays,
              child: const Text('Retry'),
            )
          ],
        ),
      ),
    );
  }
}
