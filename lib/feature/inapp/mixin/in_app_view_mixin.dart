import 'dart:async';

import 'package:ai_rap_generator/feature/index.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../product/index.dart';

mixin InAppMixin<T extends StatefulWidget> on State<T> {
  int currentIndex = -1;
  bool isClicked = false;

  List<String> footerItems = [
    'Terms of Use',
    'Restore Purchase',
    'Privacy Policy',
  ];

  List<String> paymentOptions = [
    'Weekly',
    'Monthly',
    'Annual',
  ];

  ///Create custom appBar
  AppBar customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFAFAFA),
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void clicked(int index) {
    return setState(() {
      currentIndex = index;
      isClicked = true;
    });
  }

  List<Widget> get buildPaymentOptions => List.generate(
        paymentOptions.length,
        (index) => PaymentOptionContainer(
          title: paymentOptions[index],
          price: "40",
          onTap: () => clicked(index),
          isClicked: currentIndex == index ? true : false,
        ),
      );

  Future<void> getPremium(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPremium', true);
    Navigation.pushReplace(context: context, page: HomePageView());
  }

  Future<void> launchUrll() async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
