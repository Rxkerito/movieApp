import 'package:practice/domain/entities/poster.dart';
import 'package:practice/domain/entities/rating.dart';

import 'external_id.dart';

class Doc {
  Doc({
    required this.externalId,
    required this.poster,
    required this.rating,
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.year,
    required this.movieLength,
  });

  ExternalId externalId;
  Poster poster;
  Rating rating;
  int id;
  String type;
  String name;
  String description;
  int year;
  int movieLength;

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    externalId: ExternalId.fromJson(json["externalId"]),
    poster: Poster.fromJson(json["poster"]),
    rating: Rating.fromJson(json["rating"]),
    id: json["id"],
    type: json["type"],
    name: json["name"] == null ? "null" : json["name"],
    description: json["description"] == null ? "null" : json["description"],
    year: json["year"] == null ? 0 : json["year"],
    movieLength: json["movieLength"] == null ? 0 : json["movieLength"],
  );

  Map<String, dynamic> toJson() => {
    "externalId": externalId.toJson(),
    "poster": poster.toJson(),
    "rating": rating.toJson(),
    "id": id,
    "type": type,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "year": year,
    "movieLength": movieLength == null ? null : movieLength,
  };
}