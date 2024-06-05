import 'package:flutter/material.dart';

import '../../../index.dart';

//Text constants
final String contentTitle = 'Songs';
final String renameText = 'Rename';
final String deleteText = 'Delete';
final String cancelText = 'Cancel';

///Custom AlertDialog Texts
final String adPlaceHolderText = 'New Name';
final String adTitle = 'Rename ';
final String adContentText = 'Please enter a new name for this song';

///Custom Cupertino Menu Texts
final String cmShareText = 'Share';

///Delete Alert Dialog Texts
final String dAdTitle = 'Delete ';
final String dAdContentText =
    'Are you sure you want to delete this song?This action cannot be undone.';

//Padding constants
final EdgeInsets padding =
    const EdgeInsets.only(top: 36.0, left: 30, right: 30, bottom: 15);

//Style constants
TextStyle get customTextStyle => TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.poppinsRegular,
      color: Color(0xFF010101),
    );
