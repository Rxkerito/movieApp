import 'package:practice/domain/usecases/send_film_id.dart';

class SendFavoriteModule {
  late String filmId;
  late SendFilmId _sendFilmId;

  SendFavoriteModule(String filmId) {
    _sendFilmId = new SendFilmId(filmId: filmId);
  }

  Future<void> sendFilm() async {
    _sendFilmId.sendId();
  }
}
