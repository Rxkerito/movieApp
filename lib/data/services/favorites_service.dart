import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/application/film_module.dart';
import 'package:practice/domain/usecases/load_film_by_id.dart';

import '../../domain/entities/doc.dart';


class FavoritesService {
  StreamSubscription<QuerySnapshot>? _favoritesSubscription;
  List<Doc> _favorites = [];
  List<String> _favoritesIds = [];

  List<Doc> get favorites => _favorites;
  FilmModule filmModule = FilmModule();
  late LoadFilmByIdUseCase loadFilmByIdUseCase;

  FavoritesService(){
    loadFilmByIdUseCase = filmModule.loadFilmByIdUseCase();
  }

  Future<List<Doc>> getFavorites() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    await FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _favoritesSubscription = FirebaseFirestore.instance
            .collection(uid!)
            .orderBy('timestamp', descending: true)
            .limit(12)
            .snapshots()
            .listen((snapshot) async {
          _favoritesIds = [];
          for (final document in snapshot.docs) {
            _favorites.addAll(  await loadFilmByIdUseCase.loadFilmsById(document.data()['filmId'].toString()));
            // _favoritesIds.add(
            //   document.data()['filmId']
            //
            // );
            print(_favorites[0].name);
            print(_favorites.length.toString() + ' fffffff');

          }
        });
      }
    });
    // _favoritesIds.forEach((element) async {
    //
    // });
    print(_favorites.length);
    return _favorites;
  }

  Future<bool> checkFilmInFavorites(String id) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;

    await FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _favoritesSubscription = FirebaseFirestore.instance
            .collection(uid!).where('filmId', isGreaterThanOrEqualTo: id).where('filmId', isLessThan: id)
            .snapshots()
            .listen((snapshot) {
          _favoritesIds = [];
          for (final document in snapshot.docs) {
            _favoritesIds.add(
                document.data()['filmId']

            );
            print(_favorites.length.toString() + '...');
          }
        });
      }
    });

    print(_favorites.length);

    if (_favorites.length != 0) return false;
    return true;
  }
}
