import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/feature/song/mixin/song_mixin.dart';
import 'package:ai_rap_generator/product/customs/custom_texts/custom_textstyles.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/model/data_model.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SongView extends StatefulWidget {
  const SongView(
      {super.key,
      required this.rapper,
      required this.track,
      required this.song});

  final VoiceModel rapper;
  final BackingTrackModel track;
  final SongModel song;

  @override
  State<SongView> createState() => _SongViewState();
}

class _SongViewState extends State<SongView> with SongMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          if (state is SongLoading) {
            return Lottie.asset(Assets.lottie.loadingAnimation);
          }
          if (state is SongLoaded) {
            setSource(widget.song.mixUrl!);

            return SizedBox(
              height: context.height,
              width: context.width,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Stack(
                      children: [
                        TransparentBottomOverlayImage(
                            imageUrl: widget.rapper.imageUrl!),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 10),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.track.name,
                            style: CustomTextStyles.textStyleS17W400
                                .copyWith(fontSize: 28),
                          ),
                          Text(
                            widget.rapper.displayName!,
                            style: CustomTextStyles.textStyleS17W900
                                .copyWith(fontSize: 22),
                          ),
                          Padding(
                            padding: context.lowHorizontalPadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  getTimeString(currentPosition.inMilliseconds),
                                  style: const TextStyle(fontSize: 13.0),
                                ),
                                SizedBox(
                                  width: 280,
                                  child: Slider.adaptive(
                                    activeColor: Color(0xFFE64258),
                                    inactiveColor: Color(0xFF010101),
                                    onChanged: (value) {
                                      seekToSec(value.toInt());
                                    },
                                    value:
                                        (currentPosition.inMilliseconds / 1000)
                                            .floorToDouble(),
                                    max: (audioDuration.inMilliseconds / 1000)
                                        .floorToDouble(),
                                    allowedInteraction:
                                        SliderInteraction.slideOnly,
                                  ),
                                ),
                                Text(
                                  getTimeString(audioDuration.inMilliseconds),
                                  style: const TextStyle(fontSize: 13.0),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  rewindAudio();
                                },
                                child: Image.asset(
                                  Assets.images.song.btnBackSong.path,
                                  scale: 2,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (playerState == PlayerState.paused) {
                                    play(widget.song.mixUrl!);
                                  } else {
                                    pause();
                                  }
                                },
                                child: getIcon,
                              ),
                              GestureDetector(
                                onTap: () {
                                  fastForwardAudio();
                                },
                                child: Image.asset(
                                  Assets.images.song.btnForwardSong.path,
                                  scale: 2,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: context.mediumVerticalPadding,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: CustomButton(
                            title: 'Save',
                            isClicked: true,
                            onTap: () {
                              final song = DataModel(
                                  songUrl: widget.song.mixUrl!,
                                  title: widget.song.title ?? "Unknown",
                                  imageUrl: widget.rapper.imageUrl!);
                              context.read<HiveBloc>().add(AddSong(song: song));
                              decreaseCounter();
                              Navigation.pushAndRemoveAll(
                                  page: SongCreatorView());
                            },
                          ),
                        ),
                      ))
                ],
              ),
            );
          }
          if (state is SongError) {
            return Center(child: Text(state.message));
          }

          return Center();
        },
      ),
    );
  }
}
