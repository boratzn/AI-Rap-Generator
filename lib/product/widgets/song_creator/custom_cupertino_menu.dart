import 'package:ai_rap_generator/product/model/data_model.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../index.dart';

class CustomCupertinoMenu extends StatelessWidget {
  const CustomCupertinoMenu({super.key, required this.song});

  final DataModel? song;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          child: Text(
            cmShareText,
            style: customTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.blue),
          ),
          onPressed: () {
            Share.share(song!.title);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(
            renameText,
            style: customTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.blue),
          ),
          onPressed: () async {
            await showCupertinoDialog(
              context: context,
              builder: (context) => CustomAlertDialog(
                song: song!,
              ),
            );
            Navigation.ofPop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: Text(
            deleteText,
            style: customTextStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.w900, color: Colors.red),
          ),
          onPressed: () async {
            await showCupertinoDialog(
              context: context,
              builder: (context) => DeleteAlertDialog(
                song: song!,
              ),
            );
            Navigation.ofPop(context);
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          cancelText,
          style: customTextStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w900, color: Colors.blue),
        ),
        onPressed: () {
          Navigation.ofPop(context);
        },
      ),
    );
  }
}
