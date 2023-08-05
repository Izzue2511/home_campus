import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class Slidershadow1ItemWidget extends StatelessWidget {
  Slidershadow1ItemWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: getVerticalSize(
          352,
        ),
        width: getHorizontalSize(
          369,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: getVerticalSize(
                  117,
                ),
                width: getHorizontalSize(
                  325,
                ),
                decoration: BoxDecoration(
                  color: ColorConstant.black90063,
                  borderRadius: BorderRadius.circular(
                    getHorizontalSize(
                      20,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: getVerticalSize(
                  335,
                ),
                width: getHorizontalSize(
                  369,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgWebalisertptx,
                      height: getVerticalSize(
                        335,
                      ),
                      width: getHorizontalSize(
                        369,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          20,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: getPadding(
                          all: 21,
                        ),
                        decoration:
                            AppDecoration.gradientBlack90000Black90099.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder18,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomIconButton(
                              height: 37,
                              width: 37,
                              margin: getMargin(
                                bottom: 256,
                              ),
                              child: CustomImageView(
                                svgPath: ImageConstant.imgIcback,
                              ),
                            ),
                            CustomIconButton(
                              height: 38,
                              width: 38,
                              margin: getMargin(
                                bottom: 255,
                              ),
                              padding: IconButtonPadding.PaddingAll9,
                              child: CustomImageView(
                                svgPath: ImageConstant.imgFavorite,
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
          ],
        ),
      ),
    );
  }
}
