import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
// import 'package:homecampus/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class SlidershadowItemWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: getVerticalSize(
          352,
        ),
        width: getHorizontalSize(
          369,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: getVerticalSize(
                  335,
                ),
                width: getHorizontalSize(
                  369,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    CustomImageView(
                      imagePath: 'assets/images/house_1.jpg',
                      height: getVerticalSize(
                        290,
                      ),
                      width: getHorizontalSize(
                        369,
                      ),
                      radius: BorderRadius.circular(
                        getHorizontalSize(
                          20,
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
