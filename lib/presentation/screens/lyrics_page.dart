import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_match_api_app/logic/cubit/get_lyrics_cubit.dart';
import 'package:music_match_api_app/logic/cubit/get_track_details_cubit.dart';

class LyricsPage extends StatefulWidget {
  final String id;
  const LyricsPage({
    required this.id,
    Key? key,
  }) : super(key: key);

  @override
  State<LyricsPage> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<GetTrackDetailsCubit>(context).getData(widget.id);
    BlocProvider.of<GetLyricsCubit>(context).getLyrics(widget.id);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                BlocBuilder<GetTrackDetailsCubit, GetTrackDetailsState>(
                    builder: (context, state) {
                  if (state is GetTrackDetailsLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is GetTrackDetailsLoaded) {
                    return Text(
                      state.trackDetailsResponse.track!.name!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    );
                  } else if (state is GetTrackDetailsError) {
                    print(state.error);
                    return const Text('Error');
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
                SizedBox(height: 15),
                Text(
                  'Artist',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                BlocBuilder<GetTrackDetailsCubit, GetTrackDetailsState>(
                    builder: (context, state) {
                  if (state is GetTrackDetailsLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is GetTrackDetailsLoaded) {
                    return Text(
                      state.trackDetailsResponse.track!.artist!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    );
                  } else if (state is GetTrackDetailsError) {
                    print(state.error);
                    return const Text('Error');
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
                SizedBox(height: 15),
                Text(
                  'Album',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                BlocBuilder<GetTrackDetailsCubit, GetTrackDetailsState>(
                    builder: (context, state) {
                  if (state is GetTrackDetailsLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is GetTrackDetailsLoaded) {
                    return Text(
                      state.trackDetailsResponse.track!.album!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    );
                  } else if (state is GetTrackDetailsError) {
                    print(state.error);
                    return const Text('Error');
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
                SizedBox(height: 15),
                Text(
                  'Explicit',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                BlocBuilder<GetTrackDetailsCubit, GetTrackDetailsState>(
                    builder: (context, state) {
                  if (state is GetTrackDetailsLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is GetTrackDetailsLoaded) {
                    return Text(
                      state.trackDetailsResponse.track!.explicit!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    );
                  } else if (state is GetTrackDetailsError) {
                    print(state.error);
                    return const Text('Error');
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
                SizedBox(height: 15),
                Text(
                  'Rating',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                BlocBuilder<GetTrackDetailsCubit, GetTrackDetailsState>(
                    builder: (context, state) {
                  if (state is GetTrackDetailsLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is GetTrackDetailsLoaded) {
                    return Text(
                      state.trackDetailsResponse.track!.rating!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    );
                  } else if (state is GetTrackDetailsError) {
                    print(state.error);
                    return const Text('Error');
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
                SizedBox(height: 15),
                Text(
                  'Lyrics',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                BlocBuilder<GetLyricsCubit, GetLyricsState>(
                    builder: (context, state) {
                  if (state is GetLyricsLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is GetLyricsLoaded) {
                    return Text(
                      state.trackDetailsResponse.lyrics!.lyrics!,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    );
                  } else if (state is GetLyricsError) {
                    print(state.error);
                    return const Text('Error');
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
