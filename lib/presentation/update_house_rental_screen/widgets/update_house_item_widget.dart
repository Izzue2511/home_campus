import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore: must_be_immutable
class UpdateHouseItemWidget extends StatelessWidget {
  UpdateHouseItemWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(
          left: 15,
          top: 20,
          right: 15,
          bottom: 20,
        ),
        decoration: AppDecoration.fillGray10001.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder26,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(
                left: 1,
                top: 8,
                bottom: 6,
              ),
              child: Text(
                "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtLatoSemiBold12.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.36,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: getSize(
                30,
              ),
              width: getSize(
                30,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgCloseIndigoA100,
                    height: getSize(
                      30,
                    ),
                    width: getSize(
                      30,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        9,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgIconminus,
                    height: getSize(
                      10,
                    ),
                    width: getSize(
                      10,
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 18,
                top: 5,
                bottom: 4,
              ),
              child: Text(
                "",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtLatoSemiBold16.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.48,
                  ),
                ),
              ),
            ),
            Container(
              height: getSize(
                30,
              ),
              width: getSize(
                30,
              ),
              margin: getMargin(
                left: 18,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgCloseIndigoA100,
                    height: getSize(
                      30,
                    ),
                    width: getSize(
                      30,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        9,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  CustomImageView(
                    svgPath: ImageConstant.imgPlusWhiteA700,
                    height: getSize(
                      10,
                    ),
                    width: getSize(
                      10,
                    ),
                    alignment: Alignment.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
