import '../entities/doc.dart';
import '../repos/favorites_repo.dart';

class LoadFavoritesUseCase {
  final FavoritesRepo _favoritesRepo;

  LoadFavoritesUseCase(this._favoritesRepo);

  Future<List<Doc>> getFavorites() async
  {
    final favorites = await _favoritesRepo.getFavorites();
    return favorites;
  }
}