import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore_for_file: must_be_immutable

class RegisterAdminScreen extends StatefulWidget {
  @override
  _RegisterAdminScreenState createState() => _RegisterAdminScreenState();

}

class Admin{
  String admin_id;
  final String admin_username;
  final String admin_name;
  final String admin_email;
  final String admin_password;

  Admin({
    this.admin_id = '',
    required this.admin_name,
    required this.admin_username,
    required this.admin_email,
    required this.admin_password,
  });

  Map<String, dynamic> toJson() => {
    'admin_id': admin_id,
    'admin_name': admin_name,
    'admin_username': admin_username,
    'admin_email': admin_email,
    'admin_password': admin_password,
  };
}

class _RegisterAdminScreenState extends State<RegisterAdminScreen>{

TextEditingController fullnameController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Future<void> createAdmin(Admin admin) async {
  final docAdmin = FirebaseFirestore.instance.collection('admin').doc();
  admin.admin_id = docAdmin.id; // Assign the document ID to the property_id field

  final json = admin.toJson();
  await docAdmin.set(json);
}

// Validation logic for each text form field
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name.';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email.';
    } else if (!isValidEmail(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
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
         backgroundColor: ColorConstant.gray90005,
         resizeToAvoidBottomInset: false,
         body: Form(
             key: _formKey,
             child: Container(
                 width: double.maxFinite,
                 padding: getPadding(left: 38, top: 35, right: 38, bottom: 35),
                 child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [CustomIconButton(
                         height: 37,
                         width: 37,
                         alignment: Alignment.centerLeft,
                         onTap: () {onTapBtnIcback(context);},
                         child: CustomImageView(
                             svgPath: ImageConstant.imgIcback)),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 32, top: 30),
                              child: Text(
                                  "Create Account",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsBold22))),
                      Align(
                          child: Padding(
                              padding: getPadding(top: 12, bottom: 12, right: 62),
                              child: Text(
                                  "Hi, kindly fill in the form to proceed...",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtPoppinsRegular12WhiteA700))),
                       CustomTextFormField(
                           focusNode: FocusNode(),
                           autofocus: true,
                           controller: fullnameController,
                           hintText: "Name",
                           margin: getMargin(left: 32, top: 23, right: 33),
                           variant: TextFormFieldVariant.UnderLine_1,
                           fontStyle: TextFormFieldFontStyle.PoppinsRegular12,
                           textInputType: TextInputType.name,
                           validator: validateName,
                       ),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: emailController,
                          hintText: "Email",
                          margin: getMargin(left: 32, top: 23, right: 33),
                          variant: TextFormFieldVariant.UnderLine_1,
                          fontStyle: TextFormFieldFontStyle.PoppinsRegular12,
                          textInputType: TextInputType.emailAddress,
                          validator: validateEmail,
                      ),
                       CustomTextFormField(
                           focusNode: FocusNode(),
                           autofocus: true,
                           controller: usernameController,
                           hintText: "Username",
                           margin: getMargin(left: 32, top: 23, right: 33),
                           variant: TextFormFieldVariant.UnderLine_1,
                           fontStyle: TextFormFieldFontStyle.PoppinsRegular12,
                           textInputType: TextInputType.name,
                           validator: validateUsername,
                       ),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: passwordController,
                          hintText: "Password",
                          margin: getMargin(left: 32, top: 23, right: 33),
                          variant: TextFormFieldVariant.UnderLine,
                          fontStyle: TextFormFieldFontStyle.PoppinsRegular12,
                          textInputType: TextInputType.visiblePassword,
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
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                          ),
                          suffixConstraints: BoxConstraints(
                              maxHeight: getVerticalSize(27)),
                          isObscureText: passToggle,
                          validator: validatePassword,
                      ),
                      CustomButton(
                          text: "Create Account",
                          margin: getMargin(left: 32, top: 43, right: 33),
                          variant: ButtonVariant.GradientIndigoA100IndigoA100_1,
                          shape: ButtonShape.RoundedBorder15,
                          padding: ButtonPadding.PaddingAll12,
                          fontStyle: ButtonFontStyle.PoppinsMedium1792,
                          onTap: () {
                            // Trigger form validation
                            if (_formKey.currentState!.validate()) {
                              // Form is valid, proceed with account creation
                              final admin = Admin(
                                admin_name: fullnameController.text,
                                admin_username: usernameController.text,
                                admin_email: emailController.text,
                                admin_password: passwordController.text,
                              );

                              onTapCreateaccount(context);

                              createAdmin(admin);
                            }
                          }
                          ),
                      Container(
                          height: getVerticalSize(43),
                          width: getHorizontalSize(157),
                          margin: getMargin(top: 29, bottom: 5),
                          child: Stack(alignment: Alignment.topCenter,
                              children: [Align(alignment: Alignment.bottomCenter,
                                  child: GestureDetector(
                                      onTap: () {
                                        onTapTxtLogin(context);
                                    },
                                      child: Container(width: getHorizontalSize(41),
                                          child: Text(
                                              "Login", maxLines: null,
                                              textAlign: TextAlign.center,
                                              style: AppStyle.txtPoppinsBold14IndigoA100)))),
                               CustomImageView(
                                   svgPath: ImageConstant.imgVector,
                                   height: getVerticalSize(13),
                                   width: getHorizontalSize(157),
                                   alignment: Alignment.topCenter)
                              ]
                          )
                      )
                     ]
                 )
             )
         )
     )
 );
}
onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginAdminScreen); }
onTapCreateaccount(BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginAdminScreen); }
onTapTxtLogin(BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginAdminScreen); }
 }
