import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';

// ignore_for_file: must_be_immutable
class SavedDeleteBottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        child: Container(
          width: double.maxFinite,
          padding: getPadding(
            left: 22,
            top: 21,
            right: 22,
            bottom: 21,
          ),
          decoration: AppDecoration.fillWhiteA700.copyWith(
            borderRadius: BorderRadiusStyle.customBorderTL30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: getHorizontalSize(
                  56,
                ),
                child: Divider(
                  height: getVerticalSize(
                    3,
                  ),
                  thickness: getVerticalSize(
                    3,
                  ),
                  color: ColorConstant.gray400,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 8,
                ),
                child: Text(
                  "Remove from Favorites",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtLatoSemiBold24,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: getPadding(
                    top: 11,
                  ),
                  child: Divider(
                    height: getVerticalSize(
                      2,
                    ),
                    thickness: getVerticalSize(
                      2,
                    ),
                    color: ColorConstant.gray4007f,
                    endIndent: getHorizontalSize(
                      24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(
                  left: 15,
                  top: 22,
                  right: 15,
                  bottom: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      height: getVerticalSize(
                        48,
                      ),
                      width: getHorizontalSize(
                        140,
                      ),
                      text: "Cancel",
                      variant: ButtonVariant.OutlineBlack9003f,
                      shape: ButtonShape.RoundedBorder20,
                      fontStyle: ButtonFontStyle.LatoBold17,
                    ),
                    CustomButton(
                      height: getVerticalSize(
                        48,
                      ),
                      width: getHorizontalSize(
                        140,
                      ),
                      text: "Yes, Remove",
                      shape: ButtonShape.RoundedBorder20,
                      fontStyle: ButtonFontStyle.LatoBold17,
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
