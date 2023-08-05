import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.width,
      this.margin,
      this.controller,
      this.focusNode,
      this.autofocus = false,
      this.isObscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.validator});

  TextFormFieldShape? shape;

  TextFormFieldPadding? padding;

  TextFormFieldVariant? variant;

  TextFormFieldFontStyle? fontStyle;

  Alignment? alignment;

  double? width;

  EdgeInsetsGeometry? margin;

  TextEditingController? controller;

  FocusNode? focusNode;

  bool? autofocus;

  bool? isObscureText;

  TextInputAction? textInputAction;

  TextInputType? textInputType;

  int? maxLines;

  String? hintText;

  Widget? prefix;

  BoxConstraints? prefixConstraints;

  Widget? suffix;

  BoxConstraints? suffixConstraints;

  FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(),
          )
        : _buildTextFormFieldWidget();
  }

  _buildTextFormFieldWidget() {
    return Container(
      width: width ?? double.maxFinite,
      margin: margin,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        autofocus: autofocus!,
        style: _setFontStyle(),
        obscureText: isObscureText!,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines ?? 1,
        decoration: _buildDecoration(),
        validator: validator,
      ),
    );
  }

  _buildDecoration() {
    return InputDecoration(
      hintText: hintText ?? "",
      hintStyle: _setFontStyle(),
      border: _setBorderStyle(),
      enabledBorder: _setBorderStyle(),
      focusedBorder: _setBorderStyle(),
      disabledBorder: _setBorderStyle(),
      prefixIcon: prefix,
      prefixIconConstraints: prefixConstraints,
      suffixIcon: suffix,
      suffixIconConstraints: suffixConstraints,
      fillColor: _setFillColor(),
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _setFontStyle() {
    switch (fontStyle) {
      case TextFormFieldFontStyle.InterRegular15:
        return TextStyle(
          color: ColorConstant.indigoA100,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.RubikLight14:
        return TextStyle(
          color: ColorConstant.blueGray900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w300,
        );
      case TextFormFieldFontStyle.RubikLight14Gray600:
        return TextStyle(
          color: ColorConstant.gray600,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w300,
        );
      case TextFormFieldFontStyle.InterRegular16:
        return TextStyle(
          color: ColorConstant.blueGray40002,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.PoppinsMedium1433:
        return TextStyle(
          color: ColorConstant.gray50002,
          fontSize: getFontSize(
            14.33,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.PoppinsMedium566:
        return TextStyle(
          color: ColorConstant.green200,
          fontSize: getFontSize(
            5.66,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.PoppinsBold18:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            18,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        );
      case TextFormFieldFontStyle.PlusJakartaSansItalicMedium16:
        return TextStyle(
          color: ColorConstant.blueGray60001,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w500,
        );
      case TextFormFieldFontStyle.TrebuchetMS15:
        return TextStyle(
          color: ColorConstant.gray400,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Trebuchet MS',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.PoppinsRegular12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        );
      case TextFormFieldFontStyle.InterSemiBold14:
        return TextStyle(
          color: ColorConstant.gray90002,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case TextFormFieldFontStyle.InterMedium14:
        return TextStyle(
          color: ColorConstant.blueGray300,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.gray700,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        );
    }
  }

  _setOutlineBorderRadius() {
    switch (shape) {
      case TextFormFieldShape.RoundedBorder6:
        return BorderRadius.circular(
          getHorizontalSize(
            6.00,
          ),
        );
      case TextFormFieldShape.RoundedBorder20:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
      case TextFormFieldShape.RoundedBorder23:
        return BorderRadius.circular(
          getHorizontalSize(
            23.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        );
    }
  }

  _setBorderStyle() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBlack9003f:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineWhiteA700:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.whiteA700,
            width: 1,
          ),
        );
      case TextFormFieldVariant.OutlineBluegray9007f:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.blueGray9007f,
            width: 1,
          ),
        );
      case TextFormFieldVariant.OutlineBluegray40002:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.blueGray40002,
            width: 1,
          ),
        );
      case TextFormFieldVariant.UnderLineIndigoA100:
        return UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstant.indigoA100,
          ),
        );
      case TextFormFieldVariant.OutlineIndigoA100:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.indigoA100,
            width: 1,
          ),
        );
      case TextFormFieldVariant.OutlineBlack9004c:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineBlack90035:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide.none,
        );
      case TextFormFieldVariant.OutlineIndigo50:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.indigo50,
            width: 1,
          ),
        );
      case TextFormFieldVariant.None:
        return InputBorder.none;
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: BorderSide(
            color: ColorConstant.gray50001,
            width: 1,
          ),
        );
    }
  }

  _setFillColor() {
    switch (variant) {
      case TextFormFieldVariant.OutlineBlack9003f:
        return ColorConstant.gray100;
      case TextFormFieldVariant.OutlineIndigoA100:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineBlack9004c:
        return ColorConstant.whiteA700;
      case TextFormFieldVariant.OutlineBlack90035:
        return ColorConstant.whiteA700;
      default:
        return null;
    }
  }

  _setFilled() {
    switch (variant) {
      case TextFormFieldVariant.OutlineGray50001:
        return false;
      case TextFormFieldVariant.OutlineBlack9003f:
        return true;
      case TextFormFieldVariant.OutlineWhiteA700:
        return false;
      case TextFormFieldVariant.OutlineBluegray9007f:
        return false;
      case TextFormFieldVariant.OutlineBluegray40002:
        return false;
      case TextFormFieldVariant.UnderLineIndigoA100:
        return false;
      case TextFormFieldVariant.OutlineIndigoA100:
        return true;
      case TextFormFieldVariant.OutlineBlack9004c:
        return true;
      case TextFormFieldVariant.OutlineBlack90035:
        return true;
      case TextFormFieldVariant.UnderLine:
        return false;
      case TextFormFieldVariant.UnderLine_1:
        return false;
      case TextFormFieldVariant.OutlineIndigo50:
        return false;
      case TextFormFieldVariant.None:
        return false;
      default:
        return false;
    }
  }

  _setPadding() {
    switch (padding) {
      case TextFormFieldPadding.PaddingAll11:
        return getPadding(
          all: 11,
        );
      case TextFormFieldPadding.PaddingT97:
        return getPadding(
          left: 15,
          top: 97,
          right: 15,
          bottom: 97,
        );
      case TextFormFieldPadding.PaddingT14:
        return getPadding(
          left: 12,
          top: 14,
          right: 12,
          bottom: 14,
        );
      case TextFormFieldPadding.PaddingT16:
        return getPadding(
          top: 16,
          right: 16,
          bottom: 16,
        );
      case TextFormFieldPadding.PaddingT9:
        return getPadding(
          top: 9,
          right: 7,
          bottom: 9,
        );
      case TextFormFieldPadding.PaddingT14_1:
        return getPadding(
          left: 14,
          top: 14,
          bottom: 14,
        );
      case TextFormFieldPadding.PaddingT91:
        return getPadding(
          left: 16,
          top: 91,
          right: 16,
          bottom: 91,
        );
      default:
        return getPadding(
          all: 18,
        );
    }
  }
}

enum TextFormFieldShape {
  RoundedBorder10,
  RoundedBorder6,
  RoundedBorder20,
  RoundedBorder23,
}
enum TextFormFieldPadding {
  PaddingAll11,
  PaddingT97,
  PaddingAll18,
  PaddingT14,
  PaddingT16,
  PaddingT9,
  PaddingT14_1,
  PaddingT91,
}
enum TextFormFieldVariant {
  None,
  OutlineGray50001,
  OutlineBlack9003f,
  OutlineWhiteA700,
  OutlineBluegray9007f,
  OutlineBluegray40002,
  UnderLineIndigoA100,
  OutlineIndigoA100,
  OutlineBlack9004c,
  OutlineBlack90035,
  UnderLine,
  UnderLine_1,
  OutlineIndigo50,
}
enum TextFormFieldFontStyle {
  DMSansRegular13,
  InterRegular15,
  RubikLight14,
  RubikLight14Gray600,
  InterRegular16,
  PoppinsMedium1433,
  PoppinsMedium566,
  PoppinsBold18,
  PlusJakartaSansItalicMedium16,
  TrebuchetMS15,
  PoppinsRegular12,
  InterSemiBold14,
  InterMedium14,
}
