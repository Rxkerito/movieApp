import '../../domain/entities/doc.dart';

class FilmDTO {
  final Doc doc;

  FilmDTO({required this.doc});

  factory FilmDTO.fromJSON(Map<String, dynamic> json) {

    Doc docs = Doc.fromJson(json);

    FilmDTO films = FilmDTO(doc: docs);
    return films;
  }
}

extension FilmMapper on FilmDTO {
  Doc toModel() {
    return Doc(
        externalId: doc.externalId,
        poster: doc.poster,
        rating: doc.rating,
        type: doc.type,
        name: doc.name,
        id: doc.id,
        description: doc.description,
        movieLength: doc.movieLength,
        year: doc.year);
  }
}
