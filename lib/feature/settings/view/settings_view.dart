import 'package:ai_rap_generator/product/index.dart';
import 'package:ai_rap_generator/product/data/settings_data.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:ai_rap_generator/product/widgets/settings/settings_container.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: CustomAppBar(
          title: 'Settings',
          isBackIcon: true,
          isCenterTitle: true,
          isAction: false),
      body: Padding(
        padding: context.normalPadding,
        child: Column(
          children: List.generate(
            settingsOptions.length,
            (index) {
              var option = settingsOptions[index];
              return SettingsContainer(
                title: option.title,
                useDecoration: option.useDecoration,
                onTap: () async {
                  if (option.onTap) {
                    if (option.uri != null) {
                      await launchUrl(option.uri!);
                    } else {
                      await launchUrll();
                    }
                  } else {
                    Navigation.push(context: context, page: option.page!);
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> launchUrll() async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
