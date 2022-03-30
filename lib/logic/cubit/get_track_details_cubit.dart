import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_match_api_app/data/services/get_tracks.dart';

import '../../data/models/track_details.dart';
import '../../data/services/get_data.dart';

part 'get_track_details_state.dart';

class GetTrackDetailsCubit extends Cubit<GetTrackDetailsState> {
  final GetTrackDetailService _getTrackDetailsService;

  GetTrackDetailsCubit(this._getTrackDetailsService) : super(GetTrackDetailsInitial());

  void getData(String id) async {
    emit(GetTrackDetailsLoading());
    try {
      await _getTrackDetailsService.getTrackData(id).then((track) {
        emit(GetTrackDetailsLoaded(track));
      });
    } catch (e) {
      emit(GetTrackDetailsError(e.toString()));
    }
  }
}
