import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../common copounents/app_bar_back_button.dart';
import '../common copounents/locale_provider.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    final provider = Provider.of<LocaleProvider>(context);
    final currentLocale = provider.locale;

    return Scaffold(
      appBar: BackButtonAppBar(context),
      body: Column(
        children: [
          ListTile(
            title: Text(local.arabic),
            trailing:
                currentLocale.languageCode == 'ar' ? Icon(Icons.check) : null,
            onTap: () {
              provider.setLocale(Locale('ar'));
            },
          ),
          const Divider(),
          ListTile(
            title: Text(local.english),
            trailing:
                currentLocale.languageCode == 'en' ? Icon(Icons.check) : null,
            onTap: () {
              provider.setLocale(Locale('en'));
            },
          ),
        ],
      ),
    );
  }
}
