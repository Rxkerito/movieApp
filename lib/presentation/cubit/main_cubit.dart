import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/doc.dart';
import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainWelcomeNotLoadedState());

  Future<void> loadFilms(MainState state) async {
    List<Doc> films;
    List<Doc> newestFilms;
    if (state is MainWelcomeNotLoadedState) {
      films = await state.getTopFilms();
      newestFilms = await state.getNewestFilms();
      emit(MainWelcomeLoadedState(films: films, newestFilms: newestFilms, loadFilmByNameUseCase: state.getLoadFilmsByNameUseCase()));
    }
  }

  Future<void> loadFilmsByName(MainState state, String text) async {
    List<Doc> films;
    if (state is MainWelcomeLoadedState){
      films = await state.getFilmsByName(text);
      emit(MainSearchLoadedState(films: films));
    }
  }
}
