part of 'get_lyrics_cubit.dart';

@immutable
abstract class GetLyricsState {}

class GetLyricsInitial extends GetLyricsState {}

class GetLyricsLoading extends GetLyricsState {}

class GetLyricsLoaded extends GetLyricsState {
  final LyricsResponse trackDetailsResponse;

  GetLyricsLoaded(this.trackDetailsResponse);
}

class GetLyricsError extends GetLyricsState {
  final String error;

  GetLyricsError(this.error);
}
