import 'package:flutter/material.dart';import 'package:homecampus/core/app_export.dart';import 'package:homecampus/widgets/custom_icon_button.dart';import 'package:homecampus/presentation/face_verification_pending_dialog/face_verification_pending_dialog.dart';class IcVerifyingScreen extends StatelessWidget {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.gray90005, body: Container(width: double.maxFinite, padding: getPadding(left: 54, top: 151, right: 54), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Text("Verifying...", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanMedium25), Container(width: getHorizontalSize(295), margin: getMargin(top: 10, right: 10), child: Text("Your verification is pending. You can start using the app \nwhile we verify your details. Thank You", maxLines: null, textAlign: TextAlign.left, style: AppStyle.txtRobotoRomanRegular12)), Spacer(), CustomIconButton(height: 72, width: 72, margin: getMargin(right: 1, bottom: 170), variant: IconButtonVariant.FillIndigoA100, shape: IconButtonShape.CircleBorder36, padding: IconButtonPadding.PaddingAll23, alignment: Alignment.centerRight, onTap: () {onTapBtnGroupfortyfive(context);}, child: CustomImageView(svgPath: ImageConstant.imgGroup45))])))); } 
onTapBtnGroupfortyfive(BuildContext context) { showDialog(context: context, builder: (_) => AlertDialog(content: FaceVerificationPendingDialog(),backgroundColor: Colors.transparent, contentPadding: EdgeInsets.zero, insetPadding: EdgeInsets.only(left: 0),)); } 
 }
