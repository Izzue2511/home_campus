import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
// import 'package:homecampus/widgets/custom_phone_number.dart';
import 'package:homecampus/presentation/phone_confirmation_student_dialog/phone_confirmation_student_dialog.dart';

// ignore_for_file: must_be_immutable
class OtpVerificationStudentScreen extends StatelessWidget {
 Country selectedCountry = CountryPickerUtils.getCountryByPhoneCode('1'); // Assuming '1' for the United States

TextEditingController phoneNumberController = TextEditingController();

@override
Widget build(BuildContext context) {
 return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.gray90005,
         resizeToAvoidBottomInset: false,
         body: Container(
             width: double.maxFinite,
             padding: getPadding(left: 38, top: 35, right: 38, bottom: 35),
             child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                  CustomIconButton(
                      height: 37,
                      width: 37,
                      alignment: Alignment.centerLeft,
                      onTap: () {
                       onTapBtnIcback(context);
                       },
                      child: CustomImageView(svgPath: ImageConstant.imgIcback),
                  ),
                  CustomImageView(
                      svgPath: ImageConstant.imgUndrawconfirmed81ex1,
                      height: getVerticalSize(115),
                      width: getHorizontalSize(110),
                      margin: getMargin(top: 37),
                  ),
                  Padding(
                      padding: getPadding(top: 57),
                      child: Text(
                          "OTP Verification",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtPoppinsBold22),
                  ),
                  Container(
                      width: getHorizontalSize(242),
                      margin: getMargin(left: 48, top: 25, right: 48),
                      child: Text(
                          "We will send you one-time password to your mobile number",
                          maxLines: null,
                          textAlign: TextAlign.center,
                          style: AppStyle.txtPoppinsRegular14WhiteA700,
                      ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 47, top: 60),
                          child: Text("ENTER YOUR MOBILE NUMBER",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtPoppinsBold8,
                          ),
                      ),
                  ),
                  Container(
                      height: getVerticalSize(34),
                      width: getHorizontalSize(244),
                      margin: getMargin(top: 11),
                      child: Stack(
                          alignment: Alignment.center,
                          children: [
                           CustomImageView(
                               svgPath: ImageConstant.imgCancelicon,
                               height: getSize(5),
                               width: getSize(5),
                               alignment: Alignment.topRight,
                               margin: getMargin(top: 10, right: 4),
                           ),
                           Row(
                               children: [
                                Padding(
                                    padding: getPadding(left: 2, bottom: 7),
                                    child: CountryPickerUtils.getDefaultFlagImage(selectedCountry),
                                ),
                                CountryPickerUtils.getDefaultFlagImage(selectedCountry),
                               ],
                           )
                          ],
                      ),
                  ),
                  GestureDetector(onTap: () {onTapButton(context);}, child: Container(height: getVerticalSize(58), width: getHorizontalSize(224), margin: getMargin(top: 49, bottom: 5), child: Stack(alignment: Alignment.center, children: [Align(alignment: Alignment.center, child: Container(height: getVerticalSize(58), width: getHorizontalSize(210), decoration: BoxDecoration(borderRadius: BorderRadius.circular(getHorizontalSize(29)), gradient: LinearGradient(begin: Alignment(-0.5, 0.5), end: Alignment(0.5, 1.5), colors: [ColorConstant.indigoA100, ColorConstant.indigoA100])))), Align(alignment: Alignment.center, child: Text("Get OTP", overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.txtPoppinsBold14WhiteA700))])))])))); }
onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.registerStudentScreen); } 
onTapButton(BuildContext context) { showDialog(context: context, builder: (_) => AlertDialog(content: PhoneConfirmationStudentDialog(),backgroundColor: Colors.transparent, contentPadding: EdgeInsets.zero, insetPadding: EdgeInsets.only(left: 0),)); } 
 }
