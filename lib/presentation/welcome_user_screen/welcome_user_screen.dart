import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';

class WelcomeUserScreen extends StatelessWidget {
 @override Widget build(BuildContext context) {
  return SafeArea(child: Scaffold(
      backgroundColor: ColorConstant.black900,
      body: Container(width: double.maxFinite,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               Expanded(child: SingleChildScrollView(
                   child: Container(
                       height: getVerticalSize(825),
                       width: double.maxFinite,
                       child: Stack(alignment: Alignment.bottomCenter,
                           children: [Align(
                               alignment: Alignment.topCenter,
                               child: Container(height: getVerticalSize(570),
                                   width: double.maxFinite,
                                   child: Stack(alignment: Alignment.topRight,
                                       children: [CustomImageView(
                                           imagePath: ImageConstant.imgBulgariresortbali,
                                           height: getVerticalSize(570),
                                           width: getHorizontalSize(415),
                                           alignment: Alignment.center),
                                        Align(
                                            alignment: Alignment.topRight,
                                            child: Container(
                                                margin: getMargin(top: 155, right: 95),
                                                decoration: AppDecoration.txtOutlineBlack9003f2,
                                            )
                                        )
                                       ]
                                   )
                               )
                           ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: getPadding(left: 35, top: 70, right: 35, bottom: 70),
                                    decoration: AppDecoration.fillIndigoA100.copyWith(borderRadius: BorderRadiusStyle.customBorderTL500),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [Padding(
                                            padding: getPadding(left: 20),
                                            child: Text(
                                                "Welcome", overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                style: AppStyle.txtPoppinsBold48)),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(padding: getPadding(top: 10),
                                                  child: Text("Hi, kindly choose your type of user...",
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left, style: AppStyle.txtPoppinsMedium18))),
                                          CustomButton(
                                              height: getVerticalSize(60),
                                              text: "Student",
                                              margin: getMargin(left: 0, top: 30),
                                              variant: ButtonVariant.OutlineWhiteA700,
                                              shape: ButtonShape.CircleBorder29,
                                              padding: ButtonPadding.PaddingAll19,
                                              fontStyle: ButtonFontStyle.PoppinsMedium18,
                                              onTap: () {onTapStudent(context);}
                                          ),
                                          CustomButton(
                                              height: getVerticalSize(60),
                                              text: "House Owner",
                                              margin: getMargin(left: 0, top: 30),
                                              variant: ButtonVariant.OutlineWhiteA700,
                                              shape: ButtonShape.CircleBorder29,
                                              padding: ButtonPadding.PaddingAll19,
                                              fontStyle: ButtonFontStyle.PoppinsMedium18,
                                              onTap: () {onTapHouseowner(context);}
                                          ),
                                          CustomButton(
                                              height: getVerticalSize(60),
                                              text: "Admin",
                                              margin: getMargin(left: 0, top: 30),
                                              variant: ButtonVariant.OutlineWhiteA700,
                                              shape: ButtonShape.CircleBorder29,
                                              padding: ButtonPadding.PaddingAll19,
                                              fontStyle: ButtonFontStyle.PoppinsMedium18,
                                              onTap: () {onTapAdmin(context);}
                                          ),
                                        ]
                                    )
                                )
                            ),
                             CustomImageView(
                               imagePath: ImageConstant.imgGroup1000003418,
                               height: getVerticalSize(200),
                               width: getHorizontalSize(225),
                               margin: getMargin(bottom: 625),
                             )
                           ]
                       )
                   )
               )
               )
              ]
          )
      )
  )); }
onTapAdmin(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.loginAdminScreen); }
onTapHouseowner(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.loginHouseOwnerScreen); }
onTapStudent(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.loginStudentScreen); }
 }
