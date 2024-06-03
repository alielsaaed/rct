import 'package:flutter/material.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/view/home_screen.dart';

PreferredSize BackButtonAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      centerTitle: true,
      title: Image.asset(
        "$iconsPath/logo_without_text-icon.png",
        width: 100,
        height: 50,
      ),
      backgroundColor: primaryColor,
      leading: IconButton(
        onPressed: () {
          Navigator.canPop(context)
              ? Navigator.pop(context)
              : Navigator.of(context).pushNamed(HomeScreen.id);
        },
        icon: Icon(
          Icons.arrow_back_ios_new_sharp,
          color: whiteBackGround,
        ),
      ),
    ),
  );
}
