import '../search_screen_owner_screen/widgets/houselisted1_item_widget.dart';import 'package:flutter/material.dart';import 'package:homecampus/core/app_export.dart';import 'package:homecampus/widgets/app_bar/appbar_iconbutton.dart';import 'package:homecampus/widgets/app_bar/appbar_iconbutton_2.dart';import 'package:homecampus/widgets/app_bar/appbar_image.dart';import 'package:homecampus/widgets/app_bar/appbar_subtitle_5.dart';import 'package:homecampus/widgets/app_bar/custom_app_bar.dart';import 'package:homecampus/widgets/custom_button.dart';import 'package:outline_gradient_button/outline_gradient_button.dart';class SearchScreenOwnerScreen extends StatelessWidget {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.gray50, body: Container(height: getVerticalSize(775), width: getHorizontalSize(375), child: Stack(alignment: Alignment.topCenter, children: [Align(alignment: Alignment.bottomCenter, child: Container(margin: getMargin(left: 6, top: 118, right: 4), decoration: AppDecoration.outlineBlack9003f, child: ListView.separated(physics: BouncingScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(13));}, itemCount: 2, itemBuilder: (context, index) {return Houselisted1ItemWidget();}))), Align(alignment: Alignment.topCenter, child: Container(padding: getPadding(top: 14, bottom: 14), decoration: AppDecoration.outlineGray50026, child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.end, children: [CustomAppBar(height: getVerticalSize(60), leadingWidth: 75, leading: AppbarIconbutton(svgPath: ImageConstant.imgIcback, margin: getMargin(left: 38, top: 5, bottom: 2), onTap: () {onTapIcback19(context);}), title: Container(height: getVerticalSize(44), width: getHorizontalSize(248), margin: getMargin(right: 46), decoration: AppDecoration.stack35, child: Stack(children: [AppbarImage(height: getVerticalSize(44), width: getHorizontalSize(248), svgPath: ImageConstant.imgShape), Padding(padding: getPadding(left: 10, top: 15, right: 40, bottom: 13), child: Row(children: [AppbarImage(height: getSize(11), width: getSize(11), svgPath: ImageConstant.imgSearch, margin: getMargin(bottom: 3)), AppbarSubtitle5(text: "Search House, Apartment, etc", margin: getMargin(left: 10))]))])), actions: [Container(margin: getMargin(left: 214, top: 3, bottom: 3), decoration: AppDecoration.stack35, child: Row(children: [SizedBox(height: getVerticalSize(38), child: VerticalDivider(width: getHorizontalSize(1), thickness: getVerticalSize(1), color: ColorConstant.whiteA7006c, indent: getHorizontalSize(2))), AppbarImage(height: getSize(20), width: getSize(20), svgPath: ImageConstant.imgMicrophone, margin: getMargin(left: 6, top: 8, bottom: 10)), AppbarIconbutton2(svgPath: ImageConstant.imgSettingsWhiteA700, margin: getMargin(left: 14))]))]), Padding(padding: getPadding(left: 28, top: 15, right: 28), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Padding(padding: getPadding(bottom: 2), child: Text("Showing 72 results", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFProDisplayMedium18.copyWith(letterSpacing: getHorizontalSize(0.36)))), Spacer(), CustomImageView(svgPath: ImageConstant.imgMenu, height: getSize(24), width: getSize(24)), Padding(padding: getPadding(left: 8, top: 4, bottom: 3), child: Text("Sort", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFProDisplayRegular14Gray90001.copyWith(letterSpacing: getHorizontalSize(0.28))))]))])))])), bottomNavigationBar: Padding(padding: getPadding(left: 31, right: 29, bottom: 14), child: OutlineGradientButton(padding: EdgeInsets.only(left: getHorizontalSize(1), top: getVerticalSize(1), right: getHorizontalSize(1), bottom: getVerticalSize(1)), strokeWidth: getHorizontalSize(1), gradient: LinearGradient(begin: Alignment(0, 0.05), end: Alignment(0.93, 1), colors: [ColorConstant.indigoA10001, ColorConstant.deepPurpleA200]), corners: Corners(topLeft: Radius.circular(24), topRight: Radius.circular(24), bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)), child: CustomButton(text: "Show more results", margin: getMargin(left: 31, right: 29, bottom: 14), variant: ButtonVariant.Outline, shape: ButtonShape.RoundedBorder25, fontStyle: ButtonFontStyle.SFProDisplaySemibold16))))); } 
onTapIcback19(BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeHouseOwnerScreen); } 
 }
