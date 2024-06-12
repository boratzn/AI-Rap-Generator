import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/customs/custom_texts/custom_textstyles.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class GeneratingLyricsView extends StatefulWidget {
  const GeneratingLyricsView({super.key, required this.prompt});

  final String prompt;

  @override
  State<GeneratingLyricsView> createState() => _GeneratingLyricsViewState();
}

class _GeneratingLyricsViewState extends State<GeneratingLyricsView> {
  @override
  Widget build(BuildContext context) {
    var timerModel = context.watch<TimerProvider>();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
          title: generatingText,
          isBackIcon: true,
          isCenterTitle: true,
          isAction: false),
      body: Padding(
        padding: context.mediumPadding,
        child: Column(
          children: [
            Text(
              widget.prompt,
              style: CustomTextStyles.textStyleS17W400,
              textAlign: TextAlign.center,
            ),
            context.highHeightSB,
            BlocBuilder<LyricBloc, LyricState>(
              builder: (context, state) {
                if (state is LyricLoading) {
                  return Center(
                    child: SizedBox(
                      height: 292,
                      width: 292,
                      child: Lottie.asset(Assets.lottie.loadingAnimation),
                    ),
                  );
                }
                if (state is LyricLoaded) {
                  return Center(
                    child: CustomButton(
                      isClicked: true,
                      onTap: () {
                        Navigation.push(page: LyricsView(lyric: state.lyric));
                      },
                    ),
                  );
                }
                if (state is LyricError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: CustomTextStyles.textStyleS17W900,
                    ),
                  );
                }

                return Container();
              },
            ),
            context.mediumHeightSB,
            timerModel.counter == 0
                ? Center()
                : Text('${timerModel.counter}s Left',
                    style: CustomTextStyles.textStyleS17W900
                        .copyWith(fontSize: 21)),
            timerModel.counter == 0
                ? Center()
                : Text(
                    processingText,
                    style: CustomTextStyles.textStyleS17W400,
                  ),
          ],
        ),
      ),
    );
  }
}
