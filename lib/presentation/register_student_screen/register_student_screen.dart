import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
// import 'package:homecampus/widgets/app_bar/appbar_iconbutton.dart';
// import 'package:homecampus/widgets/app_bar/appbar_image.dart';
// import 'package:homecampus/widgets/app_bar/custom_app_bar.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:homecampus/core/utils/encryption_helper.dart';
// ignore_for_file: must_be_immutable

class RegisterStudentScreen extends StatefulWidget {
  @override
  _RegisterStudentScreenState createState() => _RegisterStudentScreenState();

}

class Tenant{
  String tenant_id;
  final String tenant_name;
  final String tenant_address;
  final String tenant_email;
  final String tenant_phone;
  final String tenant_matricNum;
  final String tenant_password;
  final String tenant_image;

  Tenant({
    this.tenant_id = '',
    required this.tenant_name,
    required this.tenant_address,
    required this.tenant_email,
    required this.tenant_phone,
    required this.tenant_matricNum,
    required this.tenant_password,
    required this.tenant_image,
  });

  Map<String, dynamic> toJson() => {
    'tenant_id': tenant_id,
    'tenant_name': tenant_name,
    'tenant_address': tenant_address,
    'tenant_email': tenant_email,
    'tenant_phone': tenant_phone,
    'tenant_matricNum': tenant_matricNum,
    'tenant_password': tenant_password,
    'tenant_image': tenant_image,
  };
}

class _RegisterStudentScreenState extends State<RegisterStudentScreen>{

 TextEditingController fullnameController = TextEditingController();
 TextEditingController addressController = TextEditingController();
 TextEditingController emailController = TextEditingController();
 TextEditingController phoneNumController = TextEditingController();
 TextEditingController matricNumController = TextEditingController();
 TextEditingController passwordController = TextEditingController();

 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 Future<void> createTenant(Tenant tenant) async {
   final docTenant = FirebaseFirestore.instance.collection('tenant').doc();
   tenant.tenant_id = docTenant.id; // Assign the document ID to the property_id field

   final json = tenant.toJson();
   await docTenant.set(json);
 }

 // Validation method for full name field
 String? validateName(String? value) {
   if (value == null || value.isEmpty) {
     return 'Please enter your name.';
   }
   return null;
 }

 // Validation method for email field
 String? validateEmail(String? value) {
   if (value == null || value.isEmpty) {
     return 'Please enter your email.';
   } else if (!isValidEmail(value)) {
     return 'Please enter a valid email address.';
   }
   return null;
 }

