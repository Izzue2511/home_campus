import '../review_screen_owner_screen/widgets/review_screen1_item_widget.dart';import 'package:flutter/material.dart';import 'package:homecampus/core/app_export.dart';import 'package:homecampus/widgets/custom_button.dart';import 'package:homecampus/widgets/custom_icon_button.dart';import 'package:outline_gradient_button/outline_gradient_button.dart';class ReviewScreenOwnerScreen extends StatelessWidget {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, body: Container(width: double.maxFinite, child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Container(height: getVerticalSize(1044), width: double.maxFinite, child: Stack(alignment: Alignment.bottomRight, children: [Align(alignment: Alignment.topCenter, child: Card(clipBehavior: Clip.antiAlias, elevation: 0, margin: EdgeInsets.all(0), color: ColorConstant.gray50, shape: RoundedRectangleBorder(side: BorderSide(color: ColorConstant.gray300, width: getHorizontalSize(1)), borderRadius: BorderRadiusStyle.customBorderTL40), child: Container(height: getVerticalSize(848), width: double.maxFinite, padding: getPadding(left: 19, right: 19), decoration: AppDecoration.outlineGray3001.copyWith(borderRadius: BorderRadiusStyle.customBorderTL40), child: Stack(alignment: Alignment.topCenter, children: [Align(alignment: Alignment.topCenter, child: Container(margin: getMargin(left: 1, bottom: 722), padding: getPadding(left: 18, top: 33, right: 18, bottom: 33), decoration: AppDecoration.outlineGray50026, child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [CustomIconButton(height: 37, width: 37, margin: getMargin(bottom: 22), onTap: () {onTapBtnIcback(context);}, child: CustomImageView(svgPath: ImageConstant.imgIcback)), Padding(padding: getPadding(left: 101, top: 8, bottom: 33), child: Text("Reviews", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtRalewayBold15))]))), Align(alignment: Alignment.topCenter, child: Padding(padding: getPadding(top: 92), child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [Padding(padding: getPadding(bottom: 35), child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Text("4.3", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtMetropolisSemiBold44), Padding(padding: getPadding(top: 4), child: Text("23 ratings", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtMetropolisRegular14))])), Padding(padding: getPadding(left: 27, top: 3), child: Column(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.end, children: [Container(width: getHorizontalSize(74), child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14)), CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14), margin: getMargin(left: 1)), CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14), margin: getMargin(left: 1)), CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14), margin: getMargin(left: 1)), CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14), margin: getMargin(left: 1))])), Container(height: getVerticalSize(8), width: getHorizontalSize(114), margin: getMargin(left: 10, top: 3, bottom: 3), decoration: BoxDecoration(color: ColorConstant.orange300, borderRadius: BorderRadius.circular(getHorizontalSize(4)))), Padding(padding: getPadding(left: 23), child: Text("12", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtMetropolisRegular14))]), Padding(padding: getPadding(top: 5, right: 1), child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14)), CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14), margin: getMargin(left: 1)), CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14), margin: getMargin(left: 1)), CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14), margin: getMargin(left: 2)), Container(height: getVerticalSize(8), width: getHorizontalSize(40), margin: getMargin(left: 9, top: 3, bottom: 3), decoration: BoxDecoration(color: ColorConstant.orange300, borderRadius: BorderRadius.circular(getHorizontalSize(4)))), Padding(padding: getPadding(left: 101), child: Text("5", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtMetropolisRegular14))])), Padding(padding: getPadding(top: 5, right: 1), child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14)), CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14), margin: getMargin(left: 1)), CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14), margin: getMargin(left: 2)), Container(height: getVerticalSize(8), width: getHorizontalSize(29), margin: getMargin(left: 9, top: 3, bottom: 3), decoration: BoxDecoration(color: ColorConstant.orange300, borderRadius: BorderRadius.circular(getHorizontalSize(4)))), Padding(padding: getPadding(left: 112), child: Text("4", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtMetropolisRegular14))])), Padding(padding: getPadding(top: 5), child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14)), CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14), margin: getMargin(left: 2)), Container(height: getVerticalSize(8), width: getHorizontalSize(15), margin: getMargin(left: 9, top: 3, bottom: 3), decoration: BoxDecoration(color: ColorConstant.orange300, borderRadius: BorderRadius.circular(getHorizontalSize(4)))), Padding(padding: getPadding(left: 127), child: Text("2", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtMetropolisRegular14))])), Padding(padding: getPadding(top: 6, right: 1), child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [CustomImageView(svgPath: ImageConstant.imgStarOrange300, height: getSize(14), width: getSize(14)), Container(height: getSize(8), width: getSize(8), margin: getMargin(left: 10, top: 3, bottom: 3), decoration: BoxDecoration(color: ColorConstant.orange300, borderRadius: BorderRadius.circular(getHorizontalSize(4)))), Padding(padding: getPadding(left: 132), child: Text("0", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtMetropolisRegular14))]))]))])))])))), Align(alignment: Alignment.bottomRight, child: Padding(padding: getPadding(bottom: 23), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start, children: [Row(children: [CustomButton(height: getVerticalSize(50), width: getHorizontalSize(100), text: "All Review", fontStyle: ButtonFontStyle.PoppinsBold12), Container(width: getHorizontalSize(62), margin: getMargin(left: 12), padding: getPadding(left: 16, top: 15, right: 16, bottom: 15), decoration: AppDecoration.outlineIndigoA1002.copyWith(borderRadius: BorderRadiusStyle.roundedBorder5), child: Row(children: [CustomImageView(svgPath: ImageConstant.imgStar104, height: getSize(16), width: getSize(16), margin: getMargin(top: 1, bottom: 1)), Padding(padding: getPadding(left: 10), child: Text("1", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtPoppinsRegular12.copyWith(letterSpacing: getHorizontalSize(0.5))))])), Container(width: getHorizontalSize(65), margin: getMargin(left: 12), padding: getPadding(left: 16, top: 15, right: 16, bottom: 15), decoration: AppDecoration.outlineIndigoA1002.copyWith(borderRadius: BorderRadiusStyle.roundedBorder5), child: Row(children: [CustomImageView(svgPath: ImageConstant.imgStar105, height: getSize(16), width: getSize(16), margin: getMargin(top: 1, bottom: 1)), Padding(padding: getPadding(left: 10), child: Text("2", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtPoppinsRegular12.copyWith(letterSpacing: getHorizontalSize(0.5))))])), Container(width: getHorizontalSize(66), margin: getMargin(left: 12), padding: getPadding(left: 16, top: 15, right: 16, bottom: 15), decoration: AppDecoration.outlineIndigoA1002.copyWith(borderRadius: BorderRadiusStyle.roundedBorder5), child: Row(children: [CustomImageView(svgPath: ImageConstant.imgStar106, height: getSize(16), width: getSize(16), margin: getMargin(top: 1, bottom: 1)), Padding(padding: getPadding(left: 10), child: Text("3", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtPoppinsRegular12.copyWith(letterSpacing: getHorizontalSize(0.5))))])), Container(width: getHorizontalSize(66), margin: getMargin(left: 12), padding: getPadding(all: 16), decoration: AppDecoration.outlineIndigoA1002.copyWith(borderRadius: BorderRadiusStyle.roundedBorder5), child: Row(children: [CustomImageView(svgPath: ImageConstant.imgStar107, height: getSize(16), width: getSize(16), margin: getMargin(top: 1, bottom: 1)), Padding(padding: getPadding(left: 10), child: Text("4", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtPoppinsRegular12.copyWith(letterSpacing: getHorizontalSize(0.5))))])), Container(width: getHorizontalSize(66), margin: getMargin(left: 12), padding: getPadding(all: 16), decoration: AppDecoration.outlineIndigoA1002.copyWith(borderRadius: BorderRadiusStyle.roundedBorder5), child: Row(children: [CustomImageView(svgPath: ImageConstant.imgStar108, height: getSize(16), width: getSize(16), margin: getMargin(top: 1, bottom: 1)), Padding(padding: getPadding(left: 10), child: Text("5", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtPoppinsRegular12.copyWith(letterSpacing: getHorizontalSize(0.5))))]))]), Padding(padding: getPadding(top: 22, right: 146), child: Row(children: [CustomImageView(svgPath: ImageConstant.imgMenu, height: getSize(24), width: getSize(24), margin: getMargin(top: 1, bottom: 1)), Padding(padding: getPadding(left: 8, top: 4, bottom: 4), child: Text("Sort", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFProDisplayRegular14IndigoA100.copyWith(letterSpacing: getHorizontalSize(0.28)))), CustomButton(height: getVerticalSize(26), width: getHorizontalSize(102), text: "Add Review", margin: getMargin(left: 179), padding: ButtonPadding.PaddingT4, fontStyle: ButtonFontStyle.InterMedium11, prefixWidget: Container(margin: getMargin(right: 5), child: CustomImageView(svgPath: ImageConstant.imgShare)))])), Expanded(child: Padding(padding: getPadding(top: 19, right: 158), child: ListView.separated(physics: BouncingScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(10));}, itemCount: 4, itemBuilder: (context, index) {return ReviewScreen1ItemWidget();}))), Padding(padding: getPadding(left: 21, top: 20, right: 148), child: OutlineGradientButton(padding: EdgeInsets.only(left: getHorizontalSize(1), top: getVerticalSize(1), right: getHorizontalSize(1), bottom: getVerticalSize(1)), strokeWidth: getHorizontalSize(1), gradient: LinearGradient(begin: Alignment(0, 0.05), end: Alignment(0.93, 1), colors: [ColorConstant.indigoA10001, ColorConstant.indigoA100]), corners: Corners(topLeft: Radius.circular(24), topRight: Radius.circular(24), bottomLeft: Radius.circular(24), bottomRight: Radius.circular(24)), child: CustomButton(text: "Show more results", margin: getMargin(left: 21, top: 20, right: 148), variant: ButtonVariant.Outline_1, shape: ButtonShape.RoundedBorder25, fontStyle: ButtonFontStyle.SFProDisplaySemibold16)))])))]))])))); } 
onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.detailsHouseRentalScreen); } 
 }
