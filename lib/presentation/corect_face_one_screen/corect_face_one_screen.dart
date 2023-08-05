import 'package:flutter/material.dart';import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;import 'package:homecampus/core/app_export.dart';import 'package:homecampus/widgets/custom_icon_button.dart';class CorectFaceOneScreen extends StatelessWidget {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(extendBody: true, extendBodyBehindAppBar: true, backgroundColor: ColorConstant.gray90005, body: Container(width: size.width, height: size.height, decoration: BoxDecoration(color: ColorConstant.gray90005, image: DecorationImage(image: AssetImage(ImageConstant.imgFaceoval), fit: BoxFit.cover)), child: Container(width: double.maxFinite, child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start, children: [Container(width: double.maxFinite, child: Container(width: getHorizontalSize(413), padding: getPadding(left: 38, top: 34, right: 38, bottom: 34), decoration: BoxDecoration(image: DecorationImage(image: AssetImage(ImageConstant.imgGroup58), fit: BoxFit.cover)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [CustomIconButton(height: 37, width: 37, onTap: () {onTapBtnIcback(context);}, child: CustomImageView(svgPath: ImageConstant.imgIcback)), Align(alignment: Alignment.center, child: Container(margin: getMargin(left: 19, top: 32, right: 17, bottom: 313), padding: getPadding(left: 21, top: 122, right: 21, bottom: 122), decoration: BoxDecoration(image: DecorationImage(image: fs.Svg(ImageConstant.imgGroup80), fit: BoxFit.cover)), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text("Turn your head left", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoMedium30), CustomImageView(svgPath: ImageConstant.imgTurnarrowleft, height: getVerticalSize(29), width: getHorizontalSize(74), margin: getMargin(top: 16)), Padding(padding: getPadding(top: 17), child: Text("then face forward", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoMedium30))])))])))]))))); } 
onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.corectFaceScreen); } 
 }