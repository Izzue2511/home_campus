import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore: must_be_immutable
class ListellipsesixItemWidget extends StatelessWidget {
  ListellipsesixItemWidget();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: getPadding(
          left: 19,
          top: 9,
          right: 19,
          bottom: 9,
        ),
        decoration: AppDecoration.fillWhiteA700.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: getPadding(
                top: 5,
                bottom: 7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: getSize(
                        10,
                      ),
                      width: getSize(
                        10,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.blueA200,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: getSize(
                      2,
                    ),
                    width: getSize(
                      2,
                    ),
                    margin: getMargin(
                      left: 3,
                      top: 26,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.blueA200,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: getSize(
                      4,
                    ),
                    width: getSize(
                      4,
                    ),
                    margin: getMargin(
                      top: 22,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.blueA200,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 1,
                bottom: 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: getSize(
                      4,
                    ),
                    width: getSize(
                      4,
                    ),
                    margin: getMargin(
                      left: 26,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.blueA200,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          2,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: getMargin(
                      top: 5,
                    ),
                    padding: getPadding(
                      left: 5,
                      right: 5,
                    ),
                    decoration: AppDecoration.fillBlueA20001.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder29,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: getSize(
                            1,
                          ),
                          width: getSize(
                            1,
                          ),
                          margin: getMargin(
                            left: 3,
                            top: 57,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.blueA200,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                1,
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          svgPath: ImageConstant.imgFrameWhiteA700,
                          height: getSize(
                            24,
                          ),
                          width: getSize(
                            24,
                          ),
                          margin: getMargin(
                            left: 8,
                            top: 17,
                            bottom: 17,
                          ),
                        ),
                        Container(
                          height: getSize(
                            3,
                          ),
                          width: getSize(
                            3,
                          ),
                          margin: getMargin(
                            left: 9,
                            top: 55,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstant.blueA200,
                            borderRadius: BorderRadius.circular(
                              getHorizontalSize(
                                1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: getSize(
                        2,
                      ),
                      width: getSize(
                        2,
                      ),
                      margin: getMargin(
                        top: 4,
                        right: 26,
                      ),
                      decoration: BoxDecoration(
                        color: ColorConstant.blueA200,
                        borderRadius: BorderRadius.circular(
                          getHorizontalSize(
                            1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                top: 6,
                bottom: 27,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: getSize(
                      10,
                    ),
                    width: getSize(
                      10,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.blueA200,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          5,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: getSize(
                      6,
                    ),
                    width: getSize(
                      6,
                    ),
                    margin: getMargin(
                      top: 27,
                    ),
                    decoration: BoxDecoration(
                      color: ColorConstant.blueA200,
                      borderRadius: BorderRadius.circular(
                        getHorizontalSize(
                          3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 26,
                top: 9,
                bottom: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtMontserratRomanSemiBold14,
                  ),
                  Container(
                    width: getHorizontalSize(
                      191,
                    ),
                    margin: getMargin(
                      top: 7,
                    ),
                    child: Text(
                      "",
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratRomanRegular12,
                    ),
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
