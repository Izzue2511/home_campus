import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore: must_be_immutable
class Listtype1ItemWidget extends StatelessWidget {
  Listtype1ItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: getPadding(
            top: 4,
            bottom: 3,
          ),
          child: Text(
            "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtSFProDisplayRegular18.copyWith(
              letterSpacing: getHorizontalSize(
                0.36,
              ),
            ),
          ),
        ),
        Spacer(),
        CustomImageView(
          svgPath: ImageConstant.imgContrast,
          height: getSize(
            30,
          ),
          width: getSize(
            30,
          ),
        ),
        Padding(
          padding: getPadding(
            left: 21,
            top: 3,
            bottom: 4,
          ),
          child: Text(
            "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtSFProDisplayRegular18IndigoA100.copyWith(
              letterSpacing: getHorizontalSize(
                0.23,
              ),
            ),
          ),
        ),
        CustomImageView(
          svgPath: ImageConstant.imgPlus,
          height: getSize(
            30,
          ),
          width: getSize(
            30,
          ),
          margin: getMargin(
            left: 21,
          ),
        ),
      ],
    );
  }
}
