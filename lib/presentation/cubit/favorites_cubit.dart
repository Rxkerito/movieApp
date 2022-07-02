import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/domain/entities/doc.dart';
import 'package:practice/presentation/cubit/favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() :  super(UserNotLogged()) {
    checkState(state);
  }


  Future<void> loadFavorites(FavoritesState state) async {
    List<Doc> bufFilms;
    if (state is FavoritesNotLoaded){
      await state.favoritesService.getFavorites();
      bufFilms = await state.getFavorites();
      emit(FavoritesLoaded(films: bufFilms, filmService: state.filmService, favoritesService: state.favoritesService));
    }
  }

  bool checkState(FavoritesState state) {
    if (FirebaseAuth.instance.currentUser?.uid != null) {
      emit(FavoritesNotLoaded());
      return true;
    }
    return false;
  }
}
