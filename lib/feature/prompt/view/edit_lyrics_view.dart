import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EditLyricsView extends StatefulWidget {
  const EditLyricsView({super.key, required this.lyrics});

  final List<String>? lyrics;

  @override
  State<EditLyricsView> createState() => _EditLyricsViewState();
}

class _EditLyricsViewState extends State<EditLyricsView> {
  String convertString(List<String>? lyrics) {
    String result = "";
    for (int i = 0; i < lyrics!.length; i++) {
      result += lyrics[i] + "\n";
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller =
        TextEditingController(text: convertString(widget.lyrics));
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          title: editTitle,
          isBackIcon: true,
          isCenterTitle: true,
          isAction: false),
      body: Padding(
        padding: context.normalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              maxLines: 18,
              minLines: null,
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: labelText,
              ),
            ),
            CustomButton(
              title: saveButtonTitle,
              isClicked: true,
              onTap: () {
                List<String>? editLyrics = controller.text.split('\n').toList();
                Navigation.push(
                    page: LyricsView(
                  editLyrics: editLyrics,
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
