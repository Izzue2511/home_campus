import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore: must_be_immutable
class ChatOwnerItemWidget extends StatelessWidget {
  ChatOwnerItemWidget({this.onTapChatsection});

  VoidCallback? onTapChatsection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapChatsection?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage,
            height: getSize(
              52,
            ),
            width: getSize(
              52,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                26,
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 16,
              top: 5,
              bottom: 4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFProDisplaySemibold16.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.21,
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 5,
                  ),
                  child: Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFProDisplayRegular14.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: getPadding(
              top: 4,
              bottom: 6,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.txtSFProDisplayRegular12.copyWith(
                    letterSpacing: getHorizontalSize(
                      0.24,
                    ),
                  ),
                ),
                Container(
                  width: getSize(
                    20,
                  ),
                  margin: getMargin(
                    top: 6,
                  ),
                  padding: getPadding(
                    left: 5,
                    top: 2,
                    right: 5,
                    bottom: 2,
                  ),
                  decoration:
                      AppDecoration.txtGradientIndigoA10001IndigoA100.copyWith(
                    borderRadius: BorderRadiusStyle.txtCircleBorder10,
                  ),
                  child: Text(
                    "",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtSFProDisplaySemibold12.copyWith(
                      letterSpacing: getHorizontalSize(
                        0.24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
