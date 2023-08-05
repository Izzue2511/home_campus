import 'package:flutter/material.dart';import 'package:homecampus/core/app_export.dart';import 'package:homecampus/widgets/custom_button.dart';import 'package:homecampus/widgets/custom_icon_button.dart';class TakeASelfieScreen extends StatelessWidget {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.gray90005, body: Container(width: double.maxFinite, padding: getPadding(left: 38, top: 35, right: 38, bottom: 35), child: Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.start, children: [CustomIconButton(height: 37, width: 37, alignment: Alignment.centerLeft, onTap: () {onTapBtnIcback(context);}, child: CustomImageView(svgPath: ImageConstant.imgIcback)), Padding(padding: getPadding(top: 61, right: 76), child: Text("Take a selfie", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanMedium25)), Padding(padding: getPadding(top: 7, right: 49), child: Text("We’ll compare it with your IC Card", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRegular13)), Padding(padding: getPadding(left: 57, top: 147, right: 34), child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [CustomIconButton(height: 32, width: 32, margin: getMargin(top: 1, bottom: 3), variant: IconButtonVariant.FillIndigoA100, padding: IconButtonPadding.PaddingAll6, child: CustomImageView(svgPath: ImageConstant.imgCar)), Expanded(child: Container(width: getHorizontalSize(207), margin: getMargin(left: 7), child: Text("Face forward and make sure your eyes  are clearly visible", maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular14)))])), Padding(padding: getPadding(left: 57, top: 27, right: 28), child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [CustomIconButton(height: 32, width: 32, variant: IconButtonVariant.FillIndigoA100, padding: IconButtonPadding.PaddingAll6, child: CustomImageView(svgPath: ImageConstant.imgCarWhiteA700)), Padding(padding: getPadding(left: 7, top: 9, bottom: 5), child: Text("Remove your glasses, if necessary", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular14))])), Spacer(), CustomButton(height: getVerticalSize(38), width: getHorizontalSize(153), text: "Take Selfie", margin: getMargin(right: 70, bottom: 100), shape: ButtonShape.RoundedBorder15, padding: ButtonPadding.PaddingAll12, fontStyle: ButtonFontStyle.RobotoRomanRegular14, onTap: () {onTapTakeselfie(context);})])))); } 
onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.icVerificationScreen); } 
onTapTakeselfie(BuildContext context) { Navigator.pushNamed(context, AppRoutes.startRecordScreen); } 
 }