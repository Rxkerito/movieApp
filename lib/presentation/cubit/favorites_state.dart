
import 'package:practice/data/services/favorites_service.dart';
import 'package:practice/data/services/film_service.dart';

import '../../domain/entities/doc.dart';

abstract class FavoritesState {}

class UserNotLogged extends FavoritesState {

}

class FavoritesNotLoaded extends FavoritesState {
  FavoritesService favoritesService = new FavoritesService();
  FilmService filmService = new FilmService();

  Future<List<Doc>> getFavorites() async {
    return favoritesService.getFavorites();
  }
}

class  FavoritesLoaded extends FavoritesState {
  List<Doc> films;
  FilmService filmService;
  FavoritesService favoritesService;

  FavoritesLoaded({required this.films, required this.filmService, required this.favoritesService});

  List<Doc> getFavorites(){
    return this.films;
  }
}