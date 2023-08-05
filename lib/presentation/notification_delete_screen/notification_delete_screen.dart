import '../notification_delete_screen/widgets/listtrash_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/presentation/chat_delete_page/chat_delete_page.dart';
import 'package:homecampus/presentation/notification_page/notification_page.dart';
import 'package:homecampus/presentation/saved_page/saved_page.dart';
import 'package:homecampus/presentation/scheduled_status_page/scheduled_status_page.dart';
import 'package:homecampus/widgets/custom_bottom_bar.dart';

class NotificationDeleteScreen extends StatelessWidget {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 22,
            top: 21,
            right: 22,
            bottom: 21,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Notification",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtMontserratRomanSemiBold16,
              ),
              Padding(
                padding: getPadding(
                  top: 27,
                ),
                child: Text(
                  "Today, September 24/2022",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtMontserratRomanMedium14,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: getPadding(
                    left: 1,
                    top: 14,
                  ),
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (
                      context,
                      index,
                    ) {
                      return SizedBox(
                        height: getVerticalSize(
                          17,
                        ),
                      );
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ListtrashItemWidget();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onChanged: (BottomBarEnum type) {
            Navigator.pushNamed(
                navigatorKey.currentContext!, getCurrentRoute(type));
          },
        ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.scheduledStatusPage;
      case BottomBarEnum.Explore:
        return "/";
      case BottomBarEnum.Chat:
        return AppRoutes.chatDeletePage;
      case BottomBarEnum.Saved:
        return AppRoutes.savedPage;
      case BottomBarEnum.Profile:
        return AppRoutes.notificationPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.scheduledStatusPage:
        return ScheduledStatusPage();
      case AppRoutes.chatDeletePage:
        return ChatDeletePage();
      case AppRoutes.savedPage:
        return SavedPage();
      case AppRoutes.notificationPage:
        return NotificationPage();
      default:
        return DefaultWidget();
    }
  }
}
