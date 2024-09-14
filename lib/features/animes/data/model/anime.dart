// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Anime with EquatableMixin {
  final int? malId;
  final String? url;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final String? type;
  final String? source;
  final int? episodes;
  final String? status;
  final String? duration;
  final String? rating;
  final double? score;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final String synopsis;
  final String? background;
  final int? year;
  const Anime({
    this.malId,
    this.url,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    required this.synopsis,
    this.background,
    this.year,
  });

  Anime copyWith({
    int? malId,
    String? url,
    String? title,
    String? titleEnglish,
    String? titleJapanese,
    String? type,
    String? source,
    int? episodes,
    String? status,
    String? duration,
    String? rating,
    double? score,
    int? scoredBy,
    int? rank,
    int? popularity,
    String? synopsis,
    String? background,
    int? year,
  }) {
    return Anime(
      malId: malId ?? this.malId,
      url: url ?? this.url,
      title: title ?? this.title,
      titleEnglish: titleEnglish ?? this.titleEnglish,
      titleJapanese: titleJapanese ?? this.titleJapanese,
      type: type ?? this.type,
      source: source ?? this.source,
      episodes: episodes ?? this.episodes,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
      score: score ?? this.score,
      scoredBy: scoredBy ?? this.scoredBy,
      rank: rank ?? this.rank,
      popularity: popularity ?? this.popularity,
      synopsis: synopsis ?? this.synopsis,
      background: background ?? this.background,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'malId': malId,
      'url': url,
      'title': title,
      'titleEnglish': titleEnglish,
      'titleJapanese': titleJapanese,
      'type': type,
      'source': source,
      'episodes': episodes,
      'status': status,
      'duration': duration,
      'rating': rating,
      'score': score,
      'scoredBy': scoredBy,
      'rank': rank,
      'popularity': popularity,
      'synopsis': synopsis,
      'background': background,
      'year': year,
    };
  }

  factory Anime.fromMap(Map<String, dynamic> map) {
    return Anime(
      malId: map['malId'] != null ? map['malId'] as int : null,
      url: map['url'] != null ? map['url'] as String : null,
      title: map['title'] != null ? map['title'] as String : '',
      titleEnglish:
          map['titleEnglish'] != null ? map['titleEnglish'] as String : null,
      titleJapanese:
          map['titleJapanese'] != null ? map['titleJapanese'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
      episodes: map['episodes'] != null ? map['episodes'] as int : null,
      status: map['status'] != null ? map['status'] as String : null,
      duration: map['duration'] != null ? map['duration'] as String : null,
      rating: map['rating'] != null ? map['rating'] as String : null,
      score: map['score'] != null ? (map['score'] is int ? (map['score'] as int).toDouble() : map['score'] as double) : null,
      scoredBy: map['scoredBy'] != null ? map['scoredBy'] as int : null,
      rank: map['rank'] != null ? map['rank'] as int : null,
      popularity: map['popularity'] != null ? map['popularity'] as int : null,
      synopsis: map['synopsis'] != null ? map['synopsis'] as String : '',
      background:
          map['background'] != null ? map['background'] as String : null,
      year: map['year'] != null ? map['year'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Anime.fromJson(String source) =>
      Anime.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [];
  }
}
