import '../filter_screen/widgets/listgroup120_item_widget.dart';
import '../filter_screen/widgets/listtype_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/app_bar/appbar_iconbutton.dart';
import 'package:homecampus/widgets/app_bar/appbar_iconbutton_2.dart';
import 'package:homecampus/widgets/app_bar/appbar_image.dart';
import 'package:homecampus/widgets/app_bar/appbar_subtitle_5.dart';
import 'package:homecampus/widgets/app_bar/custom_app_bar.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';

class FilterScreen extends StatelessWidget {
  TextEditingController distanceController = TextEditingController();

  TextEditingController distanceoneController = TextEditingController();

  TextEditingController frame8397Controller = TextEditingController();

  TextEditingController frame8398Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          height: getVerticalSize(
            83,
          ),
          leadingWidth: 73,
          leading: AppbarIconbutton(
            svgPath: ImageConstant.imgIcback,
            margin: getMargin(
              left: 36,
              top: 9,
              bottom: 9,
            ),
          ),
          title: Container(
            height: getVerticalSize(
              44,
            ),
            width: getHorizontalSize(
              248,
            ),
            margin: getMargin(
              right: 44,
            ),
            decoration: AppDecoration.stack35,
            child: Stack(
              children: [
                AppbarImage(
                  height: getVerticalSize(
                    44,
                  ),
                  width: getHorizontalSize(
                    248,
                  ),
                  svgPath: ImageConstant.imgShape,
                ),
                Padding(
                  padding: getPadding(
                    left: 10,
                    top: 15,
                    right: 40,
                    bottom: 13,
                  ),
                  child: Row(
                    children: [
                      AppbarImage(
                        height: getSize(
                          11,
                        ),
                        width: getSize(
                          11,
                        ),
                        svgPath: ImageConstant.imgSearch,
                        margin: getMargin(
                          bottom: 3,
                        ),
                      ),
                      AppbarSubtitle5(
                        text: "Search House, Apartment, etc",
                        margin: getMargin(
                          left: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              margin: getMargin(
                left: 214,
                top: 3,
                bottom: 3,
              ),
              decoration: AppDecoration.stack35,
              child: Row(
                children: [
                  SizedBox(
                    height: getVerticalSize(
                      38,
                    ),
                    child: VerticalDivider(
                      width: getHorizontalSize(
                        1,
                      ),
                      thickness: getVerticalSize(
                        1,
                      ),
                      color: ColorConstant.whiteA7006c,
                      indent: getHorizontalSize(
                        2,
                      ),
                    ),
                  ),
                  AppbarImage(
                    height: getSize(
                      20,
                    ),
                    width: getSize(
                      20,
                    ),
                    svgPath: ImageConstant.imgMicrophone,
                    margin: getMargin(
                      left: 6,
                      top: 8,
                      bottom: 10,
                    ),
                  ),
                  AppbarIconbutton2(
                    svgPath: ImageConstant.imgSettingsWhiteA700,
                    margin: getMargin(
                      left: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            padding: getPadding(
              top: 19,
            ),
            child: Padding(
              padding: getPadding(
                left: 20,
                right: 19,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: getMargin(
                      left: 16,
                      right: 16,
                    ),
                    decoration: AppDecoration.outlineGray3001.copyWith(
                      borderRadius: BorderRadiusStyle.customBorderTL40,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Price range",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtSFProDisplaySemibold18.copyWith(
                            letterSpacing: getHorizontalSize(
                              0.23,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 17,
                              top: 14,
                              right: 22,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getVerticalSize(
                                    24,
                                  ),
                                  width: getHorizontalSize(
                                    304,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: getVerticalSize(
                                            10,
                                          ),
                                          width: getHorizontalSize(
                                            300,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorConstant.indigoA1007f,
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                5,
                                              ),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                5,
                                              ),
                                            ),
                                            child: LinearProgressIndicator(
                                              value: 0.53,
                                              backgroundColor:
                                                  ColorConstant.indigoA1007f,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                ColorConstant.indigoA100,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgBullet,
                                        height: getSize(
                                          24,
                                        ),
                                        width: getSize(
                                          24,
                                        ),
                                        radius: BorderRadius.circular(
                                          getHorizontalSize(
                                            12,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgBullet,
                                        height: getSize(
                                          24,
                                        ),
                                        width: getSize(
                                          24,
                                        ),
                                        radius: BorderRadius.circular(
                                          getHorizontalSize(
                                            12,
                                          ),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomTextFormField(
                                        width: getHorizontalSize(
                                          121,
                                        ),
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller: distanceController,
                                        hintText: "0km",
                                        variant: TextFormFieldVariant
                                            .OutlineBluegray40002,
                                        shape:
                                            TextFormFieldShape.RoundedBorder20,
                                        padding:
                                            TextFormFieldPadding.PaddingT14,
                                        fontStyle: TextFormFieldFontStyle
                                            .InterRegular16,
                                      ),
                                      Container(
                                        height: getVerticalSize(
                                          1,
                                        ),
                                        width: getHorizontalSize(
                                          8,
                                        ),
                                        margin: getMargin(
                                          left: 25,
                                          top: 23,
                                          bottom: 23,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.blueGray40002,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomTextFormField(
                                        width: getHorizontalSize(
                                          121,
                                        ),
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller: distanceoneController,
                                        hintText: "0.5km",
                                        margin: getMargin(
                                          left: 25,
                                        ),
                                        variant: TextFormFieldVariant
                                            .OutlineBluegray40002,
                                        shape:
                                            TextFormFieldShape.RoundedBorder20,
                                        padding:
                                            TextFormFieldPadding.PaddingT14,
                                        fontStyle: TextFormFieldFontStyle
                                            .InterRegular16,
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
                            top: 38,
                          ),
                          child: Text(
                            "Price range",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFProDisplaySemibold18.copyWith(
                              letterSpacing: getHorizontalSize(
                                0.23,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 17,
                              top: 14,
                              right: 22,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: getVerticalSize(
                                    24,
                                  ),
                                  width: getHorizontalSize(
                                    304,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: getVerticalSize(
                                            10,
                                          ),
                                          width: getHorizontalSize(
                                            300,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorConstant.indigoA1007f,
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                5,
                                              ),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              getHorizontalSize(
                                                5,
                                              ),
                                            ),
                                            child: LinearProgressIndicator(
                                              value: 0.53,
                                              backgroundColor:
                                                  ColorConstant.indigoA1007f,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                ColorConstant.indigoA100,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgBullet,
                                        height: getSize(
                                          24,
                                        ),
                                        width: getSize(
                                          24,
                                        ),
                                        radius: BorderRadius.circular(
                                          getHorizontalSize(
                                            12,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                      CustomImageView(
                                        svgPath: ImageConstant.imgBullet,
                                        height: getSize(
                                          24,
                                        ),
                                        width: getSize(
                                          24,
                                        ),
                                        radius: BorderRadius.circular(
                                          getHorizontalSize(
                                            12,
                                          ),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    top: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomTextFormField(
                                        width: getHorizontalSize(
                                          121,
                                        ),
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller: frame8397Controller,
                                        hintText: "RM0",
                                        variant: TextFormFieldVariant
                                            .OutlineBluegray40002,
                                        shape:
                                            TextFormFieldShape.RoundedBorder20,
                                        padding:
                                            TextFormFieldPadding.PaddingT14,
                                        fontStyle: TextFormFieldFontStyle
                                            .InterRegular16,
                                      ),
                                      Container(
                                        height: getVerticalSize(
                                          1,
                                        ),
                                        width: getHorizontalSize(
                                          8,
                                        ),
                                        margin: getMargin(
                                          left: 25,
                                          top: 23,
                                          bottom: 23,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.blueGray40002,
                                          borderRadius: BorderRadius.circular(
                                            getHorizontalSize(
                                              1,
                                            ),
                                          ),
                                        ),
                                      ),
                                      CustomTextFormField(
                                        width: getHorizontalSize(
                                          121,
                                        ),
                                        focusNode: FocusNode(),
                                        autofocus: true,
                                        controller: frame8398Controller,
                                        hintText: "RM500",
                                        margin: getMargin(
                                          left: 25,
                                        ),
                                        variant: TextFormFieldVariant
                                            .OutlineBluegray40002,
                                        shape:
                                            TextFormFieldShape.RoundedBorder20,
                                        padding:
                                            TextFormFieldPadding.PaddingT14,
                                        fontStyle: TextFormFieldFontStyle
                                            .InterRegular16,
                                        textInputAction: TextInputAction.done,
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
                            top: 36,
                          ),
                          child: Text(
                            "Rooms and beds",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFProDisplaySemibold18.copyWith(
                              letterSpacing: getHorizontalSize(
                                0.23,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 20,
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (
                              context,
                              index,
                            ) {
                              return SizedBox(
                                height: getVerticalSize(
                                  18,
                                ),
                              );
                            },
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return ListtypeItemWidget();
                            },
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 39,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Pro",
                                  style: TextStyle(
                                    color: ColorConstant.gray90002,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: "perty",
                                  style: TextStyle(
                                    color: ColorConstant.gray90002,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TextSpan(
                                  text: " Facilities",
                                  style: TextStyle(
                                    color: ColorConstant.gray90002,
                                    fontSize: getFontSize(
                                      14,
                                    ),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 20,
                            right: 11,
                          ),
                          child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            separatorBuilder: (
                              context,
                              index,
                            ) {
                              return SizedBox(
                                height: getVerticalSize(
                                  25,
                                ),
                              );
                            },
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Listgroup120ItemWidget();
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(
                              left: 19,
                              top: 22,
                              right: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomButton(
                                  height: getVerticalSize(
                                    40,
                                  ),
                                  width: getHorizontalSize(
                                    144,
                                  ),
                                  text: "Reset",
                                  variant: ButtonVariant.OutlineIndigo50,
                                  padding: ButtonPadding.PaddingAll12,
                                  fontStyle:
                                      ButtonFontStyle.UrbanistRomanSemiBold16,
                                ),
                                CustomButton(
                                  height: getVerticalSize(
                                    40,
                                  ),
                                  width: getHorizontalSize(
                                    144,
                                  ),
                                  text: "Done",
                                  margin: getMargin(
                                    left: 15,
                                  ),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  padding: ButtonPadding.PaddingAll12,
                                  fontStyle: ButtonFontStyle
                                      .UrbanistRomanSemiBold16WhiteA700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: getMargin(
                      top: 274,
                    ),
                    padding: getPadding(
                      all: 16,
                    ),
                    decoration: AppDecoration.fillWhiteA700,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgVuesaxoutlinerotateleft,
                          height: getSize(
                            20,
                          ),
                          width: getSize(
                            20,
                          ),
                          margin: getMargin(
                            top: 14,
                            bottom: 15,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 8,
                            top: 16,
                            bottom: 17,
                          ),
                          child: Text(
                            "Reset all",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtSFProDisplayMedium16.copyWith(
                              letterSpacing: getHorizontalSize(
                                0.21,
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        CustomButton(
                          height: getVerticalSize(
                            48,
                          ),
                          width: getHorizontalSize(
                            156,
                          ),
                          text: "Show results",
                          margin: getMargin(
                            bottom: 1,
                          ),
                          shape: ButtonShape.RoundedBorder25,
                          fontStyle: ButtonFontStyle.SFProDisplayMedium16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
