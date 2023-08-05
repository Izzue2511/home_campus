import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class SettingscardsItemWidget extends StatelessWidget {
  SettingscardsItemWidget({this.onTapSettingscard});

  VoidCallback? onTapSettingscard;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapSettingscard?.call();
      },
      child: Container(
        padding: getPadding(
          left: 16,
          top: 9,
          right: 16,
          bottom: 9,
        ),
        decoration: AppDecoration.fillGray30066.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder29,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIconButton(
              height: 33,
              width: 33,
              margin: getMargin(
                top: 3,
                bottom: 3,
              ),
              variant: IconButtonVariant.FillGray30066,
              padding: IconButtonPadding.PaddingAll6,
              child: CustomImageView(
                svgPath: ImageConstant.imgIconaccount,
              ),
            ),
            Padding(
              padding: getPadding(
                left: 8,
                top: 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtDMSansMedium13,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 6,
                    ),
                    child: Text(
                      "",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtDMSansRegular11,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomIconButton(
              height: 33,
              width: 33,
              margin: getMargin(
                top: 3,
                bottom: 3,
              ),
              variant: IconButtonVariant.FillIndigoA100,
              padding: IconButtonPadding.PaddingAll6,
              child: CustomImageView(
                svgPath: ImageConstant.imgButtonicon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
