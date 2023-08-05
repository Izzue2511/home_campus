import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore: must_be_immutable
class Listtime1ItemWidget extends StatelessWidget {
  Listtime1ItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: getMargin(
              right: 4,
            ),
            padding: getPadding(
              all: 12,
            ),
            decoration: AppDecoration.fillTealA70014.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder29,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: getHorizontalSize(
                    36,
                  ),
                  margin: getMargin(
                    top: 3,
                  ),
                  child: Text(
                    "",
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
              all: 12,
            ),
            decoration: AppDecoration.fillTealA70014.copyWith(
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
                    "",
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
            decoration: AppDecoration.fillIndigoA100.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder29,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: getHorizontalSize(
                    37,
                  ),
                  margin: getMargin(
                    top: 3,
                  ),
                  child: Text(
                    "",
                    maxLines: null,
                    textAlign: TextAlign.center,
                    style: AppStyle.txtRubikMedium14,
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
              left: 15,
              top: 12,
              right: 15,
              bottom: 12,
            ),
            decoration: AppDecoration.fillAmber50014.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder29,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: getSize(
                    30,
                  ),
                  margin: getMargin(
                    top: 3,
                  ),
                  child: Text(
                    "",
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
              left: 14,
              top: 12,
              right: 14,
              bottom: 12,
            ),
            decoration: AppDecoration.fillTealA70014.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder29,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: getHorizontalSize(
                    32,
                  ),
                  margin: getMargin(
                    top: 3,
                  ),
                  child: Text(
                    "",
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
    );
  }
}
