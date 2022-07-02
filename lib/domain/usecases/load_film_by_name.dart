import 'package:practice/domain/repos/film_repo.dart';

import '../entities/doc.dart';
import '../entities/film.dart';

class LoadFilmByNameUseCase {
  final FilmRepo _filmRepo;

  LoadFilmByNameUseCase(this._filmRepo);

  Future<List<Doc>> loadFilmsByName(String text) async
  {
    final films = await _filmRepo.getFilmByName(text);
    return films;
  }
}
