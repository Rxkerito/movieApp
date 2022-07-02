import 'package:practice/domain/repos/film_repo.dart';
import '../entities/doc.dart';

class LoadFilmByIdUseCase {
  final FilmRepo _filmRepo;

  LoadFilmByIdUseCase(this._filmRepo);

  Future<List<Doc>> loadFilmsById(String id) async
  {
    final films = await _filmRepo.getFilmById(id);
    return films;
  }
}
