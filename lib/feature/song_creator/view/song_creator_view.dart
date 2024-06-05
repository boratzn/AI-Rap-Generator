import 'package:ai_rap_generator/feature/settings/view/settings_view.dart';
import 'package:ai_rap_generator/feature/song_creator/mixin/song_view_mixin.dart';
import 'package:ai_rap_generator/product/blocs/hive/hive_bloc.dart';
import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:ai_rap_generator/product/widgets/song_view/custom_fab.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SongCreatorView extends StatefulWidget {
  const SongCreatorView({super.key});

  @override
  State<SongCreatorView> createState() => _SongsViewState();
}

class _SongsViewState extends State<SongCreatorView> with SongViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: CustomAppBar(
        isBackIcon: false,
        isCenterTitle: true,
        title: appBarTitle,
        isAction: true,
        onMenuPressed: () =>
            Navigation.push(context: context, page: SettingsView()),
      ),
      body: Padding(
        padding: padding,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      contentTitle,
                      style: customTextStyle,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  BlocBuilder<HiveBloc, HiveState>(
                    builder: (context, state) {
                      if (state is HiveInitial) {
                        context.read<HiveBloc>().add(GetAllSongs());
                      }
                      if (state is HiveLoading) {
                        return Center(
                          child: Lottie.asset(Assets.lottie.loadingAnimation),
                        );
                      }
                      if (state is HiveLoaded) {
                        return GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: box.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 30,
                                  crossAxisSpacing: 15,
                                  mainAxisExtent: context.height * 0.2),
                          itemBuilder: (context, index) {
                            var song = box.getAt(index);
                            return CustomSongCard(
                              song: song,
                              index: index,
                            );
                          },
                        );
                      }

                      return Center(
                        child: Text("Songs couldn't be loaded"),
                      );
                    },
                  ),
                ],
              ),
              // Positioned(
              //   left: 0,
              //   right: 0,
              //   bottom: 0,
              //   child: customNavBar(context),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFAB(),
    );
  }
}
