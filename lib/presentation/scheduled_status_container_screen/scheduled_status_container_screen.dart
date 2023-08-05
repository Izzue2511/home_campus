import 'package:flutter/material.dart';import 'package:homecampus/core/app_export.dart';import 'package:homecampus/presentation/chat_delete_page/chat_delete_page.dart';import 'package:homecampus/presentation/notification_page/notification_page.dart';import 'package:homecampus/presentation/saved_page/saved_page.dart';import 'package:homecampus/presentation/scheduled_status_page/scheduled_status_page.dart';import 'package:homecampus/widgets/custom_bottom_bar.dart';
// ignore_for_file: must_be_immutable
class ScheduledStatusContainerScreen extends StatelessWidget {GlobalKey<NavigatorState> navigatorKey = GlobalKey();

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, body: Navigator(key: navigatorKey, initialRoute: AppRoutes.scheduledStatusPage, onGenerateRoute: (routeSetting) => PageRouteBuilder(pageBuilder: (ctx, ani, ani1) => getCurrentPage(routeSetting.name!), transitionDuration: Duration(seconds: 0))), bottomNavigationBar: CustomBottomBar(onChanged: (BottomBarEnum type) {Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));}))); } 
///Handling route based on bottom click actions
String getCurrentRoute(BottomBarEnum type) { switch (type) {case BottomBarEnum.Home: return AppRoutes.scheduledStatusPage; case BottomBarEnum.Explore: return "/"; case BottomBarEnum.Chat: return AppRoutes.chatDeletePage; case BottomBarEnum.Saved: return AppRoutes.savedPage; case BottomBarEnum.Profile: return AppRoutes.notificationPage; default: return "/";} } 
///Handling page based on route
Widget getCurrentPage(String currentRoute) { switch (currentRoute) {case AppRoutes.scheduledStatusPage: return ScheduledStatusPage(); case AppRoutes.chatDeletePage: return ChatDeletePage(); case AppRoutes.savedPage: return SavedPage(); case AppRoutes.notificationPage: return NotificationPage(); default: return DefaultWidget();} } 
 }
