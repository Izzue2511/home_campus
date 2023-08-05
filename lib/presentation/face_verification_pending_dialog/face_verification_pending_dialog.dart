import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore_for_file: must_be_immutable
class FaceVerificationPendingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getHorizontalSize(
        313,
      ),
      padding: getPadding(
        left: 16,
        top: 23,
        right: 16,
        bottom: 23,
      ),
      decoration: AppDecoration.fillWhiteA700.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: getPadding(
                left: 16,
                top: 14,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: getPadding(
                      top: 90,
                      bottom: 34,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: getVerticalSize(
                            23,
                          ),
                          width: getHorizontalSize(
                            20,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.indigoA100Ce,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                11,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: getSize(
                            10,
                          ),
                          width: getSize(
                            10,
                          ),
                          margin: getMargin(
                            left: 4,
                            top: 18,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.indigoA100Ce,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: getSize(
                                10,
                              ),
                              width: getSize(
                                10,
                              ),
                              margin: getMargin(
                                top: 5,
                                bottom: 125,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.indigoA100Ce,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    5,
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              clipBehavior: Clip.antiAlias,
                              elevation: 0,
                              margin: getMargin(
                                left: 24,
                              ),
                              color: ColorConstant.indigoA100Ce,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: ColorConstant.black90001,
                                  width: getHorizontalSize(
                                    1,
                                  ),
                                ),
                                borderRadius: BorderRadiusStyle.roundedBorder68,
                              ),
                              child: Container(
                                height: getSize(
                                  141,
                                ),
                                width: getSize(
                                  141,
                                ),
                                padding: getPadding(
                                  left: 16,
                                  top: 25,
                                  right: 16,
                                  bottom: 25,
                                ),
                                decoration:
                                    AppDecoration.outlineBlack90001.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder68,
                                ),
                                child: Stack(
                                  children: [
                                    CustomImageView(
                                      svgPath: ImageConstant.imgVectorWhiteA700,
                                      height: getVerticalSize(
                                        87,
                                      ),
                                      width: getHorizontalSize(
                                        109,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: getSize(
                                10,
                              ),
                              width: getSize(
                                10,
                              ),
                              margin: getMargin(
                                left: 11,
                                top: 103,
                                bottom: 27,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.indigoA100Ce,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    5,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: getSize(
                                20,
                              ),
                              width: getSize(
                                20,
                              ),
                              margin: getMargin(
                                left: 28,
                                top: 5,
                                bottom: 115,
                              ),
                              decoration: BoxDecoration(
                                color: ColorConstant.indigoA100Ce,
                                borderRadius: BorderRadius.circular(
                                  getHorizontalSize(
                                    10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            left: 24,
                            top: 14,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.indigoA100Ce,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                10,
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
          ),
          Padding(
            padding: getPadding(
              top: 27,
            ),
            child: Text(
              "Verify successful",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtRobotoRomanMedium25,
            ),
          ),
          Container(
            width: getHorizontalSize(
              279,
            ),
            margin: getMargin(
              top: 28,
            ),
            child: Text(
              "Your acconut is ready to use. You will be be redirected to the home page in some few seconds",
              maxLines: null,
              textAlign: TextAlign.center,
              style: AppStyle.txtLatoSemiBold19Black90001,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgLoading,
            height: getSize(
              70,
            ),
            width: getSize(
              70,
            ),
            margin: getMargin(
              top: 13,
            ),
          ),
        ],
      ),
    );
  }
}
