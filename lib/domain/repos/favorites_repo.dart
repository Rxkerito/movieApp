import 'package:practice/domain/entities/doc.dart';

abstract class FavoritesRepo{
  Future<List<Doc>> getFavorites();
}