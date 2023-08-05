import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';

class StudentEmailOtpCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray90005,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 38,
            top: 35,
            right: 38,
            bottom: 35,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomIconButton(
                height: 37,
                width: 37,
                alignment: Alignment.centerLeft,
                child: CustomImageView(
                  svgPath: ImageConstant.imgIcback,
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgUndrawconfirmed81ex1,
                height: getVerticalSize(
                  115,
                ),
                width: getHorizontalSize(
                  110,
                ),
                margin: getMargin(
                  top: 46,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 54,
                ),
                child: Text(
                  "OTP Verification",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtPoppinsBold22,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  224,
                ),
                margin: getMargin(
                  top: 32,
                ),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Email verification code has been sent to:\n",
                        style: TextStyle(
                          color: ColorConstant.whiteA700,
                          fontSize: getFontSize(
                            14,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "1234mail@gmail.com",
                        style: TextStyle(
                          color: ColorConstant.whiteA700,
                          fontSize: getFontSize(
                            19,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 12,
                ),
                child: Text(
                  "Resend OTP",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtPoppinsBold8IndigoA100.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    left: 48,
                    top: 39,
                  ),
                  child: Text(
                    "PIN CODE",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsBold8,
                  ),
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgDigits,
                height: getVerticalSize(
                  10,
                ),
                width: getHorizontalSize(
                  199,
                ),
                margin: getMargin(
                  top: 26,
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgLines,
                height: getVerticalSize(
                  1,
                ),
                width: getHorizontalSize(
                  234,
                ),
                margin: getMargin(
                  top: 9,
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
                  top: 38,
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
                        "Verify",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppStyle.txtPoppinsBold14WhiteA700,
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                height: getVerticalSize(
                  50,
                ),
                width: getHorizontalSize(
                  90,
                ),
                text: "00.21",
                margin: getMargin(
                  top: 39,
                  bottom: 5,
                ),
                shape: ButtonShape.RoundedBorder25,
                padding: ButtonPadding.PaddingT17,
                fontStyle: ButtonFontStyle.MontserratMedium12,
                prefixWidget: Container(
                  margin: getMargin(
                    right: 8,
                  ),
                  child: CustomImageView(
                    svgPath: ImageConstant.imgClockWhiteA700,
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
