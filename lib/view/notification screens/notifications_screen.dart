import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rct/common%20copounents/app_bar_back_button.dart';
import 'package:rct/common%20copounents/notifi_container.dart';
import 'package:rct/constants/constants.dart';
import 'package:rct/view-model/cubits/notifications/notifications_cubit.dart';
import 'package:rct/view-model/functions/compare_date.dart';
import 'package:rct/view-model/functions/snackbar.dart';

class NotificationsScreen extends StatefulWidget {
  static String screenId = "NotificationsScreen";
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool isloading = false;

  var data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NotificationsCubit>().fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        if (state is NotificationsLoading) {
          isloading = true;
        } else if (state is NotificationsFailure) {
          isloading = false;
          showSnackBar(context, state.errMessage, redColor);
          return Center(
            child: Text(local.loadingError),
          );
        } else if (state is NotificationsSuccess) {
          isloading = false;
          data = state.notifications;
        }
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            appBar: BackButtonAppBar(context),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  data.isEmpty
                      ? Center(
                          child: Text(local.noNotifications),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: data.length,
                          itemBuilder: (context, index) => NotifiContainer(
                            blackText: data[index]["text"],
                            blueText: local.expiresIn3Days,
                            time: timeDifferenceFromNow(
                                data[index]["updated_at"]),
                            type: "payment",
                          ),
                  ),
                  // const NotifiContainer(
                  //   blackText: "لديك طلب سداد دفعة برقم طلب",
                  //   blueText: "85737685648 ينتهي خلال ٣ ايام",
                  //   time: "5د",
                  //   type: "payment",
                  // ),
                  // const NotifiContainer(
                  //   blackText: "تمت الموافقة على طلبك برقم",
                  //   blueText:
                  //       "85737685648 ولديك طلب رهن عقار ويجب الموافقه عليه خلال ٣ ايام بحد اقصى",
                  //   time: "6د",
                  //   type: "approval",
                  // ),
                  // const NotifiHistoryContainer(
                  //   blackText: "تمت الموافقة على طلبك برقم",
                  //   blueText: "85737685648 ",
                  //   time: "01/02/2024",
                  // ),
                  // const NotifiHistoryContainer(
                  //   blackText: "تمت الموافقة على طلبك برقم",
                  //   blueText: "85737685648 ",
                  //   time: "01/02/2024",
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
