import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore: must_be_immutable
class ReviewScreen1ItemWidget extends StatelessWidget {
  ReviewScreen1ItemWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        all: 10,
      ),
      decoration: AppDecoration.fillGray10001.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder26,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgShape50x50,
            height: getSize(
              50,
            ),
            width: getSize(
              50,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                25,
              ),
            ),
            margin: getMargin(
              bottom: 58,
            ),
          ),
          Expanded(
            child: Padding(
              padding: getPadding(
                left: 10,
                top: 8,
                bottom: 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRalewayBold12.copyWith(
                          letterSpacing: getHorizontalSize(
                            0.36,
                          ),
                        ),
                      ),
                      Container(
                        width: getHorizontalSize(
                          56,
                        ),
                        margin: getMargin(
                          left: 117,
                          top: 2,
                          bottom: 2,
                        ),
                        child: Row(
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgItemstarfull,
                              height: getSize(
                                10,
                              ),
                              width: getSize(
                                10,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgItemstarfull10x10,
                              height: getSize(
                                10,
                              ),
                              width: getSize(
                                10,
                              ),
                              margin: getMargin(
                                left: 1,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgItemstarfull,
                              height: getSize(
                                10,
                              ),
                              width: getSize(
                                10,
                              ),
                              margin: getMargin(
                                left: 1,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgItemstarfull,
                              height: getSize(
                                10,
                              ),
                              width: getSize(
                                10,
                              ),
                              margin: getMargin(
                                left: 1,
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgItemstarfade,
                              height: getSize(
                                10,
                              ),
                              width: getSize(
                                10,
                              ),
                              margin: getMargin(
                                left: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: getHorizontalSize(
                      241,
                    ),
                    margin: getMargin(
                      top: 8,
                      right: 5,
                    ),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
                      maxLines: null,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRalewayRegular10.copyWith(
                        letterSpacing: getHorizontalSize(
                          0.3,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 9,
                    ),
                    child: Text(
                      "10 mins ago",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtMontserratRegular8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
