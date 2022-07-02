import 'package:practice/domain/entities/doc.dart';
import 'package:practice/domain/repos/film_repo.dart';

import '../entities/film.dart';

class LoadTopFilmsUseCase {
  final FilmRepo _filmRepo;

  LoadTopFilmsUseCase(this._filmRepo);

  Future<List<Doc>> loadTopFilms() async
  {
    final films = await _filmRepo.getTopFilms();
    return films;
  }
}
