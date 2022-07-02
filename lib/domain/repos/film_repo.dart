import 'package:practice/domain/entities/film.dart';

import '../entities/doc.dart';

abstract class FilmRepo{
  Future<List<Doc>> getTopFilms();

  Future<List<Doc>> getNewFilms();

  Future<List<Doc>> getFilmByName(String text);

  Future<List<Doc>> getFilmById(String id);
}