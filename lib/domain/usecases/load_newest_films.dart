import 'package:practice/domain/repos/film_repo.dart';
import '../entities/doc.dart';

class LoadNewestFilmsUseCase {
  final FilmRepo _filmRepo;

  LoadNewestFilmsUseCase(this._filmRepo);

  Future<List<Doc>> loadNewestFilms() async
  {
    final films = await _filmRepo.getNewFilms();
    return films;
  }
}
