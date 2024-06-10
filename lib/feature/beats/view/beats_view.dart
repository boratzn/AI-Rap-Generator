import 'package:ai_rap_generator/feature/beats/mixin/beats_view_mixin.dart';
import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/product/blocs/beats/beats_bloc.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/customs/custom_texts/custom_textstyles.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class BeatsView extends StatefulWidget {
  const BeatsView({super.key, required this.lyric});

  final List<String> lyric;

  @override
  State<BeatsView> createState() => _BeatsViewState();
}

class _BeatsViewState extends State<BeatsView> with BeatsViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: CustomAppBar(
        title: 'Select Beat',
        isBackIcon: true,
        isCenterTitle: true,
        icon: null,
        isAction: false,
      ),
      body: BlocBuilder<BeatsBloc, BeatsState>(
        builder: (context, state) {
          if (state is BeatsInitial) {
            context.read<BeatsBloc>().add(FetchBeats());
          }
          if (state is BeatsLoading) {
            return Center(
              child: Lottie.asset(Assets.lottie.loadingAnimation),
            );
          }
          if (state is BeatsLoaded) {
            var beats = state.beats;
            return Stack(
              children: [
                ListView.separated(
                  separatorBuilder: (context, index) => context.lowHeightSB,
                  itemCount: beats.length,
                  itemBuilder: (context, index) {
                    var beat = beats[index];
                    var isIndexEqual = currentIndex == index;
                    return Padding(
                      padding: context.normalHorizontalPadding,
                      child: Container(
                        height: isIndexEqual ? 132 : 65,
                        decoration: BoxDecoration(
                            border: isIndexEqual
                                ? Border.all(
                                    color: Color(0xFFF35C70), width: 1.5)
                                : null,
                            borderRadius: BorderRadius.circular(13)),
                        child: Padding(
                          padding: context.normalHorizontalPadding,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  beat.name,
                                  style: CustomTextStyles.textStyleS17W900,
                                ),
                                leading: isIndexEqual
                                    ? Image.asset(
                                        Assets.images.beats.btnPause.path)
                                    : Image.asset(
                                        Assets.images.beats.btnPlayBeats.path),
                                onTap: () {
                                  changeState(index, beat);
                                  play(beat.url);
                                },
                              ),
                              isIndexEqual
                                  ? SizedBox(
                                      height: 44,
                                      width: 337,
                                      child: Image.asset(Assets
                                          .images.beats.imgSoundWave.path))
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: context.normalVerticalPadding,
                    child: CustomButton(
                      isClicked: isClicked,
                      onTap: () async {
                        await player.stop();
                        Navigation.push(
                            context: context,
                            page: RapperView(beat: selectedBeat));
                      },
                    ),
                  ),
                )
              ],
            );
          }

          return Center(
            child: Text(
              "Beats couldn't fetch",
              style: CustomTextStyles.textStyleS17W900,
            ),
          );
        },
      ),
    );
  }
}
