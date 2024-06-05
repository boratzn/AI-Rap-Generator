import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/model/data_model.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:ai_rap_generator/product/providers/song_creator/index_provider.dart';
import 'package:ai_rap_generator/product/widgets/common/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({
    super.key,
    required this.song,
  });

  final DataModel song;

  @override
  Widget build(BuildContext context) {
    int selectedIdx = context.watch<IndexProvider>().selectedIdx;
    return CupertinoAlertDialog(
      title: Text(dAdTitle + song.title),
      content: Text(
        dAdContentText,
        style: TextStyle(color: Color(0xFF787878), fontSize: 14),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            cancelText,
            style: TextStyle(color: Colors.blue, fontSize: 17),
          ),
          onPressed: () {
            Navigation.ofPop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text(
            deleteText,
            style: TextStyle(color: Colors.red, fontSize: 17),
          ),
          onPressed: () {
            context.read<HiveBloc>().add(DeleteSong(index: selectedIdx));
            Navigation.ofPop(context);
            showToast(message: 'Song deleted successfully');
          },
        ),
      ],
    );
  }
}
