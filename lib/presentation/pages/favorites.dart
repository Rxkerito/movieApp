import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/data/services/favorites_service.dart';
import 'package:practice/presentation/cubit/favorites_cubit.dart';

import '../../domain/entities/doc.dart';
import '../cubit/favorites_state.dart';

class FavoritesPage extends StatefulWidget {
  late List<Doc> filmes;

  FavoritesPage() {
    // filmes = getf();
  }

  @override
  _FavoritesPageState createState() => _FavoritesPageState();

  Future<List<Doc>> cnverik() async {
    FavoritesService favoritesService = FavoritesService();
    return FavoritesService().getFavorites();
  }

  Future<void> getf() async {
    filmes = await cnverik();
  }
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  initState() {
    super
        .initState(); //  this is the material super constructor for init state to link your instance initState to the global initState context
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoritesCubit>(
      create: (context) => FavoritesCubit(),
      child: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is UserNotLogged) {
            ReadContext(context).read<FavoritesCubit>().checkState(state);
            return Scaffold(
              appBar: AppBar(
                title: const Text('Favorites'),
                backgroundColor: Color(0xFFeb5e28),
              ),
              body: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                      color: Color(0xFFCCC5B9),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Text(
                      'you are not authorized',
                      style: TextStyle(
                          color: Color(0xFF403D39),
                          fontSize: MediaQuery.of(context).size.width * 0.05),
                    ),
                  ),
                ),
              ),
            );
          }

          if (state is FavoritesNotLoaded) {
            ReadContext(context).read<FavoritesCubit>().loadFavorites(state);
            return Scaffold(
              appBar: AppBar(
                title: const Text('Favorites'),
                backgroundColor: Color(0xFFeb5e28),
              ),
              body: Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }

          if (state is FavoritesLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Favorites'),
                backgroundColor: Color(0xFFeb5e28),
              ),
              body: FutureBuilder(
                future: ReadContext(context)
                    .read<FavoritesCubit>()
                    .loadFavorites(state),
                builder: (context, snapshot) {
                  if (snapshot.connectionState  == ConnectionState.done) {
                    print(state.films.length + 200);
                    print(state.favoritesService.favorites.length+ 300);
                    getFavoriteFilmsWidget(state.getFavorites(), context);
                  }
                  return Container();
                },
              ),
            );
          }

          return Scaffold();
        },
      ),
    );
  }

  Widget getFavoriteFilmsWidget(List<Doc> docs, BuildContext context) {
    print(docs.length + 100);
    return Wrap(
      children: docs
          .map(
            (item) => Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    item.poster.previewUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                padding: EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width * 0.28,
                height: MediaQuery.of(context).size.height * 0.23,
                decoration: BoxDecoration(
                  // color: Color(0xFF403D39),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
