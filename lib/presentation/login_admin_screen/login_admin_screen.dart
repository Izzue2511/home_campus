import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/presentation/home_admin_screen/home_admin_screen.dart';
// import 'package:homecampus/presentation/home_house_owner_screen/home_house_owner_screen.dart';
// import 'package:homecampus/presentation/register_house_owner_screen/register_house_owner_screen.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
// ignore_for_file: must_be_immutable

class LoginAdminScreen extends StatefulWidget {
  const LoginAdminScreen({Key? key}) : super(key: key);

  @override
  State<LoginAdminScreen> createState() => _LoginAdminScreenState();
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

  static Admin fromJson(Map<String, dynamic> json) => Admin(
    admin_id: json['admin_id'],
    admin_name: json['admin_name'],
    admin_username: json['admin_username'],
    admin_email: json['admin_email'],
    admin_password: json['admin_password'],
  );
}

class _LoginAdminScreenState extends State<LoginAdminScreen> {

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final FirebaseAuth auth = FirebaseAuth.instance;
//final user = FirebaseAuth.instance.currentUser!;
User? currentUser;

@override
void initState() {
  super.initState();
  inputData();
}

void inputData() async {
  currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    final uid = currentUser!.uid;
    // Here you have the current user ID (uid), and you can use it as needed.
    // For example, you can pass it to the `getUserByEmail` function.

    // Update the Current UserID to the Firebase Auth user's UID on app startup
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.setCurrentUserIdByAdminId(uid);

    setState(() {
      // Call setState to trigger a rebuild if needed.
    });
  } else {
    // Handle the case where the user is null, such as showing an error message or redirecting to the login screen.
  }
}

// Function to check if the user is authenticated
  bool isUserAuthenticated() {
    return auth.currentUser != null;
  }

  void onTapLogin(BuildContext context) async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    try {
      Admin? admin = await getUserByUsername(username);

      if (admin != null && admin.admin_password == passwordController.text) {
        // Update the Current UserID to the admin_id
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setCurrentUserId(admin.admin_id);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeAdminScreen(),
          ),
        );
      } else {
        // Password doesn't match or user not found
        Fluttertoast.showToast(
          msg: "Invalid Username or Password",
        );
        usernameController.text = "";
        passwordController.text = "";
      }
    } catch (e) {
      // Handle any errors that may occur during the login process
      Fluttertoast.showToast(
        msg: "An error occurred. Please try again.",
      );
    }
  }

  Future<Admin?> getUserByUsername(String username) async {
    print("Fetching user with username: $username");
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('admin')
          .where('admin_username', isEqualTo: username)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        print("User found with username: $username");
        return Admin.fromJson(snapshot.docs.first.data());
      }
    } catch (e) {
      print("Error fetching user: $e");
    }

    print("User not found with username: $username");
    return null;
  }

