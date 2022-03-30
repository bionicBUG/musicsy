import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_match_api_app/logic/cubit/get_tracks_cubit.dart';
import 'package:music_match_api_app/logic/cubit/internet_cubit.dart';

import 'lyrics_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<GetTracksCubit>(context).getData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Top Songs'),
        ),
        body: BlocListener<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state is InternetDisconnected) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('No internet connection'),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: BlocBuilder<GetTracksCubit, GetTracksState>(
                  builder: (context, state) {
                    if (state is GetTracksLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetTracksLoaded) {
                      return buildList(context, state);
                    } else if (state is GetTracksError) {
                      return Center(child: Text(state.error));
                    } else {
                      return const Center(child: Text('Something went wrong'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildList(BuildContext context, GetTracksLoaded state) {
  var data = state.response.tracks;
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => LyricsPage(id: data[index].id!))));
        },
        child: Card(
          child: ListTile(
            title: Text(
              data[index].name!,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              data[index].album!,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              data[index].artist!,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );
    },
  );
}
