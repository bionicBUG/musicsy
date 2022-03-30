import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/lyrics.dart';
import '../../data/services/get_lyrics.dart';

part 'get_lyrics_state.dart';

class GetLyricsCubit extends Cubit<GetLyricsState> {
  final GetLyricsService _getLyricsService;

  GetLyricsCubit(this._getLyricsService) : super(GetLyricsInitial());

  void getLyrics(String id) async {
    emit(GetLyricsLoading());
    try {
      await _getLyricsService.getLyrics(id).then((track) {
        emit(GetLyricsLoaded(track));
      });
    } catch (e) {
      emit(GetLyricsError(e.toString()));
    }
  }
}
