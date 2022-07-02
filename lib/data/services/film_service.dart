import 'dart:convert';
import '../entities/film_dto.dart';
import 'package:http/http.dart' as http;

class FilmService {
  Future<List<FilmDTO>> getTopFilm() async {
    Uri linkTop = Uri.https('api.kinopoisk.dev',
        '/movie?field=rating.kp&search=7.9-9.4&sortField=rating.imdb&sortType=-1&token=NRBXCD7-V3T4X55-Q4S9R87-E101XB9');
    http.Response res = await http.get(linkTop);
    List<dynamic> raw = await json.decode(res.body)["docs"];
    return raw.map((f) => FilmDTO.fromJSON(f)).toList();
  }

  Future<List<FilmDTO>> getNewFilms() async {
    Uri linkNew = Uri.https('api.kinopoisk.dev',
        '/movie?field=rating.kp&search=6.1-9.2&field=year&search=2020-2021&sortField=year&sortType=-1&token=NRBXCD7-V3T4X55-Q4S9R87-E101XB9');
    http.Response res = await http.get(linkNew);
    List<dynamic> raw = await json.decode(res.body)["docs"];
    return raw.map((f) => FilmDTO.fromJSON(f)).toList();
  }

  Future<List<FilmDTO>> getFilmByName(String text) async {
    String string =
        '/movie?field=name&search=$text&isStrict=false&token=NRBXCD7-V3T4X55-Q4S9R87-E101XB9';

    final params = <String, dynamic>{
      "name": text,
      // "rating.kp": '5-10',
      // "sortField": 'rating.kp',
      // "sortType" : '-1',
      "isStrict": "false",
      "token": "NRBXCD7-V3T4X55-Q4S9R87-E101XB9"
    };
    //'?field=name&search=$text&isStrict=false&token=NRBXCD7-V3T4X55-Q4S9R87-E101XB9';
    Uri linkName = Uri.https('api.kinopoisk.dev', '/movie', params);
    print(linkName);
    http.Response res = await http.get(linkName);
    String a = res.body;
    print(res.body);
    List<dynamic> raw = await json.decode(res.body)["docs"];
    return raw.map((f) => FilmDTO.fromJSON(f)).toList();
  }

  Future<List<FilmDTO>> getFilmById(String id) async {
    Uri linkId = Uri.https('api.kinopoisk.dev', '/movie?field=id&search=$id&token=NRBXCD7-V3T4X55-Q4S9R87-E101XB9');
    http.Response res = await http.get(linkId);
    print(res.body);
    List<dynamic> raw = await json.decode(res.body);
    return raw.map((f) => FilmDTO.fromJSON(f)).toList();
  }
}
