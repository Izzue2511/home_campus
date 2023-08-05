import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore: must_be_immutable

class ListtimeItemWidget extends StatelessWidget {
  ListtimeItemWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                        "8:00 AM",
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
    );
  }
}
