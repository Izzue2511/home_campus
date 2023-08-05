import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';

class CameraOwnerScreen extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return SafeArea(
   child: Scaffold(
    extendBody: true,
    extendBodyBehindAppBar: true,
    backgroundColor: ColorConstant.whiteA700,
    body: Container(
     width: size.width,
     height: size.height,
     decoration: BoxDecoration(
      color: ColorConstant.whiteA700,
      image: DecorationImage(
       image: AssetImage(ImageConstant.imgCamera832x414),
       fit: BoxFit.cover,
      ),
     ),
     child: Container(
      width: double.maxFinite,
      padding: getPadding(left: 21, top: 20, right: 21, bottom: 20),
      child: Column(
       mainAxisSize: MainAxisSize.min,
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
        CustomIconButton(
         height: 39,
         width: 39,
         onTap: () {
          onTapBtnIcback(context);
         },
         child: CustomImageView(svgPath: ImageConstant.imgIcback),
        ),
        Spacer(),
        Align(
         alignment: Alignment.center,
         child: Padding(
          padding: getPadding(left: 24, right: 23, bottom: 42),
          child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
            CustomIconButton(
             height: 69,
             width: 69,
             margin: getMargin(top: 10, bottom: 10),
             variant: IconButtonVariant.FillWhiteA70087,
             shape: IconButtonShape.RoundedBorder32,
             padding: IconButtonPadding.PaddingAll14,
             child: CustomImageView(
              svgPath: ImageConstant.imgCarbonflashBlack90001,
             ),
            ),
            Container(
             height: getVerticalSize(90),
             width: getHorizontalSize(91),
             decoration: BoxDecoration(
              color: ColorConstant.whiteA70087,
              borderRadius: BorderRadius.circular(
               getHorizontalSize(45),
              ),
              border: Border.all(
               color: ColorConstant.indigoA100,
               width: getHorizontalSize(6),
               // Set the strokeAlign property to a valid value
               strokeAlign: BorderSide.strokeAlignInside,
              ),
             ),
            ),
            CustomIconButton(
             height: 69,
             width: 69,
             margin: getMargin(top: 10, bottom: 10),
             variant: IconButtonVariant.FillWhiteA7008c,
             shape: IconButtonShape.RoundedBorder32,
             padding: IconButtonPadding.PaddingAll14,
             child: CustomImageView(
              svgPath: ImageConstant.imgCarbonflash,
             ),
            ),
           ],
          ),
         ),
        ),
       ],
      ),
     ),
    ),
   ),
  );
 }

 onTapBtnIcback(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.chatRoomOwnerScreen);
 }
}

