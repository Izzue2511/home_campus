import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';

class NewPasswordHouseOwnerScreen extends StatelessWidget {
  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordoneController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray90005,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              left: 38,
              top: 35,
              right: 38,
              bottom: 35,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(
                    right: 57,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomIconButton(
                        height: 37,
                        width: 37,
                        margin: getMargin(
                          bottom: 184,
                        ),
                        child: CustomImageView(
                          svgPath: ImageConstant.imgIcback,
                        ),
                      ),
                      Container(
                        height: getVerticalSize(
                          210,
                        ),
                        width: getHorizontalSize(
                          223,
                        ),
                        margin: getMargin(
                          left: 20,
                          top: 12,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: getMargin(
                                  bottom: 15,
                                ),
                                decoration: AppDecoration.txtOutlineBlack9003f2,
                                child: Text(
                                  "HomeCampus",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtInterSemiBold26,
                                ),
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgGroup1000003418,
                              height: getVerticalSize(
                                210,
                              ),
                              width: getHorizontalSize(
                                223,
                              ),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 16,
                    top: 30,
                  ),
                  child: Text(
                    "Create New Password",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsBold22,
                  ),
                ),
                Container(
                  width: getHorizontalSize(
                    263,
                  ),
                  margin: getMargin(
                    left: 16,
                    top: 12,
                    right: 59,
                  ),
                  child: Text(
                    "Your new password must be unique from those previously used.",
                    maxLines: null,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtPoppinsRegular12WhiteA700,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 35,
                    top: 37,
                  ),
                  child: Text(
                    "New Password",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtLatoSemiBold1292,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: passwordController,
                  hintText: "Password",
                  margin: getMargin(
                    left: 15,
                    top: 4,
                    right: 11,
                  ),
                  variant: TextFormFieldVariant.OutlineBlack9004c,
                  shape: TextFormFieldShape.RoundedBorder23,
                  padding: TextFormFieldPadding.PaddingT14_1,
                  fontStyle: TextFormFieldFontStyle.TrebuchetMS15,
                  textInputType: TextInputType.visiblePassword,
                  alignment: Alignment.center,
                  suffix: Container(
                    margin: getMargin(
                      left: 30,
                      top: 11,
                      right: 13,
                      bottom: 12,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgLockIndigoA100,
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      47,
                    ),
                  ),
                  isObscureText: true,
                ),
                Padding(
                  padding: getPadding(
                    left: 35,
                    top: 8,
                  ),
                  child: Text(
                    "Confirm Password",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtLatoSemiBold1292,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: passwordoneController,
                  hintText: "Password",
                  margin: getMargin(
                    left: 15,
                    top: 3,
                    right: 11,
                  ),
                  variant: TextFormFieldVariant.OutlineBlack9004c,
                  shape: TextFormFieldShape.RoundedBorder23,
                  padding: TextFormFieldPadding.PaddingT14_1,
                  fontStyle: TextFormFieldFontStyle.TrebuchetMS15,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                  alignment: Alignment.center,
                  suffix: Container(
                    margin: getMargin(
                      left: 30,
                      top: 11,
                      right: 13,
                      bottom: 12,
                    ),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgLockIndigoA100,
                    ),
                  ),
                  suffixConstraints: BoxConstraints(
                    maxHeight: getVerticalSize(
                      47,
                    ),
                  ),
                  isObscureText: true,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: getVerticalSize(
                      46,
                    ),
                    width: getHorizontalSize(
                      312,
                    ),
                    margin: getMargin(
                      top: 38,
                      bottom: 5,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: getVerticalSize(
                              46,
                            ),
                            width: getHorizontalSize(
                              312,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstant.indigoA100,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(
                                  8,
                                ),
                              ),
                            ),
                          ),
                        ),
                        CustomButton(
                          height: getVerticalSize(
                            46,
                          ),
                          width: getHorizontalSize(
                            312,
                          ),
                          text: "Reset Password",
                          fontStyle: ButtonFontStyle.LatoBold1576,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
