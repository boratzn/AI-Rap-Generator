import 'package:ai_rap_generator/product/index.dart';
import 'package:flutter/material.dart';

mixin PromptViewMixin<T extends StatefulWidget> on State<T> {
  int currIndex = 0;
  int containerIdx = -1;
  TextEditingController controller = TextEditingController();
  bool isClicked = false;
  String poem = poemList[0];

  ///Check indexes is true or not
  bool checkIndexes(int index) => currIndex == index;

  ///Change index
  void changeIndex(int index) {
    return setState(() {
      currIndex = index;
      poem = poemList[index];
      containerIdx = -1;
    });
  }

  void clickContainer(int index) {
    return setState(() {
      controller.text = poem;
      containerIdx = index;
    });
  }

  bool get textState => controller.text.isNotEmpty;
}
