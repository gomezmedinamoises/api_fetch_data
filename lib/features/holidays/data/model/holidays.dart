import 'dart:convert';

import 'package:equatable/equatable.dart';

class Holiday with EquatableMixin {
  final String date;
  final String localName;
  final String name;
  final String countryCode;
  final bool fixed;
  final bool global;
  final String type;
  const Holiday({
    required this.date,
    required this.localName,
    required this.name,
    required this.countryCode,
    required this.fixed,
    required this.global,
    required this.type,
  });

  Holiday copyWith({
    String? date,
    String? localName,
    String? name,
    String? countryCode,
    bool? fixed,
    bool? global,
    String? type,
  }) {
    return Holiday(
      date: date ?? this.date,
      localName: localName ?? this.localName,
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
      fixed: fixed ?? this.fixed,
      global: global ?? this.global,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'localName': localName,
      'name': name,
      'countryCode': countryCode,
      'fixed': fixed,
      'global': global,
      'type': type,
    };
  }

  factory Holiday.fromMap(Map<String, dynamic> map) {
    return Holiday(
      date: map['date'] as String,
      localName: map['localName'] as String,
      name: map['name'] as String,
      countryCode: map['countryCode'] as String,
      fixed: map['fixed'] as bool,
      global: map['global'] as bool,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Holiday.fromJson(String source) =>
      Holiday.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      date,
      localName,
      name,
      countryCode,
      fixed,
      global,
      type,
    ];
  }
}
