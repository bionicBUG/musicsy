import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_match_api_app/data/models/tracks.dart';
import 'package:music_match_api_app/data/services/get_tracks.dart';

part 'get_tracks_state.dart';

class GetTracksCubit extends Cubit<GetTracksState> {
  final GetTracksService _getTracksService;

  GetTracksCubit(this._getTracksService) : super(GetTracksInitial());

  void getData() async {
    emit(GetTracksLoading());
    try {
      await _getTracksService.getTracks().then((tracks) {
        emit(GetTracksLoaded(tracks));
      });
    } catch (e) {
      emit(GetTracksError(e.toString()));
    }
  }
}
