import 'package:flutter/material.dart';import 'package:homecampus/core/app_export.dart';import 'package:homecampus/widgets/app_bar/appbar_iconbutton.dart';import 'package:homecampus/widgets/app_bar/appbar_title.dart';import 'package:homecampus/widgets/app_bar/custom_app_bar.dart';import 'package:homecampus/widgets/custom_button.dart';class TwoFoctorAuthenticationHouseOwnerScreen extends StatelessWidget {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(47), leadingWidth: 69, leading: AppbarIconbutton(svgPath: ImageConstant.imgIcback, margin: getMargin(left: 32, top: 5, bottom: 5), onTap: () {onTapIcback18(context);}), centerTitle: true, title: AppbarTitle(text: "2FA")), body: Container(width: double.maxFinite, padding: getPadding(left: 32, top: 21, right: 32, bottom: 21), child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Padding(padding: getPadding(left: 11), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Padding(padding: getPadding(top: 5, bottom: 4), child: Text("Remember me", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtLatoMedium17)), CustomImageView(svgPath: ImageConstant.imgVolume, height: getVerticalSize(31), width: getHorizontalSize(51))])), Padding(padding: getPadding(left: 11, top: 23, bottom: 5), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Padding(padding: getPadding(top: 6, bottom: 4), child: Text("Two-factor Authetication", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtLatoMedium17)), CustomButton(height: getVerticalSize(32), width: getHorizontalSize(97), text: "Change 2FA", shape: ButtonShape.RoundedBorder15, padding: ButtonPadding.PaddingAll6, fontStyle: ButtonFontStyle.LatoSemiBold12)]))])))); } 
onTapIcback18(BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileHouseOwnerScreen); } 
 }
