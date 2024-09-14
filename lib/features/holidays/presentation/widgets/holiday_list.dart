// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../data/model/holidays.dart';
import '../screens/holiday_details_screen.dart';

class HolidayList extends StatelessWidget {
  const HolidayList({
    super.key,
    required this.holidays,
  });

  final List<Holiday> holidays;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final holiday = holidays[index];
        return ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HolidayDetailsScreen(holiday: holiday),
              ),
            );
          },
          leading: CircleAvatar(
            child: Text(holiday.countryCode),
          ),
          title: Text(holiday.name),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: holidays.length,
    );
  }
}
