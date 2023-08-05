import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonChildWidget(),
      ),
    );
  }

  _buildButtonChildWidget() {
    if (checkGradient()) {
      return Container(
        width: width ?? double.maxFinite,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: _buildButtonWithOrWithoutIcon(),
      );
    } else {
      return _buildButtonWithOrWithoutIcon();
    }
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildDecoration() {
    return BoxDecoration(
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      gradient: _setGradient(),
      boxShadow: _setBoxShadow(),
    );
  }

  _buildTextButtonStyle() {
    if (checkGradient()) {
      return TextButton.styleFrom(
        padding: EdgeInsets.zero,
      );
    } else {
      return TextButton.styleFrom(
        fixedSize: Size(
          width ?? double.maxFinite,
          height ?? getVerticalSize(40),
        ),
        padding: _setPadding(),
        backgroundColor: _setColor(),
        side: _setTextButtonBorder(),
        shadowColor: _setTextButtonShadowColor(),
        shape: RoundedRectangleBorder(
          borderRadius: _setBorderRadius(),
        ),
      );
    }
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT10:
        return getPadding(
          top: 10,
          right: 10,
          bottom: 10,
        );
      case ButtonPadding.PaddingAll12:
        return getPadding(
          all: 12,
        );
      case ButtonPadding.PaddingT4:
        return getPadding(
          top: 4,
          right: 4,
          bottom: 4,
        );
      case ButtonPadding.PaddingAll19:
        return getPadding(
          all: 19,
        );
      case ButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      case ButtonPadding.PaddingT86:
        return getPadding(
          left: 30,
          top: 86,
          bottom: 86,
        );
      case ButtonPadding.PaddingT14:
        return getPadding(
          left: 14,
          top: 14,
          bottom: 14,
        );
      case ButtonPadding.PaddingT17:
        return getPadding(
          top: 17,
          right: 15,
          bottom: 17,
        );
      case ButtonPadding.PaddingT7:
        return getPadding(
          top: 7,
          right: 7,
          bottom: 7,
        );
      case ButtonPadding.PaddingT7_1:
        return getPadding(
          left: 6,
          top: 7,
          bottom: 7,
        );
      case ButtonPadding.PaddingT31:
        return getPadding(
          left: 30,
          top: 31,
          right: 31,
          bottom: 31,
        );
      case ButtonPadding.PaddingT12:
        return getPadding(
          left: 8,
          top: 12,
          right: 8,
          bottom: 12,
        );
      case ButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      default:
        return getPadding(
          all: 15,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case ButtonVariant.OutlineRed8003f:
        return ColorConstant.indigoA100;
      case ButtonVariant.OutlineBlack9003f:
        return ColorConstant.indigoA10075;
      case ButtonVariant.OutlineGray300:
        return ColorConstant.whiteA70002;
      case ButtonVariant.FillIndigoA10075:
        return ColorConstant.indigoA10075;
      case ButtonVariant.FillIndigoA1007f:
        return ColorConstant.indigoA1007f;
      case ButtonVariant.OutlineBlack9003f_1:
        return ColorConstant.indigoA100;
      case ButtonVariant.FillBluegray5001:
        return ColorConstant.blueGray5001;
      case ButtonVariant.OutlineIndigoA100_1:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillBlack900cc:
        return ColorConstant.black900Cc;
      case ButtonVariant.OutlineBlack9003f_2:
        return ColorConstant.gray10001;
      case ButtonVariant.OutlineDeeppurpleA7003d:
      case ButtonVariant.OutlineIndigo50:
      case ButtonVariant.Outline:
      case ButtonVariant.Outline_1:
      case ButtonVariant.OutlineDeeppurpleA7003d_1:
      case ButtonVariant.GradientIndigoA100IndigoA100:
      case ButtonVariant.GradientIndigoA100IndigoA100_1:
      case ButtonVariant.GradientRed900Deeporange600:
      case ButtonVariant.OutlineIndigoA100:
      case ButtonVariant.GradientIndigoA100IndigoA100_2:
      case ButtonVariant.OutlineWhiteA700:
        return null;
      default:
        return ColorConstant.indigoA100;
    }
  }

  _setTextButtonBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray300:
        return BorderSide(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineIndigo50:
        return BorderSide(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineIndigoA100:
        return BorderSide(
          color: ColorConstant.indigoA100,
          width: getHorizontalSize(
            2.00,
          ),
        );
      case ButtonVariant.OutlineWhiteA700:
        return BorderSide(
          color: ColorConstant.whiteA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineIndigoA100_1:
        return BorderSide(
          color: ColorConstant.indigoA100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.OutlineRed8003f:
      case ButtonVariant.OutlineBlack9003f:
      case ButtonVariant.FillIndigoA100:
      case ButtonVariant.OutlineDeeppurpleA7003d:
      case ButtonVariant.FillIndigoA10075:
      case ButtonVariant.FillIndigoA1007f:
      case ButtonVariant.OutlineBlack9003f_1:
      case ButtonVariant.OutlineDeeppurpleA7003d_1:
      case ButtonVariant.FillBluegray5001:
      case ButtonVariant.GradientIndigoA100IndigoA100:
      case ButtonVariant.GradientIndigoA100IndigoA100_1:
      case ButtonVariant.GradientRed900Deeporange600:
      case ButtonVariant.GradientIndigoA100IndigoA100_2:
      case ButtonVariant.FillBlack900cc:
      case ButtonVariant.OutlineBlack9003f_2:
        return null;
      default:
        return null;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineRed8003f:
        return ColorConstant.red8003f;
      case ButtonVariant.OutlineBlack9003f:
        return ColorConstant.black9003f;
      case ButtonVariant.OutlineDeeppurpleA7003d:
        return ColorConstant.deepPurpleA7003d;
      case ButtonVariant.OutlineGray300:
        return ColorConstant.gray60026;
      case ButtonVariant.OutlineIndigo50:
        return ColorConstant.black9003f;
      case ButtonVariant.OutlineBlack9003f_1:
        return ColorConstant.black9003f;
      case ButtonVariant.OutlineDeeppurpleA7003d_1:
        return ColorConstant.deepPurpleA7003d;
      case ButtonVariant.OutlineBlack9003f_2:
        return ColorConstant.black9003f;
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillIndigoA100:
      case ButtonVariant.FillIndigoA10075:
      case ButtonVariant.FillIndigoA1007f:
      case ButtonVariant.Outline:
      case ButtonVariant.Outline_1:
      case ButtonVariant.FillBluegray5001:
      case ButtonVariant.GradientIndigoA100IndigoA100:
      case ButtonVariant.GradientIndigoA100IndigoA100_1:
      case ButtonVariant.GradientRed900Deeporange600:
      case ButtonVariant.OutlineIndigoA100:
      case ButtonVariant.GradientIndigoA100IndigoA100_2:
      case ButtonVariant.OutlineWhiteA700:
      case ButtonVariant.OutlineIndigoA100_1:
      case ButtonVariant.FillBlack900cc:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
      case ButtonShape.RoundedBorder25:
        return BorderRadius.circular(
          getHorizontalSize(
            25.00,
          ),
        );
      case ButtonShape.CustomBorderTL10:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              10.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        );
      case ButtonShape.RoundedBorder15:
        return BorderRadius.circular(
          getHorizontalSize(
            15.00,
          ),
        );
      case ButtonShape.CircleBorder12:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
      case ButtonShape.RoundedBorder2:
        return BorderRadius.circular(
          getHorizontalSize(
            2.00,
          ),
        );
      case ButtonShape.CircleBorder29:
        return BorderRadius.circular(
          getHorizontalSize(
            29.00,
          ),
        );
      case ButtonShape.CustomBorderTL32:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              32.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              31.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              32.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              31.00,
            ),
          ),
        );
      case ButtonShape.CustomBorderTL16:
        return BorderRadius.only(
          topLeft: Radius.circular(
            getHorizontalSize(
              16.00,
            ),
          ),
          topRight: Radius.circular(
            getHorizontalSize(
              16.00,
            ),
          ),
          bottomLeft: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
          bottomRight: Radius.circular(
            getHorizontalSize(
              0.00,
            ),
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            6.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.InterMedium17:
        return TextStyle(
          color: ColorConstant.whiteA70001,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.LatoBold17:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            17,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.SFProDisplayRegular16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFProDisplayRegular16Gray90001:
        return TextStyle(
          color: ColorConstant.gray90001,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.PoppinsBold15:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.RalewayRegular12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.RalewayMedium10:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.LatoBold16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.RubikMedium18:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterRegular15:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.UrbanistRomanSemiBold16:
        return TextStyle(
          color: ColorConstant.blueGray700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.UrbanistRomanSemiBold16WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SFProDisplaySemibold16:
        return TextStyle(
          color: ColorConstant.indigoA10001,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SFProDisplayMedium16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsBold12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.InterMedium11:
        return TextStyle(
          color: ColorConstant.whiteA70001,
          fontSize: getFontSize(
            11,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.DMSansBold20:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.LatoSemiBold12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.SFProDisplayRegular16Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.InterMedium18:
        return TextStyle(
          color: ColorConstant.gray5001,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterSemiBold14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.InterSemiBold14Gray700:
        return TextStyle(
          color: ColorConstant.gray700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.PoppinsSemiBold16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.PoppinsMedium1792:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            17.92,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PlusJakartaSansRomanSemiBold16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.PlusJakartaSansRomanSemiBold16IndigoA100:
        return TextStyle(
          color: ColorConstant.indigoA100,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.MontserratMedium12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.LatoBold1576:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            15.76,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.PoppinsBold14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.PoppinsMedium18:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.PoppinsMedium18IndigoA100:
        return TextStyle(
          color: ColorConstant.indigoA100,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.RobotoRomanRegular14:
        return TextStyle(
          color: ColorConstant.gray10003,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.SFProTextRegular14:
        return TextStyle(
          color: ColorConstant.gray5002,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'SF Pro Text',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.RobotoMedium16:
        return TextStyle(
          color: ColorConstant.gray5002,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.RobotoMedium16WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterMedium12:
        return TextStyle(
          color: ColorConstant.gray5001,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterMedium12WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterBold16:
        return TextStyle(
          color: ColorConstant.gray90002,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.LatoMedium10:
        return TextStyle(
          color: ColorConstant.indigoA100,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Lato',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterBold16WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.RobotoMedium14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.black90001,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
        );
    }
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineGray300:
        return Border.all(
          color: ColorConstant.gray300,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineIndigo50:
        return Border.all(
          color: ColorConstant.indigo50,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineIndigoA100:
        return Border.all(
          color: ColorConstant.indigoA100,
          width: getHorizontalSize(
            2.00,
          ),
        );
      case ButtonVariant.OutlineWhiteA700:
        return Border.all(
          color: ColorConstant.whiteA700,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineIndigoA100_1:
        return Border.all(
          color: ColorConstant.indigoA100,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.OutlineRed8003f:
      case ButtonVariant.OutlineBlack9003f:
      case ButtonVariant.FillIndigoA100:
      case ButtonVariant.OutlineDeeppurpleA7003d:
      case ButtonVariant.FillIndigoA10075:
      case ButtonVariant.FillIndigoA1007f:
      case ButtonVariant.OutlineBlack9003f_1:
      case ButtonVariant.OutlineDeeppurpleA7003d_1:
      case ButtonVariant.FillBluegray5001:
      case ButtonVariant.GradientIndigoA100IndigoA100:
      case ButtonVariant.GradientIndigoA100IndigoA100_1:
      case ButtonVariant.GradientRed900Deeporange600:
      case ButtonVariant.GradientIndigoA100IndigoA100_2:
      case ButtonVariant.FillBlack900cc:
      case ButtonVariant.OutlineBlack9003f_2:
        return null;
      default:
        return null;
    }
  }

  checkGradient() {
    switch (variant) {
      case ButtonVariant.OutlineDeeppurpleA7003d:
      case ButtonVariant.Outline:
      case ButtonVariant.Outline_1:
      case ButtonVariant.OutlineDeeppurpleA7003d_1:
      case ButtonVariant.GradientIndigoA100IndigoA100:
      case ButtonVariant.GradientIndigoA100IndigoA100_1:
      case ButtonVariant.GradientRed900Deeporange600:
      case ButtonVariant.GradientIndigoA100IndigoA100_2:
        return true;
      default:
        return false;
    }
  }

  _setGradient() {
    switch (variant) {
      case ButtonVariant.OutlineDeeppurpleA7003d:
        return LinearGradient(
          begin: Alignment(
            0,
            0.05,
          ),
          end: Alignment(
            0.93,
            1,
          ),
          colors: [
            ColorConstant.indigoA10001,
            ColorConstant.indigoA100,
          ],
        );
      case ButtonVariant.Outline:
        return LinearGradient(
          begin: Alignment(
            0,
            0.05,
          ),
          end: Alignment(
            0.93,
            1,
          ),
          colors: [
            ColorConstant.indigoA10011,
            ColorConstant.deepPurpleA20011,
          ],
        );
      case ButtonVariant.Outline_1:
        return LinearGradient(
          begin: Alignment(
            0,
            0.05,
          ),
          end: Alignment(
            0.93,
            1,
          ),
          colors: [
            ColorConstant.indigoA10011,
            ColorConstant.deepPurpleA20011,
          ],
        );
      case ButtonVariant.OutlineDeeppurpleA7003d_1:
        return LinearGradient(
          begin: Alignment(
            0,
            0.05,
          ),
          end: Alignment(
            0.93,
            1,
          ),
          colors: [
            ColorConstant.indigoA10001,
            ColorConstant.deepPurpleA200,
          ],
        );
      case ButtonVariant.GradientIndigoA100IndigoA100:
        return LinearGradient(
          begin: Alignment(
            -0.49,
            0.5,
          ),
          end: Alignment(
            0.5,
            1.49,
          ),
          colors: [
            ColorConstant.indigoA100,
            ColorConstant.indigoA100,
          ],
        );
      case ButtonVariant.GradientIndigoA100IndigoA100_1:
        return LinearGradient(
          begin: Alignment(
            0,
            0.31,
          ),
          end: Alignment(
            1.02,
            0.47,
          ),
          colors: [
            ColorConstant.indigoA100,
            ColorConstant.indigoA100,
          ],
        );
      case ButtonVariant.GradientRed900Deeporange600:
        return LinearGradient(
          begin: Alignment(
            0.35,
            -0.73,
          ),
          end: Alignment(
            0.54,
            2.12,
          ),
          colors: [
            ColorConstant.red900,
            ColorConstant.deepOrange600,
          ],
        );
      case ButtonVariant.GradientIndigoA100IndigoA100_2:
        return LinearGradient(
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
        );
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.OutlineRed8003f:
      case ButtonVariant.OutlineBlack9003f:
      case ButtonVariant.FillIndigoA100:
      case ButtonVariant.OutlineGray300:
      case ButtonVariant.FillIndigoA10075:
      case ButtonVariant.FillIndigoA1007f:
      case ButtonVariant.OutlineIndigo50:
      case ButtonVariant.OutlineBlack9003f_1:
      case ButtonVariant.FillBluegray5001:
      case ButtonVariant.OutlineIndigoA100:
      case ButtonVariant.OutlineWhiteA700:
      case ButtonVariant.OutlineIndigoA100_1:
      case ButtonVariant.FillBlack900cc:
      case ButtonVariant.OutlineBlack9003f_2:
        return null;
      default:
        return null;
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case ButtonVariant.OutlineRed8003f:
        return [
          BoxShadow(
            color: ColorConstant.red8003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ];
      case ButtonVariant.OutlineBlack9003f:
        return [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ];
      case ButtonVariant.OutlineDeeppurpleA7003d:
        return [
          BoxShadow(
            color: ColorConstant.deepPurpleA7003d,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              12,
            ),
          ),
        ];
      case ButtonVariant.OutlineGray300:
        return [
          BoxShadow(
            color: ColorConstant.gray60026,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              12,
            ),
          ),
        ];
      case ButtonVariant.OutlineIndigo50:
        return [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ];
      case ButtonVariant.OutlineBlack9003f_1:
        return [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ];
      case ButtonVariant.OutlineDeeppurpleA7003d_1:
        return [
          BoxShadow(
            color: ColorConstant.deepPurpleA7003d,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              12,
            ),
          ),
        ];
      case ButtonVariant.OutlineBlack9003f_2:
        return [
          BoxShadow(
            color: ColorConstant.black9003f,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              4,
            ),
          ),
        ];
      case ButtonVariant.FillWhiteA700:
      case ButtonVariant.FillIndigoA100:
      case ButtonVariant.FillIndigoA10075:
      case ButtonVariant.FillIndigoA1007f:
      case ButtonVariant.Outline:
      case ButtonVariant.Outline_1:
      case ButtonVariant.FillBluegray5001:
      case ButtonVariant.GradientIndigoA100IndigoA100:
      case ButtonVariant.GradientIndigoA100IndigoA100_1:
      case ButtonVariant.GradientRed900Deeporange600:
      case ButtonVariant.OutlineIndigoA100:
      case ButtonVariant.GradientIndigoA100IndigoA100_2:
      case ButtonVariant.OutlineWhiteA700:
      case ButtonVariant.OutlineIndigoA100_1:
      case ButtonVariant.FillBlack900cc:
        return null;
      default:
        return null;
    }
  }
}

enum ButtonShape {
  Square,
  RoundedBorder20,
  RoundedBorder25,
  CustomBorderTL10,
  RoundedBorder15,
  CircleBorder12,
  RoundedBorder6,
  RoundedBorder2,
  CircleBorder29,
  CustomBorderTL32,
  CustomBorderTL16,
}
enum ButtonPadding {
  PaddingT10,
  PaddingAll15,
  PaddingAll12,
  PaddingT4,
  PaddingAll19,
  PaddingAll6,
  PaddingT86,
  PaddingT14,
  PaddingT17,
  PaddingT7,
  PaddingT7_1,
  PaddingT31,
  PaddingT12,
  PaddingAll9,
}
enum ButtonVariant {
  FillWhiteA700,
  OutlineRed8003f,
  OutlineBlack9003f,
  FillIndigoA100,
  OutlineDeeppurpleA7003d,
  OutlineGray300,
  FillIndigoA10075,
  FillIndigoA1007f,
  OutlineIndigo50,
  OutlineBlack9003f_1,
  Outline,
  Outline_1,
  OutlineDeeppurpleA7003d_1,
  FillBluegray5001,
  GradientIndigoA100IndigoA100,
  GradientIndigoA100IndigoA100_1,
  GradientRed900Deeporange600,
  OutlineIndigoA100,
  GradientIndigoA100IndigoA100_2,
  OutlineWhiteA700,
  OutlineIndigoA100_1,
  FillBlack900cc,
  OutlineBlack9003f_2,
}
enum ButtonFontStyle {
  InterBold12,
  InterMedium17,
  LatoBold17,
  SFProDisplayRegular16,
  SFProDisplayRegular16Gray90001,
  PoppinsBold15,
  RalewayRegular12,
  RalewayMedium10,
  LatoBold16,
  RubikMedium18,
  InterRegular15,
  UrbanistRomanSemiBold16,
  UrbanistRomanSemiBold16WhiteA700,
  SFProDisplaySemibold16,
  SFProDisplayMedium16,
  PoppinsBold12,
  InterMedium11,
  DMSansBold20,
  LatoSemiBold12,
  SFProDisplayRegular16Gray600,
  InterMedium18,
  InterSemiBold14,
  InterSemiBold14Gray700,
  PoppinsSemiBold16,
  PoppinsMedium1792,
  PlusJakartaSansRomanSemiBold16,
  PlusJakartaSansRomanSemiBold16IndigoA100,
  MontserratMedium12,
  LatoBold1576,
  PoppinsBold14,
  PoppinsMedium18,
  PoppinsMedium18IndigoA100,
  RobotoRomanRegular14,
  SFProTextRegular14,
  RobotoMedium16,
  RobotoMedium16WhiteA700,
  InterMedium12,
  InterMedium12WhiteA700,
  InterBold16,
  LatoMedium10,
  InterBold16WhiteA700,
  RobotoMedium14,
}