@override
Widget build(
    BuildContext context) {
 // final String admin_id = auth.currentUser!.uid;
/*
  if (!isUserAuthenticated()) {
    // If user is not authenticated, show a loading screen or redirect to login
    // Example of redirection:
    // Navigator.pushNamed(context, AppRoutes.loginScreen);
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }*/
 return SafeArea(
     child: Scaffold(
     backgroundColor: ColorConstant.gray90005,
     resizeToAvoidBottomInset: false,
     body: Form(
         key: _formKey,
         child: Container(
             width: double.maxFinite,
             padding: getPadding(left: 38, right: 38),
             child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [Align(
                     alignment: Alignment.centerLeft,
                     child: Padding(
                         padding: getPadding(right: 57),
                         child: Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [CustomIconButton(
                                 height: 37,
                                 width: 37,
                                 margin: getMargin(top: 35, bottom: 137),
                                 onTap: () {onTapBtnIcback(context);},
                                 child: CustomImageView(
                                     svgPath: ImageConstant.imgIcback)),
                              Container(height: getVerticalSize(210),
                                  width: getHorizontalSize(223),
                                  margin: getMargin(left: 20),
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                              margin: getMargin(bottom: 15),
                                              decoration: AppDecoration.txtOutlineBlack9003f2,

                                          )
                                      ),
                                       CustomImageView(
                                           imagePath: ImageConstant.imgGroup1000003418,
                                           height: getVerticalSize(210),
                                           width: getHorizontalSize(223),
                                           alignment: Alignment.center)
                                      ]
                                  )
                              )
                             ]
                         )
                     )
                 ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 25, top: 80),
                          child: Text(
                              "Username",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLatoSemiBold1292))),
                  CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: usernameController,
                      margin: getMargin(left: 10, top: 5, right: 10),
                      variant: TextFormFieldVariant.OutlineBlack90035,
                      shape: TextFormFieldShape.RoundedBorder23,
                      padding: TextFormFieldPadding.PaddingT14_1,
                      fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.text,
                      suffix: Container(margin: getMargin(left: 0, top: 0, right: 0, bottom: 0),
                          child: IconButton(
                            icon: Icon(
                              Icons.person_outline,
                              color: Colors.deepPurpleAccent.withOpacity(0.7),
                              size: 30, // Adjust the size according to your preference
                            ),
                            onPressed: () {
                              // Add your phone button logic here
                            },
                          ),
                      ),
                      suffixConstraints: BoxConstraints(
                          maxHeight: getVerticalSize(47))),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: getPadding(left: 25, top: 10),
                          child: Text(
                              "Password",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLatoSemiBold1292))),
                  CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: passwordController,
                      margin: getMargin(left: 10, top: 5, right: 10),
                      variant: TextFormFieldVariant.OutlineBlack9004c,
                      shape: TextFormFieldShape.RoundedBorder23,
                      padding: TextFormFieldPadding.PaddingT14_1,
                      fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      suffix: Container(margin: getMargin(left: 30, top: 11, right: 13, bottom: 12),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgLockIndigoA100)),
                      suffixConstraints: BoxConstraints(maxHeight: getVerticalSize(47)),
                      isObscureText: true),
                  Container(
                      height: getVerticalSize(46),
                      width: getHorizontalSize(312),
                      margin: getMargin(top: 38),
                      child: Stack(
                          alignment: Alignment.center,
                          children: [Align(
                              alignment: Alignment.center,
                                  child: Container(height: getVerticalSize(46),
                                      width: getHorizontalSize(312),
                                      decoration: BoxDecoration(
                                          color: ColorConstant.indigoA100,
                                          borderRadius: BorderRadius.circular(getHorizontalSize(8))))),
                           CustomButton(
                               height: getVerticalSize(46), width: getHorizontalSize(312),
                               text: "Login",
                               fontStyle: ButtonFontStyle.LatoBold1576,
                               alignment: Alignment.center,
                               onTap: (){
                                    onTapLogin(context);
                             },
                           )
                          ]
                      )
                  ),
                  GestureDetector(
                      onTap: () {onTapTxtDonthaveanaccount(context);},
                      child: Container(width: getHorizontalSize(167),
                          margin: getMargin(top: 32, bottom: 5),
                          child: RichText(
                              text: TextSpan(
                                  children: [TextSpan(
                                      text: "Don’t have an account?",
                                      style: TextStyle(
                                          color: ColorConstant.gray400,
                                          fontSize: getFontSize(14),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400)),
                                   TextSpan(
                                       text: "",
                                       style: TextStyle(
                                           color: ColorConstant.blue400,
                                           fontSize: getFontSize(14),
                                           fontFamily: 'Poppins',
                                           fontWeight: FontWeight.w400)),
                                   TextSpan(
                                       text: "Create Account",
                                       style: TextStyle(
                                           color: ColorConstant.indigoA100,
                                           fontSize: getFontSize(14),
                                           fontFamily: 'Poppins',
                                           fontWeight: FontWeight.w700))]),
                              textAlign: TextAlign.center)))
                 ]
             )
         )
     )
     )
 );
  }
onTapBtnIcback(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.welcomeUserScreen); }
onTapTxtForgetpassword(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen); }
onTapTxtDonthaveanaccount(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.registerAdminScreen); }
 }
