import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/presentation/pages/film_page.dart';

import '../../domain/entities/doc.dart';
import '../cubit/main_cubit.dart';
import '../cubit/main_state.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  final searchContriller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    searchContriller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state is MainWelcomeNotLoadedState) {
            context.read<MainCubit>().loadFilms(state);
            return Scaffold(
              appBar: AppBar(title: const Text('Home'), backgroundColor: Color(0xFFeb5e28),),
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is MainWelcomeLoadedState) {
            return Scaffold(
              appBar: AppBar(title: const Text('Home'), backgroundColor: Color(0xFFeb5e28),),
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFCCC5B9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.83,
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: TextField(
                                controller: searchContriller,
                                style: const TextStyle(
                                  color: Color(0xFF403D39),
                                ),
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: "Search",
                                    hintStyle:
                                        TextStyle(color: Color(0xFF403D39))
                                    //),
                                    ),
                                onSubmitted: (text) => {
                                  context.read<MainCubit>().loadFilmsByName(
                                      state, searchContriller.text)
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.03,
                            child: Container(
                                padding: EdgeInsets.all(10),
                                child: const Icon(
                                  Icons.search,
                                  color: Color(0xFF403D39),
                                )),
                          ),
                        ]),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 10),
                        child: Text(
                          'Novelties',
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF403D39),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child: getNewestFilmsWidgets(
                                      state.getNewestFilms(), context)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          'Highest reviews',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF403D39),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: getTopFilmsWidgets(
                                state.getTopFilms(), context)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is MainSearchLoadedState) {
            return Scaffold(
              body: Container(
                child: SingleChildScrollView(
                  child: getFilmsByNameWidgets(state.films, context),
                ),
              ),
            );
          }

          return Scaffold(
            body: Container(),
          );
        },
      ),
    );
  }
}

Widget getTopFilmsWidgets(List<Doc> docs, BuildContext context) {
  return Row(
      children: docs
          .map(
            (item) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FilmPage(film: item)));
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item.poster.previewUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  padding: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    // color: Color(0xFF403D39),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          )
          .toList());
}

Widget getNewestFilmsWidgets(List<Doc> docs, BuildContext context) {
  return Row(
    children: docs
        .map(
          (item) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilmPage(film: item)));
            },
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.95,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: Color(0xFFCCC5B9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item.poster.previewUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          item.name,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                              color: Color(0xFF403D39)),
                          textDirection: TextDirection.ltr,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .toList(),
  );
}

Widget getFilmsByNameWidgets(List<Doc> docs, BuildContext context) {
  print(docs.length);
  return Wrap(
    children: docs
        .map(
          (item) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FilmPage(film: item)));
            },
            child: Padding(
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
          ),
        )
        .toList(),
  );
}

//TODO change films getter
