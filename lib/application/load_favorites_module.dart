import 'package:practice/application/favorites_repo_module.dart';
import 'package:practice/domain/usecases/load_favorites.dart';

import '../domain/entities/doc.dart';

class LoadFavoritesModule {
  late List<Doc> _favoriteFilms;

  LoadFavoritesModule(){
    this.getFavorites();
  }

  getFavorites() async {
    this._favoriteFilms = await this.loadFavoritesUseCase().getFavorites();
  }

  LoadFavoritesUseCase loadFavoritesUseCase() {
    final FavoritesRepoModule _favoritesRepoModule = FavoritesRepoModule();
    return LoadFavoritesUseCase(_favoritesRepoModule.favoritesRepo());
  }
}