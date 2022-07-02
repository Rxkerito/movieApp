import 'package:practice/data/repos/favorites_repo.dart';
import 'package:practice/data/services/favorites_service.dart';
import 'package:practice/domain/repos/favorites_repo.dart';

class FavoritesRepoModule {
  late FavoritesService _favoritesService = FavoritesService();
  late FavoritesRepo _favoritesRepo = FavoritesRepoImpl(_favoritesService);

  FavoritesRepo favoritesRepo(){
    if (_favoritesRepo == null){
      _favoritesRepo = FavoritesRepoImpl(_favoritesService);
    }
    return _favoritesRepo;
  }

}