import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:ai_rap_generator/product/providers/lyric_provider.dart';
import 'package:ai_rap_generator/product/customs/custom_texts/custom_textstyles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LyricsView extends StatefulWidget {
  const LyricsView({super.key, this.editLyrics, this.lyric});

  final List<String>? lyric;
  final List<String>? editLyrics;

  @override
  State<LyricsView> createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  @override
  Widget build(BuildContext context) {
    var temp = widget.editLyrics != null ? widget.editLyrics! : widget.lyric;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: generatingText,
        isBackIcon: true,
        isCenterTitle: true,
        isAction: true,
        icon: Icon(
          Icons.refresh,
          color: Colors.black,
        ),
        color: backgroundColor,
        onMenuPressed: () {},
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: context.mediumHorizontalPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  songTitle,
                  style: CustomTextStyles.textStyleS17W900,
                ),
                context.lowHeightSB,
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'King of the Hustle',
                    style: CustomTextStyles.textStyleS17W400,
                  ),
                ),
                context.lowHeightSB,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      songLyrics,
                      style: CustomTextStyles.textStyleS17W900,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigation.push(
                              page: EditLyricsView(lyrics: temp ?? []));
                        },
                        child:
                            Image.asset(Assets.images.prompt.carbonEdit.path))
                  ],
                ),
                context.lowHeightSB,
                SizedBox(
                  height: 580,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: temp != null
                          ? List.generate(
                              temp.length,
                              (index) {
                                var text = temp[index].trim();
                                return Text(
                                  text,
                                  style: CustomTextStyles.textStyleS19W400,
                                );
                              },
                            )
                          : [],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 18,
            child: CustomButton(
              isClicked: true,
              onTap: () {
                var temp = widget.editLyrics != null
                    ? widget.editLyrics!
                    : widget.lyric!;
                context.read<LyricProvider>().setLyrics(temp);
                Navigation.push(
                    page: BeatsView(
                  lyric: temp,
                ));
              },
            ),
          )
        ],
      ),
    );
  }
}
