part of 'get_track_details_cubit.dart';

@immutable
abstract class GetTrackDetailsState {}

class GetTrackDetailsInitial extends GetTrackDetailsState {}

class GetTrackDetailsLoading extends GetTrackDetailsState {}

class GetTrackDetailsLoaded extends GetTrackDetailsState {
  final TrackDetailsResponse trackDetailsResponse;

  GetTrackDetailsLoaded(this.trackDetailsResponse);
}

class GetTrackDetailsError extends GetTrackDetailsState {
  final String error;

  GetTrackDetailsError(this.error);
}

