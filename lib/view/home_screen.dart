import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/common%20copounents/pop_up.dart';
import 'package:rct/constants/routes_config.dart';
import 'package:rct/main.dart';
import 'package:rct/view/auth/login_screen.dart';
import 'package:rct/view/calculations%20and%20projects/measurment_of_field_screen.dart';
import 'package:rct/view/edit_profile_screen.dart';
import 'package:rct/view/notification%20screens/notifications_screen.dart';
import 'package:rct/view/zeft.dart';

class HomeScreen extends StatelessWidget {
  static String id = "HomeScreen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (BuildContext context) => InkWell(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Image.asset(
                "$iconsPath/drawer-icon.png",
              ),
            ),
            onTap: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          "مرحبا",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: whiteBackGround,
              ),
        ),
        actions: [
          InkWell(
            onTap: () =>
                Navigator.of(context).pushNamed(NotificationsScreen.screenId),
            child: Icon(
              Icons.notifications_none,
              color: whiteBackGround,
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      drawer: Drawer(
        backgroundColor: whiteBackGround,
        surfaceTintColor: whiteBackGround,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 10.w,
                top: 50.h,
                bottom: 20.h,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: SvgPicture.asset("$iconsPath/1.svg"),
                    ),
                    const SizedBox(height: 10),
                    // Text(
                    //   "بدرية الذبياني",
                    //   style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    // ),
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(const EditProfileScreen().screenId),
                      child: Text(
                        "تعديل الملف ",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Colors.blue,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //
            ListTile(
              title: const Text(
                "الطلبات",
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              leading: SvgPicture.asset("$iconsPath/1.svg"),
              titleTextStyle: Theme.of(context).textTheme.titleMedium,
              onTap: () => Navigator.of(context).pushNamed(name.id),
            ),

            const Divider(),

            ListTile(
              title: const Text("المفضلة"),
              leading: SvgPicture.asset("$iconsPath/2.svg"),
              titleTextStyle: Theme.of(context).textTheme.titleMedium,
              onTap: () => Navigator.of(context).pushNamed(name.id),
            ),

            const Divider(),
            ListTile(
              title: const Text("من نحن"),
              leading: SvgPicture.asset("$iconsPath/3.svg"),
              titleTextStyle: Theme.of(context).textTheme.titleMedium,
              onTap: () => Navigator.of(context).pushNamed(name.id),
            ),

            const Divider(),
            ListTile(
              title: const Text("السياسة والخصوصية"),
              leading: SvgPicture.asset("$iconsPath/Vector.svg"),
              titleTextStyle: Theme.of(context).textTheme.titleMedium,
              onTap: () => Navigator.of(context).pushNamed(name.id),
            ),

            const Divider(),
            ListTile(
              title: const Text("الشروط والآحكام"),
              leading: SvgPicture.asset("$iconsPath/Vector-1.svg"),
              titleTextStyle: Theme.of(context).textTheme.titleMedium,
              onTap: () => Navigator.of(context).pushNamed(name.id),
            ),
            const Divider(),
            ListTile(
              title: const Text("مساعدة"),
              leading: SvgPicture.asset("$iconsPath/Vector-2.svg"),
              titleTextStyle: Theme.of(context).textTheme.titleMedium,
              onTap: () => Navigator.of(context).pushNamed(name.id),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Image.asset(
                      "$iconsPath/icons8-whatsapp-50 (1).png",
                      width: 30.w,
                      height: 30.h,
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Image.asset(
                      "$iconsPath/icons8-facebook-50 (1).png",
                      width: 30.w,
                      height: 30.h,
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: Image.asset(
                      "$iconsPath/icons8-twitter-50 (1).png",
                      width: 30.w,
                      height: 30.h,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                "تسجيل الخروج",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              leading: SvgPicture.asset("$iconsPath/Vector-4.svg"),
              titleTextStyle: Theme.of(context).textTheme.titleMedium,
              onTap: () async {
                await secureStorage.deleteAll();
                Navigator.of(context).pushReplacementNamed(LoginScreen.id);
                // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
            const Divider(),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryColor,
              ),
            ),
          ),
          Positioned.fill(
            top: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      "$iconsPath/logo_without_text-icon.png",
                      height: 100.h,
                    ),
                    SizedBox(
                      height: 100.h,
                      child: Card(
                        color: whiteBackGround,
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          title: Text(
                            "الحاسبة و المشاريع",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          leading: Image.asset(
                            "$iconsPath/projectsAndCalc-icon.png",
                            width: 50.w,
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                          onTap: () => showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return ShowPopUp(
                                  title: const Text(
                                      "التكلفة التقريبية كافة التفاصيل والرسوم:"),
                                  content: const Text(
                                      "البناء + الإستشارة + المخططات + التأمين + أعمال السور والخزانات والصرف الصحي و الحفر والردم والترحيل كما أن كافة المنتجات المستخدمة ذات جودة عالية مع توفير الضمانات اللازمة"),
                                  ontap: () => Navigator.of(context)
                                      .pushNamed(MeasurmentOfFieldScreen.id),
                                );
                              }),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.designAndScreen),
                      child: SizedBox(
                        height: 100.h,
                        child: Card(
                          color: whiteBackGround,
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text(
                              "المخططات و التصاميم",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            leading: Image.asset(
                              "$iconsPath/rafiki.png",
                              width: 50,
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.pushNamed(
                          context, AppRoutes.partnersScreen),
                      child: SizedBox(
                        height: 100.h,
                        child: Card(
                          color: whiteBackGround,
                          margin: const EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListTile(
                            title: Text(
                              "شركاء النجاح",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            leading: Image.asset(
                              "$iconsPath/rafiki2.png",
                              width: 50.w,
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
