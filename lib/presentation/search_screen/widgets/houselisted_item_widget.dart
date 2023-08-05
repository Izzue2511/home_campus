import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class HouselistedItemWidget extends StatelessWidget {
  HouselistedItemWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        child: Container(
          decoration: AppDecoration.outlineBlack9003f,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                child: Container(
                  padding: getPadding(
                    left: 12,
                    top: 11,
                    right: 12,
                    bottom: 11,
                  ),
                  decoration: AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder21,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: getVerticalSize(
                          235,
                        ),
                        width: getHorizontalSize(
                          340,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgAcompactwooden,
                              height: getVerticalSize(
                                235,
                              ),
                              width: getHorizontalSize(
                                340,
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
                              child: Padding(
                                padding: getPadding(
                                  left: 8,
                                  right: 11,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomButton(
                                          height: getVerticalSize(
                                            36,
                                          ),
                                          width: getHorizontalSize(
                                            66,
                                          ),
                                          text: "5.0",
                                          variant: ButtonVariant.FillWhiteA700,
                                          shape: ButtonShape.RoundedBorder20,
                                          padding: ButtonPadding.PaddingT10,
                                          prefixWidget: Container(
                                            margin: getMargin(
                                              right: 6,
                                            ),
                                            child: CustomImageView(
                                              svgPath: ImageConstant
                                                  .imgStarOrange200,
                                            ),
                                          ),
                                        ),
                                        CustomButton(
                                          height: getVerticalSize(
                                            24,
                                          ),
                                          width: getHorizontalSize(
                                            73,
                                          ),
                                          text: "1.8 km",
                                          margin: getMargin(
                                            top: 2,
                                            bottom: 10,
                                          ),
                                          variant:
                                              ButtonVariant.FillIndigoA1007f,
                                          shape: ButtonShape.CircleBorder12,
                                          padding: ButtonPadding.PaddingT4,
                                          fontStyle:
                                              ButtonFontStyle.RalewayRegular12,
                                          prefixWidget: Container(
                                            margin: getMargin(
                                              right: 4,
                                            ),
                                            child: CustomImageView(
                                              svgPath:
                                                  ImageConstant.imgIclocation,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomIconButton(
                                      height: 24,
                                      width: 25,
                                      margin: getMargin(
                                        top: 158,
                                      ),
                                      shape: IconButtonShape.CircleBorder12,
                                      padding: IconButtonPadding.PaddingAll6,
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
                      Padding(
                        padding: getPadding(
                          top: 8,
                          right: 1,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: getPadding(
                                top: 2,
                                bottom: 3,
                              ),
                              child: Text(
                                "Orchad House",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRalewayMedium16,
                              ),
                            ),
                            Container(
                              padding: getPadding(
                                left: 8,
                                top: 4,
                                right: 8,
                                bottom: 4,
                              ),
                              decoration:
                                  AppDecoration.fillIndigoA100af.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder8,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "RM235",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtMontserratSemiBold12
                                        .copyWith(
                                      letterSpacing: getHorizontalSize(
                                        0.36,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: getPadding(
                                      top: 6,
                                      bottom: 1,
                                    ),
                                    child: Text(
                                      "/month",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtMontserratMedium6
                                          .copyWith(
                                        letterSpacing: getHorizontalSize(
                                          0.18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: getPadding(
                          top: 3,
                          bottom: 3,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomImageView(
                              svgPath: ImageConstant.imgLocation,
                              height: getSize(
                                15,
                              ),
                              width: getSize(
                                15,
                              ),
                              margin: getMargin(
                                top: 8,
                                bottom: 2,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 3,
                                top: 7,
                              ),
                              child: Text(
                                "Merbabu, Central Java",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium12,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgGroup2,
                              height: getSize(
                                14,
                              ),
                              width: getSize(
                                14,
                              ),
                              margin: getMargin(
                                left: 30,
                                top: 7,
                                bottom: 3,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 6,
                                top: 6,
                                bottom: 2,
                              ),
                              child: Text(
                                "2 room",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle
                                    .txtSFProDisplayRegular13IndigoA100
                                    .copyWith(
                                  letterSpacing: getHorizontalSize(
                                    0.13,
                                  ),
                                ),
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgIcbath,
                              height: getSize(
                                24,
                              ),
                              width: getSize(
                                24,
                              ),
                              margin: getMargin(
                                left: 2,
                                bottom: 1,
                              ),
                            ),
                            Padding(
                              padding: getPadding(
                                left: 3,
                                top: 7,
                                bottom: 3,
                              ),
                              child: Text(
                                "2 Bathroom",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtRalewayRegular12IndigoA100,
                              ),
                            ),
                          ],
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
    );
  }
}
