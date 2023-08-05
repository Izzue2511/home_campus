import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

// ignore: must_be_immutable
class ChatDeleteItemWidget extends StatelessWidget {
  ChatDeleteItemWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.circleBorder26,
          ),
          child: Container(
            height: getSize(
              52,
            ),
            width: getSize(
              52,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusStyle.circleBorder26,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgImage52x52,
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
                  alignment: Alignment.center,
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage2,
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
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: getPadding(
            left: 21,
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
            top: 6,
            bottom: 30,
          ),
          child: Text(
            "11/10/2021",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtSFProDisplayRegular12.copyWith(
              letterSpacing: getHorizontalSize(
                0.24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
