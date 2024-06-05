import 'package:ai_rap_generator/feature/song_creator/mixin/song_view_mixin.dart';
import 'package:ai_rap_generator/product/blocs/hive/hive_bloc.dart';
import 'package:ai_rap_generator/product/model/data_model.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:ai_rap_generator/product/providers/song_creator/index_provider.dart';
import 'package:ai_rap_generator/product/widgets/common/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../index.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({
    super.key,
    required this.song,
  });

  final DataModel song;

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog>
    with SongViewMixin {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var selectedIdx = context.watch<IndexProvider>().selectedIdx;
    return CupertinoAlertDialog(
      title: Text(adTitle),
      content: Column(
        children: [
          Text(
            adContentText,
            style: TextStyle(color: Color(0xFF787878), fontSize: 14),
          ),
          context.lowHeightSB,
          CupertinoTextField(
            controller: controller,
            onTapOutside: (event) {},
            placeholderStyle: TextStyle(
                fontSize: 13,
                color: Color(0xFF88888C),
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.poppinsRegular),
            placeholder: adPlaceHolderText,
            decoration: BoxDecoration(
              color: Color(0xFFFBFBFB),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 0.5, color: Color(0xFF3C3C435C)),
            ),
            onChanged: (value) {
              setName(value, controller);
            },
          ),
        ],
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            renameText,
            style: customTextStyle.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Colors.blue,
                fontFamily: FontFamily.poppinsRegular),
          ),
          onPressed: () {
            var model = DataModel(
                imageUrl: widget.song.imageUrl,
                songUrl: widget.song.songUrl,
                title: controller.text);
            context
                .read<HiveBloc>()
                .add(UpdateSong(song: model, index: selectedIdx));
            Navigation.ofPop(context);
            showToast(message: 'İsim Başarıyla Değiştirildi');
          },
        ),
      ],
    );
  }
}
