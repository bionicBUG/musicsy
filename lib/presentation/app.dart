import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_match_api_app/data/services/get_data.dart';
import 'package:music_match_api_app/data/services/get_lyrics.dart';
import 'package:music_match_api_app/data/services/get_tracks.dart';
import 'package:music_match_api_app/logic/cubit/get_lyrics_cubit.dart';
import 'package:music_match_api_app/logic/cubit/get_track_details_cubit.dart';
import 'package:music_match_api_app/logic/cubit/internet_cubit.dart';

import '../logic/cubit/get_tracks_cubit.dart';
import 'screens/home.dart';

class Musicsy extends StatelessWidget {
  Musicsy({Key? key}) : super(key: key);

  final _getTracksService = GetTracksService();
  final _getTrackDetailsService = GetTrackDetailService();
  final _getLyricsService = GetLyricsService();
  final _connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetTracksCubit>(
          create: (context) => GetTracksCubit(_getTracksService),
        ),
        BlocProvider<GetTrackDetailsCubit>(
            create: ((context) =>
                GetTrackDetailsCubit(_getTrackDetailsService))),
        BlocProvider<GetLyricsCubit>(
            create: ((context) => GetLyricsCubit(_getLyricsService))),
        BlocProvider<InternetCubit>(
            create: ((context) => InternetCubit(_connectivity))),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Musicsy',
        // theme: ThemeData(
        //   scaffoldBackgroundColor: bgColor,
        //   textTheme: GoogleFonts.interTextTheme().copyWith(
        //     bodyText1: textStyle1,
        //   ),
        //   appBarTheme: AppBarTheme(
        //       backgroundColor: barColor, elevation: 1, titleSpacing: 20),
        // ),
        home: Home(),
      ),
    );
  }
}
