import '../schedule_date_screen/widgets/listdate_item_widget.dart';
import '../schedule_date_screen/widgets/listtime_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/app_bar/appbar_iconbutton.dart';
import 'package:homecampus/widgets/app_bar/appbar_subtitle.dart';
import 'package:homecampus/widgets/app_bar/custom_app_bar.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_drop_down.dart';
// ignore_for_file: must_be_immutable

class ScheduleDateScreen extends StatefulWidget {
  @override
  _ScheduleDateScreenState createState() => _ScheduleDateScreenState();
}

class _ScheduleDateScreenState extends State<ScheduleDateScreen> {

List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];
List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

bool pressed8am = false;
bool pressed9am = false;
bool pressed10am = false;
bool pressed11am = false;
bool pressed12pm = false;
bool pressed1pm = false;
bool pressed2pm = false;
bool pressed3pm = false;
bool pressed4pm = false;
bool pressed5pm = false;

void toggleColor() {
  setState(() {
    pressed8am = !pressed8am;
  });
}

@override Widget build(BuildContext context) {
  Color containerColor = pressed8am ? Colors.blue : Colors.white;
  Color textColor = pressed8am ? Colors.white : Colors.black;

 return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.whiteA700,
         body: Container(
             width: double.maxFinite,
             child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [Expanded(
                     child: SingleChildScrollView(
                         child: Container(
                             height: getVerticalSize(850),
                             width: double.maxFinite,
                             child: Stack(
                                 alignment: Alignment.bottomCenter,
                                 children: [CustomImageView(
                                     imagePath: ImageConstant.imgEllipse142,
                                     height: getVerticalSize(183),
                                     width: getHorizontalSize(162),
                                     alignment: Alignment.topLeft),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                          margin: getMargin(left: 19, right: 20, bottom: 24),
                                          padding: getPadding(left: 18, top: 35, right: 18, bottom: 35),
                                          decoration: AppDecoration.outlineBlack9000f.copyWith(borderRadius: BorderRadiusStyle.customBorderTL45),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [Padding(
                                                  padding: getPadding(left: 2, top: 60),
                                                  child: Text(
                                                      "Available Time",
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle.txtRubikMedium16)),
                                                Padding(
                                                  padding: getPadding(top: 27, right: 1),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                  Expanded(
                                                  child: GestureDetector(
                                                  onTap: toggleColor,
                                                    child: Container(
                                                      margin: getMargin(
                                                        right: 4,
                                                      ),
                                                      padding: getPadding(
                                                        all: 11,
                                                      ),
                                                      decoration: AppDecoration.fillIndigoA10014.copyWith(
                                                        borderRadius: BorderRadiusStyle.circleBorder29,
                                                        color: containerColor,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            width: getHorizontalSize(
                                                              35,
                                                            ),
                                                            margin: getMargin(
                                                              top: 3,
                                                            ),
                                                            child: Text(
                                                              "8:00 AM",
                                                              maxLines: null,
                                                              textAlign: TextAlign.center,
                                                              style: AppStyle.txtRubikRegular13.copyWith(
                                                                color: textColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                          Expanded(
                                                            child: Container(
                                                              margin: getMargin(
                                                                left: 4,
                                                                right: 4,
                                                              ),
                                                              padding: getPadding(
                                                                all: 11,
                                                              ),
                                                              decoration: AppDecoration.fillIndigoA10014.copyWith(
                                                                borderRadius: BorderRadiusStyle.circleBorder29,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    width: getHorizontalSize(
                                                                      35,
                                                                    ),
                                                                    margin: getMargin(
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      "9:00 AM",
                                                                      maxLines: null,
                                                                      textAlign: TextAlign.center,
                                                                      style: AppStyle.txtRubikRegular13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              margin: getMargin(
                                                                left: 4,
                                                                right: 4,
                                                              ),
                                                              padding: getPadding(
                                                                all: 11,
                                                              ),
                                                              decoration: AppDecoration.fillIndigoA10014.copyWith(
                                                                borderRadius: BorderRadiusStyle.circleBorder29,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    width: getHorizontalSize(
                                                                      35,
                                                                    ),
                                                                    margin: getMargin(
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      "10:00 AM",
                                                                      maxLines: null,
                                                                      textAlign: TextAlign.center,
                                                                      style: AppStyle.txtRubikRegular13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              margin: getMargin(
                                                                left: 4,
                                                                right: 4,
                                                              ),
                                                              padding: getPadding(
                                                                all: 11,
                                                              ),
                                                              decoration: AppDecoration.fillIndigoA10014.copyWith(
                                                                borderRadius: BorderRadiusStyle.circleBorder29,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    width: getSize(
                                                                      35,
                                                                    ),
                                                                    margin: getMargin(
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      "11:00 AM",
                                                                      maxLines: null,
                                                                      textAlign: TextAlign.center,
                                                                      style: AppStyle.txtRubikRegular13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              margin: getMargin(
                                                                left: 4,
                                                              ),
                                                              padding: getPadding(
                                                                all: 11,
                                                              ),
                                                              decoration: AppDecoration.fillIndigoA10014.copyWith(
                                                                borderRadius: BorderRadiusStyle.circleBorder29,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    width: getHorizontalSize(
                                                                      35,
                                                                    ),
                                                                    margin: getMargin(
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      "12:00 PM",
                                                                      maxLines: null,
                                                                      textAlign: TextAlign.center,
                                                                      style: AppStyle.txtRubikRegular13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 16), // Add spacing between the rows
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          // Add another set of Expanded widgets with the same code as above
                                                          Expanded(
                                                            child: Container(
                                                              margin: getMargin(
                                                                right: 4,
                                                              ),
                                                              padding: getPadding(
                                                                all: 11,
                                                              ),
                                                              decoration: AppDecoration.fillIndigoA10014.copyWith(
                                                                borderRadius: BorderRadiusStyle.circleBorder29,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    width: getHorizontalSize(
                                                                      35,
                                                                    ),
                                                                    margin: getMargin(
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      "1:00 PM",
                                                                      maxLines: null,
                                                                      textAlign: TextAlign.center,
                                                                      style: AppStyle.txtRubikRegular13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          // Repeat the same for the remaining Expanded widgets
                                                          Expanded(
                                                            child: Container(
                                                              margin: getMargin(
                                                                left: 4,
                                                                right: 4,
                                                              ),
                                                              padding: getPadding(
                                                                all: 11,
                                                              ),
                                                              decoration: AppDecoration.fillIndigoA10014.copyWith(
                                                                borderRadius: BorderRadiusStyle.circleBorder29,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    width: getHorizontalSize(
                                                                      35,
                                                                    ),
                                                                    margin: getMargin(
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      "2:00 PM",
                                                                      maxLines: null,
                                                                      textAlign: TextAlign.center,
                                                                      style: AppStyle.txtRubikRegular13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              margin: getMargin(
                                                                left: 4,
                                                                right: 4,
                                                              ),
                                                              padding: getPadding(
                                                                all: 11,
                                                              ),
                                                              decoration: AppDecoration.fillIndigoA10014.copyWith(
                                                                borderRadius: BorderRadiusStyle.circleBorder29,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    width: getHorizontalSize(
                                                                      35,
                                                                    ),
                                                                    margin: getMargin(
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      "3:00 PM",
                                                                      maxLines: null,
                                                                      textAlign: TextAlign.center,
                                                                      style: AppStyle.txtRubikRegular13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              margin: getMargin(
                                                                left: 4,
                                                                right: 4,
                                                              ),
                                                              padding: getPadding(
                                                                all: 11,
                                                              ),
                                                              decoration: AppDecoration.fillIndigoA10014.copyWith(
                                                                borderRadius: BorderRadiusStyle.circleBorder29,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    width: getSize(
                                                                      35,
                                                                    ),
                                                                    margin: getMargin(
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      "4:00 PM",
                                                                      maxLines: null,
                                                                      textAlign: TextAlign.center,
                                                                      style: AppStyle.txtRubikRegular13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              margin: getMargin(
                                                                left: 4,
                                                              ),
                                                              padding: getPadding(
                                                                all: 11,
                                                              ),
                                                              decoration: AppDecoration.fillIndigoA10014.copyWith(
                                                                borderRadius: BorderRadiusStyle.circleBorder29,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Container(
                                                                    width: getHorizontalSize(
                                                                      35,
                                                                    ),
                                                                    margin: getMargin(
                                                                      top: 3,
                                                                    ),
                                                                    child: Text(
                                                                      "5:00 PM",
                                                                      maxLines: null,
                                                                      textAlign: TextAlign.center,
                                                                      style: AppStyle.txtRubikRegular13,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                               CustomButton(
                                                   height: getVerticalSize(54),
                                                   text: "Confirm",
                                                   margin: getMargin(left: 22, top: 31, right: 22),
                                                   fontStyle: ButtonFontStyle.RubikMedium18,
                                                   onTap: () {onTapConfirm(context);},
                                                   alignment: Alignment.center)])
                                      )
                                  ),
                                  CustomAppBar(
                                      height: getVerticalSize(71),
                                      leadingWidth: 76,
                                      leading: AppbarIconbutton(
                                          svgPath: ImageConstant.imgIcback, margin: getMargin(left: 39),
                                          onTap: () {onTapIcback2(context);}),
                                      centerTitle: true,
                                      title: AppbarSubtitle(
                                          text: "Schedule Visit")),
                                  Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                          margin: getMargin(left: 39, top: 85, right: 41),
                                          padding: getPadding(left: 15, top: 10, right: 15, bottom: 10),
                                          decoration: AppDecoration.outlineBlack9003f1.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [Padding(
                                                  padding: getPadding(left: 11, top: 13, right: 11),
                                                  child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [Expanded(
                                                          child: CustomDropDown(
                                                              focusNode: FocusNode(),
                                                              autofocus: true,
                                                              icon: Container(
                                                                  margin: getMargin(left: 30),
                                                                  child: CustomImageView(
                                                                      svgPath: ImageConstant.imgArrowdownBlueGray300)),
                                                              hintText: "June",
                                                              margin: getMargin(right: 18),
                                                              variant: DropDownVariant.None,
                                                              items: dropdownItemList,
                                                              onChanged: (value) {})),
                                                       Expanded(
                                                           child: CustomDropDown(focusNode: FocusNode(),
                                                               autofocus: true,
                                                               icon: Container(margin: getMargin(left: 30),
                                                                   child: CustomImageView(
                                                                       svgPath: ImageConstant.imgArrowdownBlueGray300)),
                                                               hintText: "2023",
                                                               margin: getMargin(left: 18),
                                                               variant: DropDownVariant.None,
                                                               items: dropdownItemList1,
                                                               onChanged: (value) {}))
                                                      ]
                                                  )
                                              ),
                                               Padding(
                                                   padding: getPadding(left: 12, top: 24, right: 13),
                                                   child: Row(
                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                       children: [Text(
                                                           "mo",
                                                           overflow: TextOverflow.ellipsis,
                                                           textAlign: TextAlign.left,
                                                           style: AppStyle.txtUrbanistRomanSemiBold13),
                                                        Text(
                                                            "tu",
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle.txtUrbanistRomanSemiBold13),
                                                        Text(
                                                            "we",
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle.txtUrbanistRomanSemiBold13),
                                                        Text(
                                                            "th",
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle.txtUrbanistRomanSemiBold13),
                                                        Text(
                                                            "fr", overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle.txtUrbanistRomanSemiBold13),
                                                        Text(
                                                            "sa",
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle.txtUrbanistRomanSemiBold13),
                                                        Text(
                                                            "su",
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.left,
                                                            style: AppStyle.txtUrbanistRomanSemiBold13)])),
                                               Align(
                                                   alignment: Alignment.centerRight,
                                                   child: Padding(
                                                       padding: getPadding(top: 31, right: 17),
                                                       child: Row(
                                                           mainAxisAlignment: MainAxisAlignment.end,
                                                           children: [Text(
                                                               "1",
                                                               overflow: TextOverflow.ellipsis,
                                                               textAlign: TextAlign.left,
                                                               style: AppStyle.txtInterRegular15),
                                                            Padding(
                                                                padding: getPadding(left: 36),
                                                                child: Text(
                                                                    "2",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15)),
                                                            Padding(
                                                                padding: getPadding(left: 34),
                                                                child: Text(
                                                                    "3",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15)),
                                                            Padding(
                                                                padding: getPadding(left: 33),
                                                                child: Text(
                                                                    "4",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15)),
                                                            Padding(
                                                                padding: getPadding(left: 34),
                                                                child: Text(
                                                                    "5",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15))]))),
                                               Align(
                                                   alignment: Alignment.centerLeft,
                                                   child: Padding(
                                                       padding: getPadding(top: 24, right: 14),
                                                       child: Row(
                                                           children: [CustomButton(
                                                               height: getVerticalSize(32),
                                                               width: getHorizontalSize(43),
                                                               text: "6",
                                                               shape: ButtonShape.RoundedBorder2,
                                                               padding: ButtonPadding.PaddingAll6,
                                                               fontStyle: ButtonFontStyle.InterRegular15),
                                                            Padding(
                                                                padding: getPadding(left: 16, top: 6, bottom: 6),
                                                                child: Text(
                                                                    "7", overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15)),
                                                            Padding(padding: getPadding(left: 34, top: 6, bottom: 6),
                                                                child: Text(
                                                                    "8",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15)),
                                                            Padding(
                                                                padding: getPadding(left: 34, top: 6, bottom: 6),
                                                                child: Text(
                                                                    "9",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15)),
                                                            Padding(
                                                                padding: getPadding(left: 30, top: 6, bottom: 6),
                                                                child: Text(
                                                                    "10",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15)),
                                                            Padding(
                                                                padding: getPadding(left: 28, top: 6, bottom: 6),
                                                                child: Text(
                                                                    "11",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15)),
                                                            Padding(
                                                                padding: getPadding(left: 29, top: 5, bottom: 7),
                                                                child: Text(
                                                                    "12",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15))]))),
                                               Padding(
                                                   padding: getPadding(left: 12, top: 24, right: 12),
                                                   child: ListView.separated(
                                                       physics: NeverScrollableScrollPhysics(),
                                                       shrinkWrap: true,
                                                       separatorBuilder: (context, index) {
                                                        return SizedBox(
                                                            height: getVerticalSize(30));},
                                                       itemCount: 2,
                                                       itemBuilder: (context, index) {
                                                        return ListdateItemWidget();})),
                                               Align(
                                                   alignment: Alignment.centerLeft,
                                                   child: Padding(
                                                       padding: getPadding(left: 12, top: 30),
                                                       child: Row(
                                                           children: [Text(
                                                               "27",
                                                               overflow: TextOverflow.ellipsis,
                                                               textAlign: TextAlign.left,
                                                               style: AppStyle.txtInterRegular15),
                                                            Padding(
                                                                padding: getPadding(left: 25),
                                                                child: Text(
                                                                    "28",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15)),
                                                            Padding(
                                                                padding: getPadding(left: 25),
                                                                child: Text(
                                                                    "29",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15)),
                                                            Padding(
                                                                padding: getPadding(left: 24),
                                                                child: Text(
                                                                    "30",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtInterRegular15))]))),
                                               Padding(
                                                   padding: getPadding(top: 24),
                                                   child: Row(
                                                       mainAxisAlignment: MainAxisAlignment.center,
                                                       children: [Expanded(
                                                           child: CustomButton(
                                                               height: getVerticalSize(40),
                                                               text: "Reset",
                                                               margin: getMargin(right: 7),
                                                               variant: ButtonVariant.OutlineIndigo50,
                                                               padding: ButtonPadding.PaddingAll12,
                                                               fontStyle: ButtonFontStyle.UrbanistRomanSemiBold16)),
                                                        Expanded(
                                                            child: CustomButton(
                                                                height: getVerticalSize(40),
                                                                text: "Done",
                                                                margin: getMargin(left: 7),
                                                                variant: ButtonVariant.OutlineBlack9003f_1,
                                                                padding: ButtonPadding.PaddingAll12,
                                                                fontStyle: ButtonFontStyle.UrbanistRomanSemiBold16WhiteA700))
                                                       ]
                                                   )
                                               )
                                              ]
                                          )
                                      )
                                  )
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
onTapConfirm(BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduleVisitScreen); } 
onTapIcback2(BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduleVisitScreen); } 
 }
