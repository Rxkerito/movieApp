import 'package:practice/data/services/favorites_service.dart';
import 'package:practice/domain/repos/favorites_repo.dart';

import '../../domain/entities/doc.dart';

class FavoritesRepoImpl extends FavoritesRepo{
  final FavoritesService _favoritesService;

  FavoritesRepoImpl(this._favoritesService);

  Future<List<Doc>> getFavorites() async{
    final res = await _favoritesService.getFavorites();
    return res;
  }
}