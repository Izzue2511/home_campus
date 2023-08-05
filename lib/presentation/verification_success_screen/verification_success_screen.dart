import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

class VerificationSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray90005,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 66,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                elevation: 0,
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusStyle.roundedBorder68,
                ),
                child: Container(
                  height: getSize(
                    137,
                  ),
                  width: getSize(
                    137,
                  ),
                  padding: getPadding(
                    left: 45,
                    top: 49,
                    right: 45,
                    bottom: 49,
                  ),
                  decoration:
                      AppDecoration.gradientIndigoA100IndigoA1001.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder68,
                  ),
                  child: Stack(
                    children: [
                      CustomImageView(
                        svgPath: ImageConstant.imgCheckmarkWhiteA700,
                        height: getVerticalSize(
                          37,
                        ),
                        width: getHorizontalSize(
                          45,
                        ),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 42,
                ),
                child: Text(
                  "Verification Successful!",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtPoppinsBold20,
                ),
              ),
              Container(
                height: getVerticalSize(
                  58,
                ),
                width: getHorizontalSize(
                  224,
                ),
                margin: getMargin(
                  top: 39,
                  bottom: 5,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: getVerticalSize(
                          58,
                        ),
                        width: getHorizontalSize(
                          210,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              29,
                            ),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment(
                              -0.5,
                              0.5,
                            ),
                            end: Alignment(
                              0.5,
                              1.5,
                            ),
                            colors: [
                              ColorConstant.indigoA100,
                              ColorConstant.indigoA100,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Let’s Proceed!",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppStyle.txtPoppinsBold14WhiteA700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
