import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/presentation/welcome_user_screen/welcome_user_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay the navigation to the next screen after 5 seconds
    Future.delayed(Duration(seconds: 4), () {
      // Navigate to the next screen
      // Replace `NextScreen` with the desired screen you want to navigate to
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeUserScreen()),
      );
    });

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.black900,
        body: Container(
          height: getVerticalSize(832),
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage1,
                height: getVerticalSize(832),
                width: getHorizontalSize(414),
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Container(
                    height: getVerticalSize(832),
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: getPadding(top: 393),
                            child: SizedBox(
                              width: getHorizontalSize(112),
                              child: Divider(
                                height: getVerticalSize(1),
                                thickness: getVerticalSize(1),
                                color: ColorConstant.whiteA700,
                                endIndent: getHorizontalSize(90),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            padding: getPadding(
                              left: 95,
                              top: 109,
                              right: 95,
                              bottom: 109,
                            ),
                            decoration: AppDecoration.gradientBlack900adBlack90000,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgGroup1000003418,
                                  height: getVerticalSize(211),
                                  width: getHorizontalSize(223),
                                  margin: getMargin(bottom: 403),
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
            ],
          ),
        ),
      ),
    );
  }
}
