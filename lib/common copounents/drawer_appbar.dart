import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rct/constants/constants.dart';

PreferredSizeWidget DrawerAppBar(
    BuildContext context, String title, Scaffold scaffold) {
  return PreferredSize(
    preferredSize: Size.fromHeight(50.h),
    child: AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: SvgPicture.asset("$iconsPath/Drawer_icon.svg"),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
