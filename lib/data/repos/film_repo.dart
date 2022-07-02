import 'package:practice/domain/repos/film_repo.dart';
import 'package:practice/data/entities/film_dto.dart';
import '../../domain/entities/doc.dart';
import '../services/film_service.dart';

class FilmRepoImpl extends FilmRepo{
  final FilmService _filmService;

  FilmRepoImpl(this._filmService);

  Future<List<Doc>> getTopFilms() async{
    final res = await _filmService.getTopFilm();
    return res.map((e) => e.toModel()).toList();
  }

  @override
  Future<List<Doc>> getFilmByName(String text) async {
    final res = await _filmService.getFilmByName(text);
    return res.map((e) => e.toModel()).toList();
  }

  @override
  Future<List<Doc>> getNewFilms() async {
    final res = await _filmService.getNewFilms();
    return res.map((e) => e.toModel()).toList();
  }

  @override
  Future<List<Doc>> getFilmById(String id) async {
    final res = await _filmService.getFilmById(id);
    return res.map((e) => e.toModel()).toList();
  }
}