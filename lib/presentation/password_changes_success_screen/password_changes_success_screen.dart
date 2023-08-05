import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';

class PasswordChangesSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray90005,
        body: Container(
          width: double.maxFinite,
          padding: getPadding(
            top: 63,
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
                  top: 46,
                ),
                child: Text(
                  "Password Changed!",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtPoppinsBold22,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  161,
                ),
                margin: getMargin(
                  top: 11,
                ),
                child: Text(
                  "Your password has been changed successfully.",
                  maxLines: null,
                  textAlign: TextAlign.center,
                  style: AppStyle.txtPoppinsRegular13,
                ),
              ),
              CustomButton(
                width: getHorizontalSize(
                  210,
                ),
                text: "Back to Login",
                margin: getMargin(
                  top: 47,
                  bottom: 5,
                ),
                variant: ButtonVariant.GradientIndigoA100IndigoA100_2,
                shape: ButtonShape.CircleBorder29,
                padding: ButtonPadding.PaddingAll19,
                fontStyle: ButtonFontStyle.PoppinsBold14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
