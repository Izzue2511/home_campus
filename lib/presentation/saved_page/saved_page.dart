import '../saved_page/widgets/saved_item_widget.dart';import 'package:flutter/material.dart';import 'package:homecampus/core/app_export.dart';import 'package:homecampus/widgets/app_bar/appbar_image.dart';import 'package:homecampus/widgets/app_bar/appbar_subtitle_5.dart';import 'package:homecampus/widgets/app_bar/custom_app_bar.dart';import 'package:homecampus/widgets/custom_button.dart';import 'package:homecampus/presentation/saved_delete_bottomsheet/saved_delete_bottomsheet.dart';class SavedPage extends StatelessWidget {@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(backgroundColor: ColorConstant.whiteA700, appBar: CustomAppBar(height: getVerticalSize(74), title: Container(height: getVerticalSize(44), width: getHorizontalSize(291), margin: getMargin(left: 37, top: 30), child: Stack(children: [AppbarImage(height: getVerticalSize(44), width: getHorizontalSize(291), svgPath: ImageConstant.imgShape), Padding(padding: getPadding(left: 20, top: 15, right: 73, bottom: 13), child: Row(children: [AppbarImage(height: getSize(11), width: getSize(11), svgPath: ImageConstant.imgSearch, margin: getMargin(bottom: 3)), AppbarSubtitle5(text: "Search House, Apartment, etc", margin: getMargin(left: 10))]))])), actions: [Container(height: getVerticalSize(73), width: getHorizontalSize(103), margin: getMargin(left: 35, right: 35, bottom: 1), child: Stack(alignment: Alignment.center, children: [AppbarImage(height: getSize(20), width: getSize(20), svgPath: ImageConstant.imgMicrophone, margin: getMargin(left: 16, top: 42, right: 67, bottom: 11)), Align(alignment: Alignment.center, child: Padding(padding: getPadding(right: 102), child: SizedBox(height: getVerticalSize(73), child: VerticalDivider(width: getHorizontalSize(1), thickness: getVerticalSize(1), color: ColorConstant.whiteA7006c, indent: getHorizontalSize(34), endIndent: getHorizontalSize(3))))), AppbarImage(height: getVerticalSize(73), width: getHorizontalSize(103), imagePath: ImageConstant.imgFilterbutton)]))]), body: SizedBox(width: size.width, child: SingleChildScrollView(padding: getPadding(top: 9), child: Padding(padding: getPadding(left: 20, right: 19), child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [Padding(padding: getPadding(left: 5, right: 5), child: ListView.separated(physics: NeverScrollableScrollPhysics(), shrinkWrap: true, separatorBuilder: (context, index) {return SizedBox(height: getVerticalSize(9));}, itemCount: 2, itemBuilder: (context, index) {return SavedItemWidget(onTapBtnTrash: () {onTapBtnTrash(context);});})), Container(margin: getMargin(top: 351), padding: getPadding(all: 16), decoration: AppDecoration.fillWhiteA700, child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [CustomImageView(imagePath: ImageConstant.imgVuesaxoutlinerotateleft, height: getSize(20), width: getSize(20), margin: getMargin(top: 14, bottom: 15)), Padding(padding: getPadding(left: 8, top: 16, bottom: 17), child: Text("Reset all", overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.txtSFProDisplayMedium16.copyWith(letterSpacing: getHorizontalSize(0.21)))), Spacer(), CustomButton(height: getVerticalSize(48), width: getHorizontalSize(156), text: "Show results", margin: getMargin(bottom: 1), shape: ButtonShape.RoundedBorder25, fontStyle: ButtonFontStyle.SFProDisplayMedium16)]))])))))); } 
onTapBtnTrash(BuildContext context) { showModalBottomSheet(context: context, builder: (_)=>SavedDeleteBottomsheet(),isScrollControlled: true); } 
 }