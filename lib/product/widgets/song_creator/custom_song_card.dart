import 'package:ai_rap_generator/feature/song_creator/mixin/song_view_mixin.dart';
import 'package:ai_rap_generator/product/model/data_model.dart';
import 'package:ai_rap_generator/product/providers/song_creator/index_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../index.dart';

class CustomSongCard extends StatefulWidget {
  const CustomSongCard({super.key, required this.song, required this.index});

  final DataModel? song;
  final int index;

  @override
  State<CustomSongCard> createState() => _CustomSongCardState();
}

class _CustomSongCardState extends State<CustomSongCard> with SongViewMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(13)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.black.withOpacity(0.5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.song!.imageUrl,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                context.read<IndexProvider>().setIndex(widget.index);
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CustomCupertinoMenu(
                      song: widget.song,
                    );
                  },
                );
              },
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: context.lowHorizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        widget.song!.title,
                        style: customTextStyle.copyWith(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        playAndPause(widget.song!.songUrl);
                      },
                      child: Icon(
                        !isClicked ? Icons.play_arrow_rounded : Icons.pause,
                        size: 40,
                        color: Color(0xFFFAFAFA),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
