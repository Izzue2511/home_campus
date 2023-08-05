import 'package:flutter/material.dart';import 'package:homecampus/core/app_export.dart';import 'package:homecampus/widgets/custom_button.dart';class UnarchiveConfirmHouseBottomsheet extends StatelessWidget {@override Widget build(BuildContext context) { return SingleChildScrollView(child: SingleChildScrollView(child: Container(padding: getPadding(left: 34, top: 21, right: 34, bottom: 21), decoration: AppDecoration.fillWhiteA700.copyWith(borderRadius: BorderRadiusStyle.customBorderTL30), child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [SizedBox(width: getHorizontalSize(56), child: Divider(height: getVerticalSize(3), thickness: getVerticalSize(3), color: ColorConstant.gray400)), Padding(padding: getPadding(top: 17), child: Text("Unarchive", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtLatoSemiBold24IndigoA100)), Padding(padding: getPadding(top: 21), child: Divider(height: getVerticalSize(2), thickness: getVerticalSize(2), color: ColorConstant.gray4007f)), Padding(padding: getPadding(top: 36), child: Text("Are you sure you want to unarchive?", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtLatoSemiBold20)), Container(margin: getMargin(left: 18, top: 43, right: 18, bottom: 54), decoration: AppDecoration.outlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.roundedBorder18), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Expanded(child: CustomButton(height: getVerticalSize(48), text: "Cancel", margin: getMargin(right: 15), variant: ButtonVariant.FillIndigoA10075, shape: ButtonShape.RoundedBorder20, fontStyle: ButtonFontStyle.LatoBold17, onTap: () {onTapCancel(context);})), Expanded(child: CustomButton(height: getVerticalSize(48), text: "Yes, unarchive", margin: getMargin(left: 15), shape: ButtonShape.RoundedBorder20, fontStyle: ButtonFontStyle.LatoBold17, onTap: () {onTapYesunarchive(context);}))]))])))); } 
onTapCancel(BuildContext context) { Navigator.pushNamed(context, AppRoutes.archiveHomeHouseOwnerScreen); } 
onTapYesunarchive(BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeHouseOwnerScreen); } 
 }
