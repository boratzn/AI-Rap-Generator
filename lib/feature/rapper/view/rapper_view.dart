import 'package:ai_rap_generator/feature/generating_song/view/generating_song_view.dart';
import 'package:ai_rap_generator/feature/rapper/mixin/rapper_view_mixin.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:ai_rap_generator/product/providers/lyric_provider.dart';
import 'package:ai_rap_generator/product/widgets/rapper/custom_rapper_card.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class RapperView extends StatefulWidget {
  const RapperView({super.key, required this.beat});

  final BackingTrackModel beat;

  @override
  State<RapperView> createState() => _RapperViewState();
}

class _RapperViewState extends State<RapperView> with RapperViewMixin {
  @override
  Widget build(BuildContext context) {
    var lyrics = context.watch<LyricProvider>().lyricList;

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: CustomAppBar(
          title: 'Rapper',
          isBackIcon: true,
          isCenterTitle: true,
          isAction: false),
      body: BlocBuilder<RapperBloc, RapperState>(
        builder: (context, state) {
          if (state is RapperInitial)
            context.read<RapperBloc>().add(FetchRapper());
          if (state is RapperLoading)
            return Center(
              child: Lottie.asset(Assets.lottie.loadingAnimation),
            );
          if (state is RapperLoaded) {
            var rapperList = state.rappers!
                .where((rapper) =>
                    rapper.imageUrl!.isNotEmpty && rapper.sampleUrl!.isNotEmpty)
                .toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Expanded(
                    flex: 9,
                    child: GridView.builder(
                      itemCount: rapperList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20),
                      itemBuilder: (context, index) {
                        var rapper = rapperList[index];
                        return InkWell(
                          onTap: () {
                            changeState(index);
                            selectRapper(rapper);
                          },
                          child: CustomRapperCard(rapper: rapper, index: index),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: CustomButton(
                        isClicked: isClicked,
                        onTap: () async {
                          context.read<SongBloc>().add(FetchSong(
                              backingTrackUuid: widget.beat.uuid,
                              voiceModelUuid: selectedRapper.voicemodelUuid!,
                              lyricsData: lyrics));
                          Navigation.push(
                              page: GeneratingSongView(
                                  rapper: selectedRapper, track: widget.beat));
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          }

          return Center(
            child: Text("Rappers couldn't loaded."),
          );
        },
      ),
    );
  }
}
