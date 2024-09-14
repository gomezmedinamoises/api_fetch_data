// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../data/model/holidays.dart';

class HolidayDetailsScreen extends StatelessWidget {
  const HolidayDetailsScreen({
    super.key,
    required this.holiday,
  });

  final Holiday holiday;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(holiday.name),
      ),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Local Name: ${holiday.localName}'),
                Text('Name: ${holiday.name}'),
                Text('Date: ${holiday.date}'),
                Text('Country: ${holiday.countryCode}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