 // Function to check if the entered email is valid
  bool isValidEmail(String email) {
    // You can implement your own email validation logic here
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool passToggle = true;

@override
Widget build(
    BuildContext context) {
 return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.gray90004,
         resizeToAvoidBottomInset: false,
         body: Form(
           key: _formKey,
           child: Container(
               height: double.maxFinite,
               width: double.maxFinite,
               child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Expanded(
                     child: SingleChildScrollView(
                       child: Container(
                         height: getVerticalSize(960),
                         width: double.maxFinite,
                         child:Stack(
                           alignment: Alignment.bottomCenter,
                           children:[
                             Align(
                                 alignment: Alignment.topLeft,
                                 child: Container(
                                     height: getVerticalSize(364),
                                     width: getHorizontalSize(392),
                                     child: Stack(
                                         alignment: Alignment.topLeft,
                                         children: [CustomImageView(
                                             imagePath: ImageConstant.imgAvatar229x272,
                                             margin: getMargin(top: 15),
                                             height: getVerticalSize(229),
                                             width: getHorizontalSize(272),
                                             alignment: Alignment.topRight),
                                           CustomIconButton(
                                               height: 37,
                                               width: 37,
                                               margin: getMargin(left: 38, top: 35),
                                               alignment: Alignment.topLeft,
                                               onTap: () {onTapBtnIcback(context);},
                                               child: CustomImageView(
                                                   svgPath: ImageConstant.imgIcback)
                                           )
                                         ]
                                     )
                                 )
                             ),
                             Align(
                                 alignment: Alignment.bottomCenter,
                                 child: Container(
                                     height: double.maxFinite,
                                     width: double.maxFinite,
                                     child: Stack(
                                     alignment: Alignment.topCenter,
                                     children: [CustomImageView(
                                         imagePath: ImageConstant.imgBackground772x414,
                                         height: getVerticalSize(830),
                                         width: getHorizontalSize(414),
                                         alignment: Alignment.bottomCenter),
                                       Align(
                                           alignment: Alignment.topCenter,
                                           child: Container(
                                               height: double.maxFinite,
                                               width: double.maxFinite,
                                               margin: getMargin(top: 87, bottom: 66),
                                               child: Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     CustomImageView(
                                                       imagePath: ImageConstant.imgFrontshapes,
                                                       height: getVerticalSize(80),
                                                       width: getHorizontalSize(38),
                                                       margin: getMargin(top: 32, bottom: 69)),
                                                     Container(
                                                         height: getVerticalSize(182),
                                                         width: getHorizontalSize(361),
                                                         child: Stack(
                                                             alignment: Alignment.centerRight,
                                                             children: [CustomImageView(
                                                                 imagePath: ImageConstant.imgFrontshapes97x98,
                                                                 height: getVerticalSize(97),
                                                                 width: getHorizontalSize(98),
                                                                 alignment: Alignment.bottomRight,
                                                                 margin: getMargin(bottom: 15)),
                                                               CustomImageView(
                                                                   imagePath: ImageConstant.imgSaly16,
                                                                   height: getVerticalSize(182),
                                                                   width: getHorizontalSize(82),
                                                                   alignment: Alignment.centerRight),
                                                             ]
                                                         )
                                                     )
                                                   ]
                                               )
                                           )
                                       ),
                                     ]
                                 )
                                 )
                             ),
                             Align(
                               alignment: Alignment.center,
                               child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                    Expanded(
                                            child: Container(
                                                height: double.maxFinite,
                                                width: double.maxFinite,
                                                margin: getMargin(bottom: 30),
                                                child: Stack(
                                                    alignment: Alignment.topRight,
                                                    children: [
                                                      CustomImageView(
                                                        imagePath: ImageConstant.imgSaly16189x61,
                                                        height: getVerticalSize(189),
                                                        width: getHorizontalSize(61),
                                                        alignment: Alignment.topRight,
                                                        margin: getMargin(top: 213)),
                                                     Align(
                                                         alignment: Alignment.topRight,
                                                         child: Container(
                                                             height: getVerticalSize(229),
                                                             width: getHorizontalSize(272),
                                                             child: Stack(
                                                                 alignment: Alignment.topLeft,
                                                             )
                                                         )
                                                     ),
                                                     Expanded(
                                                       child: Align(
                                                           alignment: Alignment.bottomCenter,
                                                           child: FractionallySizedBox(
                                                             heightFactor: 0.7, // Adjust this value as needed
                                                             child: Padding(
                                                                 padding: getPadding(left: 33, right: 33),
                                                                 child: Column(
                                                                     mainAxisSize: MainAxisSize.min,
                                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                                     mainAxisAlignment: MainAxisAlignment.end,
                                                                     children: [
                                                                       Padding(
                                                                         padding: getPadding(left: 1),
                                                                         child: Text(
                                                                             "Let’s explore together!",
                                                                             overflow: TextOverflow.ellipsis,
                                                                             textAlign: TextAlign.left,
                                                                             style: AppStyle.txtPoppinsSemiBold30,
                                                                         )),
                                                                      Padding(
                                                                          padding: getPadding(top: 5),
                                                                          child: Text(
                                                                              "Create your account to explore...",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtPoppinsMedium1433)),
                                                                      Padding(
                                                                          padding: getPadding(top: 15),
                                                                          child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [Text(
                                                                                  "Name",
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  textAlign: TextAlign.left,
                                                                                  style: AppStyle.txtPoppinsMedium1433),
                                                                               ])),
                                                                                CustomTextFormField(
                                                                                    width: getHorizontalSize(348),
                                                                                    focusNode: FocusNode(),
                                                                                    autofocus: true,
                                                                                    controller: fullnameController,
                                                                                    fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                                                                                    textInputType: TextInputType.name,
                                                                                    margin: getMargin(top: 5),
                                                                                    prefix: Container(
                                                                                        margin: getMargin(left: 5, right: 5),
                                                                                        child: CustomImageView(
                                                                                            )),
                                                                                    prefixConstraints: BoxConstraints(
                                                                                        maxHeight: getVerticalSize(5)),
                                                                                    suffixConstraints: BoxConstraints(
                                                                                        maxHeight: getVerticalSize(5)),
                                                                                    validator: validateName,
                                                                                ),
                                                                      Padding(
                                                                          padding: getPadding(top: 10),
                                                                          child: Text(
                                                                              "Address",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtPoppinsMedium1433)),
                                                                       CustomTextFormField(
                                                                           width: getHorizontalSize(348),
                                                                           focusNode: FocusNode(),
                                                                           autofocus: true,
                                                                           controller: addressController,
                                                                           fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                                                                           textInputType: TextInputType.streetAddress,
                                                                           margin: getMargin(top: 5),
                                                                           prefix: Container(
                                                                               margin: getMargin(left: 5, right: 5),
                                                                               child: CustomImageView(
                                                                               )),
                                                                           prefixConstraints: BoxConstraints(
                                                                               maxHeight: getVerticalSize(5)),
                                                                           suffixConstraints: BoxConstraints(
                                                                               maxHeight: getVerticalSize(5)),
                                                                           validator: (value) {
                                                                             if (value == null || value.trim().isEmpty) {
                                                                               return 'Please enter your address.';
                                                                             }
                                                                             return null;
                                                                           },
                                                                       ),
                                                                      Padding(
                                                                          padding: getPadding(top: 10),
                                                                          child: Text(
                                                                              "Email",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtPoppinsMedium1433)),
                                                                       CustomTextFormField(
                                                                           width: getHorizontalSize(348),
                                                                           focusNode: FocusNode(),
                                                                           autofocus: true,
                                                                           controller: emailController,
                                                                           fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                                                                           textInputType: TextInputType.emailAddress,
                                                                           margin: getMargin(top: 5),
                                                                           prefix: Container(
                                                                               margin: getMargin(left: 5, right: 5),
                                                                               child: CustomImageView(
                                                                               )),
                                                                           prefixConstraints: BoxConstraints(
                                                                               maxHeight: getVerticalSize(5)),
                                                                           suffixConstraints: BoxConstraints(
                                                                               maxHeight: getVerticalSize(5)),
                                                                           validator: validateEmail,
                                                                       ),
                                                                      Padding(
                                                                          padding: getPadding(top: 10),
                                                                          child: Text(
                                                                              "Mobile No.",
                                                                              overflow: TextOverflow.ellipsis,
                                                                              textAlign: TextAlign.left,
                                                                              style: AppStyle.txtPoppinsMedium1433)),
                                                                       CustomTextFormField(
                                                                           width: getHorizontalSize(348),
                                                                           focusNode: FocusNode(),
                                                                           autofocus: true,
                                                                           controller: phoneNumController,
                                                                           fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                                                                           textInputType: TextInputType.phone,
                                                                           margin: getMargin(top: 5),
                                                                           prefix: Container(
                                                                               margin: getMargin(left: 5, right: 5),
                                                                               child: CustomImageView(
                                                                               )),
                                                                           prefixConstraints: BoxConstraints(
                                                                               maxHeight: getVerticalSize(5)),
                                                                           suffixConstraints: BoxConstraints(
                                                                               maxHeight: getVerticalSize(5)),
                                                                           validator: (value) {
                                                                             if (value == null || value.trim().isEmpty) {
                                                                               return 'Please enter your mobile number.';
                                                                             }
                                                                             return null;
                                                                           },
                                                                       ),
                                                                      Padding(
                                                                          padding: getPadding(top: 10),
                                                                          child: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [Padding(
                                                                                  padding: getPadding(bottom: 0),
                                                                                  child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [Padding(
                                                                                          padding: getPadding(left: 0),
                                                                                          child: Text(
                                                                                              "Matric Number",
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                              textAlign: TextAlign.left,
                                                                                              style: AppStyle.txtPoppinsMedium1433)),
                                                                                       CustomTextFormField(
                                                                                           width: getHorizontalSize(150),
                                                                                           focusNode: FocusNode(),
                                                                                           autofocus: true,
                                                                                           controller: matricNumController,
                                                                                           fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                                                                                           textInputType: TextInputType.number,
                                                                                           margin: getMargin(top: 5),
                                                                                           prefix: Container(
                                                                                               margin: getMargin(left: 10, top: 0, right: 10, bottom: 5),
                                                                                               child: Icon(
                                                                                                 Icons.person_outline,
                                                                                                 color: Colors.grey,
                                                                                                 size: 20,
                                                                                               ),
                                                                                           ),
                                                                                           prefixConstraints: BoxConstraints(
                                                                                               maxHeight: getVerticalSize(29)),
                                                                                           suffixConstraints: BoxConstraints(
                                                                                               maxHeight: getVerticalSize(29)),
                                                                                           validator: (value) {
                                                                                             if (value == null || value.trim().isEmpty) {
                                                                                               return '';
                                                                                             }
                                                                                             return null;
                                                                                           },
                                                                                       )
                                                                                      ]
                                                                                  )
                                                                              ),
                                                                               Column(
                                                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                                                   mainAxisAlignment: MainAxisAlignment.start,
                                                                                   children: [Text(
                                                                                       "Password",
                                                                                       overflow: TextOverflow.ellipsis,
                                                                                       textAlign: TextAlign.left,
                                                                                       style: AppStyle.txtPoppinsMedium1433),
                                                                                     CustomTextFormField(
                                                                                         width: getHorizontalSize(180),
                                                                                         focusNode: FocusNode(),
                                                                                         autofocus: true,
                                                                                         controller: passwordController,
                                                                                         fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                                                                                         textInputType: TextInputType.visiblePassword,
                                                                                         isObscureText: passToggle,
                                                                                         validator: (value) {
                                                                                           if (value == null || value.isEmpty) {
                                                                                             return '';
                                                                                           }
                                                                                           return null;
                                                                                         },
                                                                                         margin: getMargin(top: 5),
                                                                                         prefix: Container(
                                                                                             margin: getMargin(left: 10, top: 0, right: 10, bottom: 5),
                                                                                             child: Icon(
                                                                                               Icons.key_outlined,
                                                                                               color: Colors.grey,
                                                                                               size: 20,
                                                                                             ),
                                                                                         ),
                                                                                         prefixConstraints: BoxConstraints(
                                                                                             maxHeight: getVerticalSize(29)),
                                                                                         suffixConstraints: BoxConstraints(
                                                                                             maxHeight: getVerticalSize(29)),
                                                                                         suffix: Container(
                                                                                           margin: getMargin(left: 30, top: 5, right: 16, bottom: 14),
                                                                                           child: InkWell(
                                                                                             onTap: () {
                                                                                               setState(() {
                                                                                                 passToggle = !passToggle;
                                                                                               });
                                                                                             },
                                                                                             child: Icon(
                                                                                               passToggle ? Icons.visibility_off : Icons.visibility,
                                                                                               color: Colors.grey,
                                                                                               size: 15,
                                                                                             ),
                                                                                           ),
                                                                                         ),
                                                                                     ),
                                                                                  ]
                                                                               )
                                                                              ]
                                                                          )
                                                                      ),
                                                                      CustomButton(
                                                                          text: "Create Account",
                                                                          margin: getMargin(top: 25),
                                                                          variant: ButtonVariant.GradientIndigoA100IndigoA100_1,
                                                                          shape: ButtonShape.RoundedBorder15,
                                                                          padding: ButtonPadding.PaddingAll12,
                                                                          fontStyle: ButtonFontStyle.PoppinsMedium1792,
                                                                          onTap: () {
                                                                            // Validate the form
                                                                            if (_formKey
                                                                                .currentState
                                                                                ?.validate() ==
                                                                                true) {
                                                                              // Proceed with account crea
                                                                              final tenant = Tenant(
                                                                                tenant_name: fullnameController
                                                                                    .text,
                                                                                tenant_address: addressController
                                                                                    .text,
                                                                                tenant_email: emailController
                                                                                    .text,
                                                                                tenant_phone: phoneNumController
                                                                                    .text,
                                                                                tenant_matricNum: matricNumController
                                                                                    .text,
                                                                                tenant_password: passwordController
                                                                                    .text,
                                                                                tenant_image: "",
                                                                              );

                                                                              onTapCreateaccount(
                                                                                  context);

                                                                              createTenant(
                                                                                  tenant);
                                                                            }
                                                                          }
                                                                          ),
                                                                      Align(
                                                                          alignment: Alignment.center,
                                                                          child: GestureDetector(
                                                                              onTap: () {onTapTxtAlreadyhavean(context);},
                                                                              child: Container(
                                                                                  //height: double.maxFinite,
                                                                                  width: getHorizontalSize(186),
                                                                                  margin: getMargin(top: 20, bottom: 0),
                                                                                  child: RichText(
                                                                                      text: TextSpan(
                                                                                          children: [TextSpan(
                                                                                              text: "Already have an account? \n",
                                                                                              style: TextStyle(
                                                                                                  color: ColorConstant.whiteA700,
                                                                                                  fontSize: getFontSize(14),
                                                                                                  fontFamily: 'Poppins',
                                                                                                  fontWeight: FontWeight.w400)),
                                                                                           TextSpan(
                                                                                               text: "Login",
                                                                                               style: TextStyle(
                                                                                                   color: ColorConstant.indigoA100,
                                                                                                   fontSize: getFontSize(14),
                                                                                                   fontFamily: 'Poppins',
                                                                                                   fontWeight: FontWeight.w700))]),
                                                                                      textAlign: TextAlign.center)
                                                                              )
                                                                          )
                                                                      )
                                                                     ]
                                                                 )
                                                             ),
                                                           )
                                                       ),
                                                     )
                                                    ]
                                                )
                                            )
                                    )
                                   ]
                               )
                           ),
                         ]
                         ),
                       ),
                     ),
                   ),
                   ]
               ),
           ),
         ),
     )
 );
}
 onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginStudentScreen); }
onTapCreateaccount(BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginStudentScreen); }
onTapTxtAlreadyhavean(BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginStudentScreen); } 
 }
