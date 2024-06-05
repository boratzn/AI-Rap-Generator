import 'package:ai_rap_generator/product/gen/fonts.gen.dart';
import 'package:ai_rap_generator/product/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onMenuPressed,
    this.textStyle,
    required this.isBackIcon,
    required this.isCenterTitle,
    this.icon,
    required this.isAction,
    this.color,
  });

  final String title;
  final VoidCallback? onMenuPressed;
  final bool isBackIcon;
  final bool isCenterTitle;
  final TextStyle? textStyle;
  final Icon? icon;
  final bool isAction;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color ?? Color(0xFFFAFAFA),
      leading: isBackIcon
          ? GestureDetector(
              onTap: () => Navigation.ofPop(context),
              child: Icon(Icons.arrow_back_ios))
          : null,
      title: Text(
        title,
        style: textStyle ??
            TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w900,
                fontFamily: FontFamily.poppinsRegular),
      ),
      centerTitle: isCenterTitle,
      actions: isAction
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: GestureDetector(
                    onTap: onMenuPressed,
                    child: icon ??
                        Icon(
                          Icons.settings,
                          color: Colors.black,
                        )),
              ),
            ]
          : [],
    );
  }

  @override
  Widget get child =>
      IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios));

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
