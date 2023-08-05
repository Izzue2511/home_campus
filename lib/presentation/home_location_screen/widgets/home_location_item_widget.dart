import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore: must_be_immutable
class HomeLocationItemWidget extends StatelessWidget {
  HomeLocationItemWidget();

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: getHorizontalSize(
            71,
          ),
          margin: getMargin(
            right: 8,
          ),
          padding: getPadding(
            left: 25,
            top: 10,
            right: 25,
            bottom: 10,
          ),
          decoration: AppDecoration.txtOutlineIndigoA100.copyWith(
            borderRadius: BorderRadiusStyle.txtRoundedBorder15,
          ),
          child: Text(
            "",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtPoppinsSemiBold12,
          ),
        ),
      ),
    );
  }
}
