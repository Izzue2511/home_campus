import 'package:flutter/material.dart';import 'package:homecampus/core/app_export.dart';import 'package:homecampus/widgets/app_bar/appbar_circleimage.dart';import 'package:homecampus/widgets/app_bar/appbar_iconbutton.dart';import 'package:homecampus/widgets/app_bar/appbar_iconbutton_1.dart';import 'package:homecampus/widgets/app_bar/appbar_subtitle_2.dart';import 'package:homecampus/widgets/app_bar/custom_app_bar.dart';import 'package:homecampus/widgets/custom_button.dart';import 'package:homecampus/widgets/custom_icon_button.dart';class ChatRoomScreen extends StatelessWidget {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(51), leadingWidth: 73, leading: AppbarIconbutton(svgPath: ImageConstant.imgIcback, margin: getMargin(left: 36, top: 6, bottom: 6), onTap: () {onTapIcback7(context);}), title: Padding(padding: getPadding(left: 16), child: Row(children: [AppbarCircleimage(imagePath: ImageConstant.imgImage42x42), AppbarSubtitle2(text: "Kari Rasmussen", margin: getMargin(left: 11, top: 11, bottom: 10))])), actions: [AppbarIconbutton1(svgPath: ImageConstant.imgLink, margin: getMargin(left: 7), onTap: () {onTapLink(context);}), CustomIconButton(height: 50, width: 50, margin: getMargin(left: 12, right: 35), variant: IconButtonVariant.FillGray10001, shape: IconButtonShape.CircleBorder25, padding: IconButtonPadding.PaddingAll9, onTap: () {onTapBtnVideocall(context);}, child: CustomImageView(imagePath: ImageConstant.imgVideocall))]), body: Container(width: double.maxFinite, padding: getPadding(left: 35, right: 35), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Align(alignment: Alignment.center, child: Container(width: getHorizontalSize(55), padding: getPadding(left: 11, top: 2, right: 11, bottom: 2), decoration: AppDecoration.txtFillIndigoA100b2.copyWith(borderRadius: BorderRadiusStyle.txtCircleBorder10), child: Text("Today", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtLatoRegular12))), Align(alignment: Alignment.centerRight, child: Padding(padding: getPadding(left: 84, top: 25), child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [Padding(padding: getPadding(top: 29), child: Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.start, children: [CustomImageView(imagePath: ImageConstant.imgFrame, height: getSize(20), width: getSize(20)), Padding(padding: getPadding(top: 2), child: Text("14:22", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFProDisplayRegular13.copyWith(letterSpacing: getHorizontalSize(0.26))))])), Expanded(child: Container(margin: getMargin(left: 8, bottom: 1), padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), decoration: AppDecoration.outlineDeeppurpleA7003d1.copyWith(borderRadius: BorderRadiusStyle.customBorderTL10), child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [Container(width: getHorizontalSize(177), margin: getMargin(top: 2, right: 1), child: Text("Hi! May I know about your property’s neighborhood?", maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtSFProDisplayRegular16.copyWith(letterSpacing: getHorizontalSize(0.21))))])))]))), Padding(padding: getPadding(left: 1, top: 30, right: 83), child: Row(children: [Expanded(child: Container(margin: getMargin(bottom: 1), padding: getPadding(left: 20, top: 10, right: 20, bottom: 10), decoration: AppDecoration.outlineGray300.copyWith(borderRadius: BorderRadiusStyle.customBorderTL10), child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: [Container(width: getHorizontalSize(176), margin: getMargin(top: 2, right: 2), child: Text("Sure, man! You can check it from the description section of the property.", maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtSFProDisplayRegular16Gray90001.copyWith(letterSpacing: getHorizontalSize(0.21))))]))), Padding(padding: getPadding(left: 8, top: 72), child: Text("14:24", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFProDisplayRegular13.copyWith(letterSpacing: getHorizontalSize(0.26))))])), Align(alignment: Alignment.centerRight, child: Padding(padding: getPadding(left: 84, top: 30), child: Row(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: getPadding(top: 8), child: Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.start, children: [CustomImageView(imagePath: ImageConstant.imgFrame, height: getSize(20), width: getSize(20)), Padding(padding: getPadding(top: 2), child: Text("14:28", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFProDisplayRegular13.copyWith(letterSpacing: getHorizontalSize(0.26))))])), Expanded(child: CustomButton(text: "I see, thanks for informing!", margin: getMargin(left: 8, bottom: 1), variant: ButtonVariant.OutlineDeeppurpleA7003d_1, shape: ButtonShape.CustomBorderTL10, padding: ButtonPadding.PaddingAll12, fontStyle: ButtonFontStyle.SFProDisplayRegular16))]))), Padding(padding: getPadding(left: 1, top: 30, right: 82, bottom: 5), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: CustomButton(height: getVerticalSize(45), text: "Thanks for contacting me!", margin: getMargin(bottom: 1), variant: ButtonVariant.OutlineGray300, shape: ButtonShape.CustomBorderTL10, padding: ButtonPadding.PaddingAll12, fontStyle: ButtonFontStyle.SFProDisplayRegular16Gray90001)), Padding(padding: getPadding(left: 8, top: 30), child: Text("14:30", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFProDisplayRegular13.copyWith(letterSpacing: getHorizontalSize(0.26))))]))])), bottomNavigationBar: Padding(padding: getPadding(left: 56, right: 40, bottom: 21), child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Expanded(child: Container(margin: getMargin(top: 8, bottom: 11), decoration: AppDecoration.outlineIndigoA1001.copyWith(borderRadius: BorderRadiusStyle.circleBorder26), child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [CustomImageView(imagePath: ImageConstant.imgSmilebeam, height: getSize(20), width: getSize(20), margin: getMargin(top: 5, bottom: 3)), Padding(padding: getPadding(left: 14, top: 8, bottom: 3), child: Text("Type a message", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtLatoRegular13)), CustomImageView(imagePath: ImageConstant.imgAttach, height: getSize(28), width: getSize(28), margin: getMargin(left: 66)), CustomImageView(imagePath: ImageConstant.imgCamera20x20, height: getSize(20), width: getSize(20), margin: getMargin(top: 5, bottom: 3), onTap: () {onTapImgCamera(context);})]))), CustomIconButton(height: 48, width: 48, margin: getMargin(left: 32), variant: IconButtonVariant.FillIndigoA100, shape: IconButtonShape.CircleBorder25, padding: IconButtonPadding.PaddingAll9, child: CustomImageView(imagePath: ImageConstant.imgGroup166))])))); } 
onTapImgCamera(BuildContext context) { Navigator.pushNamed(context, AppRoutes.cameraScreen); } 
onTapIcback7(BuildContext context) { Navigator.pushNamed(context, AppRoutes.chatScreen); } 
onTapLink(BuildContext context) { Navigator.pushNamed(context, AppRoutes.audioCallScreen); } 
onTapBtnVideocall(BuildContext context) { Navigator.pushNamed(context, AppRoutes.videoCallScreen); } 
 }