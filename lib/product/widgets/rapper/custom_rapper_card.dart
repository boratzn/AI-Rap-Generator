import 'package:ai_rap_generator/feature/rapper/mixin/rapper_view_mixin.dart';
import 'package:ai_rap_generator/product/customs/custom_texts/custom_textstyles.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/widgets/rapper/image_widget.dart';
import 'package:flutter/material.dart';

class CustomRapperCard extends StatefulWidget {
  const CustomRapperCard(
      {super.key, required this.rapper, required this.index});

  final VoiceModel rapper;
  final int index;

  @override
  State<CustomRapperCard> createState() => _CustomRapperCardState();
}

class _CustomRapperCardState extends State<CustomRapperCard>
    with RapperViewMixin {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        selectedRapperIndex == widget.index
            ? Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: premiumGradient,
                      borderRadius: BorderRadius.circular(13)),
                ),
              )
            : Container(),
        Positioned.fill(
          top: 4,
          bottom: 4,
          left: 4,
          right: 4,
          child: NetworkImageWithPlaceholder(
            imageUrl: widget.rapper.imageUrl!,
            placeholder: AssetImage(Assets.images.songs.imgGenerator1.path),
          ),
        ),
        Positioned.fill(
          top: 4,
          bottom: 4,
          left: 4,
          right: 4,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.55),
                borderRadius: BorderRadius.circular(13)),
          ),
        ),
        Padding(
          padding: context.lowPadding,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.rapper.displayName!,
                    style: CustomTextStyles.textStyleS17W900
                        .copyWith(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setPlayingIndex(widget.index);
                    playAndPause(widget.rapper.sampleUrl![0].url!);
                  },
                  child: isClicked
                      ? Image.asset(Assets.images.rapper.imgPauseRapper.path)
                      : Image.asset(Assets.images.rapper.imgPlayRapper.path),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
