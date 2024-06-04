import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/constants/constants.dart';

class PartnersScreen extends StatelessWidget {
  const PartnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    final List<String> imagePaths = [
      "$iconsPath/Frame 117.png",
      "$iconsPath/Frame 118.png",
      "$iconsPath/Frame 119.png",
      "$iconsPath/Frame 120.png",
      "$iconsPath/Frame 121.png",
      "$iconsPath/Frame 117.png",
      "$iconsPath/Frame 118.png",
      "$iconsPath/Frame 119.png",
      "$iconsPath/Frame 120.png",
      "$iconsPath/Frame 121.png",
    ];
    return Scaffold(
      appBar: BackButtonAppBar(context),
      body: Center(
        child: Column(
          children: [
            Text(
              local.successPartners,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: mainFontWeight,
                  ),
            ),
            SizedBox(
              height: 600.h,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10, // Adjust this value
                  mainAxisSpacing: 10, // Adjust this value
                  childAspectRatio: 2,
                ),
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                itemCount: imagePaths.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.fitWidth,
                    height: 70,
                    width: 200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
