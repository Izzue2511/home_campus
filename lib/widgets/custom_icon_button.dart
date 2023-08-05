import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {this.shape,
      this.padding,
      this.variant,
      this.alignment,
      this.margin,
      this.width,
      this.height,
      this.child,
      this.onTap});

  IconButtonShape? shape;

  IconButtonPadding? padding;

  IconButtonVariant? variant;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  double? width;

  double? height;

  Widget? child;

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildIconButtonWidget(),
          )
        : _buildIconButtonWidget();
  }

  _buildIconButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: IconButton(
        visualDensity: VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        iconSize: getSize(height ?? 0),
        padding: EdgeInsets.all(0),
        icon: Container(
          alignment: Alignment.center,
          width: getSize(width ?? 0),
          height: getSize(height ?? 0),
          padding: _setPadding(),
          decoration: _buildDecoration(),
          child: child,
        ),
        onPressed: onTap,
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
      boxShadow: _setBoxShadow(),
    );
  }

  _setPadding() {
    switch (padding) {
      case IconButtonPadding.PaddingAll9:
        return getPadding(
          all: 9,
        );
      case IconButtonPadding.PaddingAll14:
        return getPadding(
          all: 14,
        );
      case IconButtonPadding.PaddingAll6:
        return getPadding(
          all: 6,
        );
      case IconButtonPadding.PaddingAll23:
        return getPadding(
          all: 23,
        );
      default:
        return getPadding(
          all: 3,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case IconButtonVariant.FillIndigoA100:
        return ColorConstant.indigoA100;
      case IconButtonVariant.FillGray10001:
        return ColorConstant.gray10001;
      case IconButtonVariant.FillWhiteA70087:
        return ColorConstant.whiteA70087;
      case IconButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case IconButtonVariant.FillWhiteA70075:
        return ColorConstant.whiteA70075;
      case IconButtonVariant.OutlineBlack9003f:
        return ColorConstant.indigoA1007f;
      case IconButtonVariant.FillWhiteA7008c:
        return ColorConstant.whiteA7008c;
      case IconButtonVariant.FillGray30066:
        return ColorConstant.gray30066;
      case IconButtonVariant.OutlineGray10001:
        return ColorConstant.gray10001;
      default:
        return ColorConstant.indigoA1007f;
    }
  }

  _setBorder() {
    switch (variant) {
      case IconButtonVariant.OutlineGray10001:
        return Border.all(
          color: ColorConstant.gray10001,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case IconButtonVariant.FillIndigoA1007f:
      case IconButtonVariant.FillIndigoA100:
      case IconButtonVariant.FillGray10001:
      case IconButtonVariant.FillWhiteA70087:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.FillWhiteA70075:
      case IconButtonVariant.OutlineBlack9003f:
      case IconButtonVariant.FillWhiteA7008c:
      case IconButtonVariant.FillGray30066:
        return null;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case IconButtonShape.RoundedBorder29:
        return BorderRadius.circular(
          getHorizontalSize(
            29.00,
          ),
        );
      case IconButtonShape.CircleBorder25:
        return BorderRadius.circular(
          getHorizontalSize(
            25.00,
          ),
        );
      case IconButtonShape.RoundedBorder32:
        return BorderRadius.circular(
          getHorizontalSize(
            32.00,
          ),
        );
      case IconButtonShape.CircleBorder12:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
      case IconButtonShape.CircleBorder22:
        return BorderRadius.circular(
          getHorizontalSize(
            22.00,
          ),
        );
      case IconButtonShape.CircleBorder36:
        return BorderRadius.circular(
          getHorizontalSize(
            36.00,
          ),
        );
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            18.00,
          ),
        );
    }
  }

  _setBoxShadow() {
    switch (variant) {
      case IconButtonVariant.OutlineBlack9003f:
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
      case IconButtonVariant.FillIndigoA1007f:
      case IconButtonVariant.FillIndigoA100:
      case IconButtonVariant.FillGray10001:
      case IconButtonVariant.FillWhiteA70087:
      case IconButtonVariant.FillWhiteA700:
      case IconButtonVariant.FillWhiteA70075:
      case IconButtonVariant.FillWhiteA7008c:
      case IconButtonVariant.FillGray30066:
      case IconButtonVariant.OutlineGray10001:
        return null;
      default:
        return null;
    }
  }
}

enum IconButtonShape {
  RoundedBorder18,
  RoundedBorder29,
  CircleBorder25,
  RoundedBorder32,
  CircleBorder12,
  CircleBorder22,
  CircleBorder36,
}
enum IconButtonPadding {
  PaddingAll3,
  PaddingAll9,
  PaddingAll14,
  PaddingAll6,
  PaddingAll23,
}
enum IconButtonVariant {
  FillIndigoA1007f,
  FillIndigoA100,
  FillGray10001,
  FillWhiteA70087,
  FillWhiteA700,
  FillWhiteA70075,
  OutlineBlack9003f,
  FillWhiteA7008c,
  FillGray30066,
  OutlineGray10001,
}
