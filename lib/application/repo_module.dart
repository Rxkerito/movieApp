import 'package:practice/data/repos/film_repo.dart';
import 'package:practice/data/services/film_service.dart';
import 'package:practice/domain/repos/film_repo.dart';

class RepoModule {
  late FilmService _filmService = FilmService();
  late FilmRepo _filmRepo = FilmRepoImpl(_filmService);

  FilmRepo filmRepo(){
    if (_filmRepo == null){
      _filmRepo = FilmRepoImpl(_filmService);
    }
    return _filmRepo;
  }

}