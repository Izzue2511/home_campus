import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore: must_be_immutable
class Listgroup120ItemWidget extends StatelessWidget {
  Listgroup120ItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: getHorizontalSize(
            108,
          ),
          padding: getPadding(
            left: 17,
            top: 12,
            right: 17,
            bottom: 12,
          ),
          decoration: AppDecoration.txtOutlineBlack9003f.copyWith(
            borderRadius: BorderRadiusStyle.txtCircleBorder18,
          ),
          child: Text(
            "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtLatoBold10.copyWith(
              letterSpacing: getHorizontalSize(
                0.3,
              ),
            ),
          ),
        ),
        Container(
          width: getHorizontalSize(
            114,
          ),
          padding: getPadding(
            left: 15,
            top: 11,
            right: 15,
            bottom: 11,
          ),
          decoration: AppDecoration.txtOutlineBlack9003f.copyWith(
            borderRadius: BorderRadiusStyle.txtCircleBorder18,
          ),
          child: Text(
            "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtLatoBold10.copyWith(
              letterSpacing: getHorizontalSize(
                0.3,
              ),
            ),
          ),
        ),
        Container(
          width: getHorizontalSize(
            65,
          ),
          padding: getPadding(
            left: 18,
            top: 11,
            right: 18,
            bottom: 11,
          ),
          decoration: AppDecoration.txtOutlineBlack9003f.copyWith(
            borderRadius: BorderRadiusStyle.txtCircleBorder18,
          ),
          child: Text(
            "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtLatoBold10.copyWith(
              letterSpacing: getHorizontalSize(
                0.3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
