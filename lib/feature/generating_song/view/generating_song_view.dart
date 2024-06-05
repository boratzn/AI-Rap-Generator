import 'package:ai_rap_generator/feature/song/view/song_view.dart';
import 'package:ai_rap_generator/product/blocs/song/song_bloc.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/customs/custom_texts/custom_textstyles.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class GeneratingSongView extends StatelessWidget {
  const GeneratingSongView(
      {super.key, required this.rapper, required this.track});

  final VoiceModel rapper;
  final BackingTrackModel track;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: CustomAppBar(
          title: gsAppbarTitle,
          isBackIcon: false,
          isCenterTitle: true,
          isAction: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 62,
            backgroundImage: NetworkImage(rapper.imageUrl!),
          ),
          Text(
            rapper.displayName!,
            style: CustomTextStyles.textStyleS19W900,
          ),
          Text(
            track.name,
            style: CustomTextStyles.textStyleS19W400,
          ),
          //lottie animasyonu
          BlocBuilder<SongBloc, SongState>(
            builder: (context, state) {
              if (state is SongLoading) {
                return Center(
                  child: Lottie.asset(Assets.lottie.loadingAnimation),
                );
              }
              if (state is SongLoaded) {
                var song = state;

                return Center(
                    child: CustomButton(
                        isClicked: true,
                        onTap: () {
                          Navigation.push(
                              context: context,
                              page: SongView(
                                rapper: rapper,
                                track: track,
                                song: song.song,
                              ));
                        }));
              }
              return Container();
            },
          ),
          Text(
            gsLoadingTitle,
            style: CustomTextStyles.textStyleS17W900,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
