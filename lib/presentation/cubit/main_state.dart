import 'package:practice/application/film_module.dart';
import 'package:practice/domain/entities/doc.dart';
import 'package:practice/domain/usecases/load_film_by_name.dart';
import 'package:practice/domain/usecases/load_newest_films.dart';
import 'package:practice/domain/usecases/load_top_films.dart';

abstract class MainState {}

class MainWelcomeNotLoadedState extends MainState {
  late FilmModule _filmModule;
  late LoadTopFilmsUseCase loadTopFilmsUseCase;
  late LoadNewestFilmsUseCase loadNewestFilmsUseCase;

  MainWelcomeNotLoadedState() {
    this._filmModule = new FilmModule();
    this.loadTopFilmsUseCase = _filmModule.loadTopFilmUseCase();
    this.loadNewestFilmsUseCase = _filmModule.loadNewestFilmsUseCase();
  }

  Future<List<Doc>> getTopFilms() {
    return loadTopFilmsUseCase.loadTopFilms();
  }

  Future<List<Doc>> getNewestFilms() {
    return loadNewestFilmsUseCase.loadNewestFilms();
  }



  LoadFilmByNameUseCase getLoadFilmsByNameUseCase()
  {
    return _filmModule.loadFilmByNameUseCase();
  }
}

class MainWelcomeLoadedState extends MainState {
  List<Doc> films;
  List<Doc> newestFilms;

  LoadFilmByNameUseCase loadFilmByNameUseCase;

  MainWelcomeLoadedState({required this.films, required this.newestFilms, required this.loadFilmByNameUseCase});

  List<Doc> getTopFilms() {
    return films;
  }

  List<Doc> getNewestFilms() {
    return newestFilms;
  }

  Future<List<Doc>> getFilmsByName(String text) async {
    return loadFilmByNameUseCase.loadFilmsByName(text);
  }
}

class MainSearchLoadedState extends MainState {
  List<Doc> films;

  MainSearchLoadedState({required this.films});

  List<Doc> getFilmsByName(){
    return films;
  }
}
