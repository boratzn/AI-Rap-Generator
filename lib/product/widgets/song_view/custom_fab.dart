import 'package:ai_rap_generator/feature/song_creator/mixin/song_view_mixin.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatefulWidget {
  const CustomFAB({
    super.key,
  });

  @override
  State<CustomFAB> createState() => _CustomFABState();
}

class _CustomFABState extends State<CustomFAB> with SongViewMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 88.0),
      child: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Color(0xFFE8455B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          onPressed: () {
            //freetrialCheck and premiumCheck
            premiumCheck(context);
          },
          child: Icon(
            Icons.add,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
