import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rct/common%20copounents/main_button.dart';
import 'package:rct/constants/constants.dart';

class ShowPopUp extends StatelessWidget {
  final Widget title;
  final Widget content;
  void Function()? ontap;
  bool? showbutton;

  ShowPopUp({
    super.key,
    required this.title,
    required this.content,
    this.ontap,
    this.showbutton = true,
  });

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return AlertDialog(
      title: title,
      content: content,
      actions: showbutton!
          ? [
              MainButton(
                text: local.ok,
                backGroundColor: primaryColor,
                onTap: ontap,
              ),
      ]
          : null,
    );
  }
}
