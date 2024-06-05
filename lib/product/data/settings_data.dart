import 'package:ai_rap_generator/feature/inapp/view/in_app_view.dart';
import 'package:ai_rap_generator/product/model/settings.dart';

List<SettingsModel> settingsOptions = [
  SettingsModel(
      title: 'Get Premium',
      useDecoration: true,
      page: InAppView(),
      onTap: false),
  SettingsModel(title: 'Terms of Use', useDecoration: false, onTap: true),
  SettingsModel(
      title: 'Contact Us',
      useDecoration: false,
      onTap: true,
      uri: Uri(
        scheme: 'mailto',
        path: 'support@neonapps.co',
        queryParameters: {'subject': 'Help', 'body': ''},
      )),
  SettingsModel(title: 'Privacy Policy', useDecoration: false, onTap: true),
  SettingsModel(title: 'Restore Purchase', useDecoration: false, onTap: true),
  SettingsModel(
      title: 'Help', useDecoration: false, page: InAppView(), onTap: false),
];
