import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/data/services/favorites_service.dart';
import 'package:practice/domain/entities/doc.dart';
import 'package:practice/domain/usecases/send_film_id.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FilmPage extends StatefulWidget {
  late Doc film;
  FavoritesService favoritesService = FavoritesService();

  FilmPage({required this.film});

  @override
  _FilmPageState createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(15.0),
    topRight: Radius.circular(15.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFeb5e28),
      ),
      body: SlidingUpPanel(
        header: Padding(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.4,
              top: MediaQuery.of(context).size.height * 0.01),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.005,
            color: Color(0xFFCCC5B9),
          ),
        ),
        borderRadius: radius,
        minHeight: MediaQuery.of(context).size.height * 0.05,
        maxHeight: MediaQuery.of(context).size.height * 0.3,
        panel: Container(
          decoration:
              BoxDecoration(color: Color(0xFFeb5e28), borderRadius: radius),
          child: Padding(
            padding: EdgeInsets.only(),
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () async {
                    if ((FirebaseAuth.instance.currentUser?.uid != null) &&
                        (await widget.favoritesService
                            .checkFilmInFavorites('1233'))) ;
                    SendFilmId a =
                        SendFilmId(filmId: widget.film.id.toString());
                    a.sendId();
                  }, //TODO norm module with login
                  child: Container(
                    margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.1),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFCCC5B9),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      'Add to favorites',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          color: Color(0xFFCCC5B9)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02,
                      bottom: MediaQuery.of(context).size.height * 0.01),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      //TODO border radius
                      child: Image.network(
                        widget.film.poster.url,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.film.name,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.035,
                      color: Color(0xFF403D39)),
                  textDirection: TextDirection.ltr,
                ),
                Text(
                  widget.film.year.toString() +
                      ' ' +
                      widget.film.movieLength.toString(),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      color: Color(0xFF403D39)),
                  textDirection: TextDirection.ltr,
                ),
                Text(
                  widget.film.rating.kp.toString(),
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                      color: Color(0xFF403D39)),
                  textDirection: TextDirection.ltr,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      10, 10, 10, MediaQuery.of(context).size.height * 0.2),
                  child: Text(
                    widget.film.description,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        color: Color(0xFF403D39)),
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
