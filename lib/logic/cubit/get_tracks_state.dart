part of 'get_tracks_cubit.dart';

@immutable
abstract class GetTracksState {}

class GetTracksInitial extends GetTracksState {}

class GetTracksLoading extends GetTracksState {}

class GetTracksLoaded extends GetTracksState {
  final GetTracksResponse response;

  GetTracksLoaded(this.response);
}

class GetTracksError extends GetTracksState {
  final String error;

  GetTracksError(this.error);
}