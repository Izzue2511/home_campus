import 'package:flutter/material.dart';import 'package:homecampus/core/app_export.dart';import 'package:homecampus/widgets/custom_icon_button.dart';class VideoCallOwnerScreen extends StatelessWidget {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(extendBody: true, extendBodyBehindAppBar: true, backgroundColor: ColorConstant.black90001, body: Container(width: size.width, height: size.height, decoration: BoxDecoration(color: ColorConstant.black90001, image: DecorationImage(image: AssetImage(ImageConstant.imgVideocall832x414), fit: BoxFit.cover)), child: Container(width: double.maxFinite, padding: getPadding(all: 32), child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [CustomIconButton(height: 37, width: 37, alignment: Alignment.centerLeft, onTap: () {onTapBtnIcback(context);}, child: CustomImageView(svgPath: ImageConstant.imgIcback)), Spacer(), Align(alignment: Alignment.centerRight, child: Container(height: getVerticalSize(198), width: getHorizontalSize(130), margin: getMargin(right: 6), child: Stack(alignment: Alignment.topRight, children: [CustomImageView(imagePath: ImageConstant.imgRectangle60, height: getVerticalSize(198), width: getHorizontalSize(130), radius: BorderRadius.circular(getHorizontalSize(25)), alignment: Alignment.center), CustomImageView(svgPath: ImageConstant.imgCarbonflash, height: getSize(32), width: getSize(32), alignment: Alignment.topRight, margin: getMargin(top: 7, right: 13))]))), Padding(padding: getPadding(top: 23), child: Text("20:23 mins", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtLatoSemiBold18)), Padding(padding: getPadding(left: 22, top: 22, right: 24, bottom: 24), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Card(clipBehavior: Clip.antiAlias, elevation: 0, margin: EdgeInsets.all(0), color: ColorConstant.whiteA70087, shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.roundedBorder32), child: Container(height: getSize(65), width: getSize(65), padding: getPadding(all: 11), decoration: AppDecoration.fillWhiteA70087.copyWith(borderRadius: BorderRadiusStyle.roundedBorder32), child: Stack(children: [CustomImageView(imagePath: ImageConstant.imgVoice, height: getSize(41), width: getSize(41), alignment: Alignment.center)]))), Card(clipBehavior: Clip.antiAlias, elevation: 0, margin: getMargin(left: 14), color: ColorConstant.whiteA70087, shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.roundedBorder32), child: Container(height: getSize(65), width: getSize(65), padding: getPadding(all: 11), decoration: AppDecoration.fillWhiteA70087.copyWith(borderRadius: BorderRadiusStyle.roundedBorder32), child: Stack(children: [CustomImageView(imagePath: ImageConstant.imgVideocall41x41, height: getSize(41), width: getSize(41), alignment: Alignment.center)]))), CustomIconButton(height: 65, width: 65, margin: getMargin(left: 14), variant: IconButtonVariant.FillWhiteA70087, shape: IconButtonShape.RoundedBorder32, padding: IconButtonPadding.PaddingAll14, child: CustomImageView(imagePath: ImageConstant.imgGroup175)), GestureDetector(onTap: () {onTapStackcalldiscon(context);}, child: Card(clipBehavior: Clip.antiAlias, elevation: 0, margin: getMargin(left: 14), color: ColorConstant.redA200, shape: RoundedRectangleBorder(borderRadius: BorderRadiusStyle.roundedBorder32), child: Container(height: getSize(65), width: getSize(65), padding: getPadding(all: 11), decoration: AppDecoration.fillRedA200.copyWith(borderRadius: BorderRadiusStyle.roundedBorder32), child: Stack(children: [CustomImageView(imagePath: ImageConstant.imgCalldisconnected, height: getSize(41), width: getSize(41), alignment: Alignment.center)]))))]))]))))); } 
onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.chatRoomOwnerScreen); } 
onTapStackcalldiscon(BuildContext context) { Navigator.pushNamed(context, AppRoutes.chatRoomOwnerScreen); } 
 }
