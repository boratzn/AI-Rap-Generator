import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/feature/prompt/mixin/prompt_view_mixin.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:ai_rap_generator/product/customs/custom_texts/custom_textstyles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class PromptView extends StatefulWidget {
  const PromptView({super.key});

  @override
  State<PromptView> createState() => _PromptViewState();
}

class _PromptViewState extends State<PromptView> with PromptViewMixin {
  @override
  Widget build(BuildContext context) {
    final timerModel = Provider.of<TimerProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: CustomAppBar(
        title: promptTitle,
        isBackIcon: true,
        isCenterTitle: true,
        isAction: false,
        color: Color(0xFFFAFAFA),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 24),
          child: Column(
            children: [
              TextField(
                controller: controller,
                style: CustomTextStyles.textStyleS17W400,
                maxLines: 6,
                decoration: InputDecoration(
                  hintStyle: CustomTextStyles.textStyleS17W400
                      .copyWith(fontSize: 18, color: Color(0xFFA9A9A9)),
                  hintText: promptText,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA9A9A9)),
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
              context.normalHeightSB,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    genres.length,
                    (index) {
                      var genre = genres[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: () {
                            changeIndex(index);
                          },
                          child: Container(
                            width: 76,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                gradient: checkIndexes(index)
                                    ? premiumGradient
                                    : null),
                            child: Center(
                              child: Text(
                                genre,
                                style: CustomTextStyles.textStyleS17W900
                                    .copyWith(
                                        color: checkIndexes(index)
                                            ? Colors.white
                                            : Colors.black),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              context.normalHeightSB,
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: List.generate(
                  4,
                  (index) {
                    var isIndexEqual = containerIdx == index;
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () {
                          clickContainer(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: isIndexEqual
                                  ? Border.all(
                                      color: Color(0xFFF35C70), width: 2)
                                  : null,
                              borderRadius: BorderRadius.circular(13)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            child: Center(
                              child: Text(
                                poem,
                                style: CustomTextStyles.textStyleS17W400,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              context.mediumHeightSB,
              CustomButton(
                  isClicked: textState,
                  onTap: () {
                    var temp = controller.text;
                    context.read<LyricBloc>().add(GenerateLyric(prompt: temp));
                    timerModel.startTimer();
                    Navigation.push(
                        context: context,
                        page: GeneratingLyricsView(
                          prompt: temp,
                        ));
                    controller.text = "";
                  })
            ],
          ),
        ),
      ),
    );
  }
}
