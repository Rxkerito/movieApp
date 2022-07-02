import 'package:practice/application/repo_module.dart';
import 'package:practice/domain/usecases/load_film_by_id.dart';
import 'package:practice/domain/usecases/load_film_by_name.dart';
import 'package:practice/domain/usecases/load_newest_films.dart';
import 'package:practice/domain/usecases/load_top_films.dart';

class FilmModule {
  LoadNewestFilmsUseCase loadNewestFilmsUseCase() {
    final RepoModule _repoModule = RepoModule();
    return LoadNewestFilmsUseCase(_repoModule.filmRepo());
  }

  LoadTopFilmsUseCase loadTopFilmUseCase() {
    final RepoModule _repoModule = RepoModule();
    return LoadTopFilmsUseCase(_repoModule.filmRepo());
  }

  LoadFilmByNameUseCase loadFilmByNameUseCase() {
    final RepoModule _repoModule = RepoModule();
    return LoadFilmByNameUseCase(_repoModule.filmRepo());
  }

  LoadFilmByIdUseCase loadFilmByIdUseCase()
  {
    final RepoModule _repoModule = RepoModule();
    return LoadFilmByIdUseCase(_repoModule.filmRepo());
  }
}
