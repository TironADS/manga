
import 'package:bloc/bloc.dart';
import 'package:manga/Repository/Api/Manga/MangaApi.dart';
import 'package:manga/Repository/Model/MangaModel.dart';
import 'package:meta/meta.dart';

part 'manga_event.dart';

part 'manga_state.dart';

class MangaBloc extends Bloc<MangaEvent, MangaState> {
  MangaApi mangaApi = MangaApi();
  late MangaModel mangaModel;

  MangaBloc() : super(MangaInitial()) {
    on<FetchManga>((event, emit) async {
      emit(MangaBlocLoading());
      try {
        mangaModel = await mangaApi.getManga();
        emit(MangaBlocLoaded());
      } catch (e) {
        print(e);
        emit(MangaBlocError());
      }
    });
  }
}
