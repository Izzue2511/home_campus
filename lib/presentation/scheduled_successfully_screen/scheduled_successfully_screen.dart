import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';

class ScheduledSuccessfullyScreen extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstant.whiteA700,
          body: Container(
              width: double.maxFinite,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Expanded(
                      child: SingleChildScrollView(
                          padding: getPadding(top: 39),
                          child: Padding(
                              padding: getPadding(left: 31, right: 30, bottom: 337),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [Card(
                                      clipBehavior: Clip.antiAlias,
                                      elevation: 0,
                                      margin: EdgeInsets.all(0),
                                      color: ColorConstant.teal50,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadiusStyle.circleBorder78),
                                      child: Container(
                                          height: getSize(156),
                                          width: getSize(156),
                                          padding: getPadding(left: 42, top: 41, right: 42, bottom: 41),
                                          decoration: AppDecoration.fillTeal50.copyWith(borderRadius: BorderRadiusStyle.circleBorder78),
                                          child: Stack(
                                              children: [CustomImageView(
                                                  svgPath: ImageConstant.imgThumbsup,
                                                  height: getVerticalSize(69),
                                                  width: getHorizontalSize(72),
                                                  alignment: Alignment.topCenter)]))),
                                   Padding(
                                       padding: getPadding(top: 11),
                                       child: Text(
                                           "Thank You !",
                                           overflow: TextOverflow.ellipsis,
                                           textAlign: TextAlign.left,
                                           style: AppStyle.txtRubikMedium38)),
                                   Padding(
                                       padding: getPadding(top: 10),
                                       child: Text(
                                           "Scheduled Successfully",
                                           overflow: TextOverflow.ellipsis,
                                           textAlign: TextAlign.left,
                                           style: AppStyle.txtRubikRegular20)),
                                   Container(
                                       width: getHorizontalSize(249),
                                       margin: getMargin(left: 49, top: 43, right: 53),
                                       child: Text(
                                           "Waiting for scheduled confirmation from house owner...",
                                           maxLines: null,
                                           textAlign: TextAlign.center,
                                           style: AppStyle.txtRubikRegular14)),
                                   CustomButton(
                                       height: getVerticalSize(54),
                                       text: "Done",
                                       margin: getMargin(top: 51),
                                       fontStyle: ButtonFontStyle.RubikMedium18,
                                       onTap: () {onTapDone(context);})
                                  ]
                              )
                          )
                      )
                  )
                  ]
              )
          )
      )
  );
 }
onTapDone(BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
 }
