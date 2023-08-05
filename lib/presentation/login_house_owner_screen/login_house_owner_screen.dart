import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/presentation/home_house_owner_screen/home_house_owner_screen.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart'; // Import the UserProvider class from the newly created file
import 'package:homecampus/presentation/home_house_owner_screen/home_house_owner_screen.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';
// ignore_for_file: must_be_immutable

class LoginHouseOwnerScreen extends StatefulWidget {
  const LoginHouseOwnerScreen({Key? key}) : super(key: key);

  @override
  State<LoginHouseOwnerScreen> createState() => _LoginHouseOwnerScreenState();
}

class House_Owner{
  String owner_id;
  final String owner_name;
  final String owner_address;
  final String owner_email;
  final String owner_phone;
  String owner_password;
  final String owner_image;
  final String owner_accountBank;
  final String owner_accountNo;
  final String owner_accountHolder;

  House_Owner({
    this.owner_id = '',
    required this.owner_name,
    required this.owner_address,
    required this.owner_email,
    required this.owner_phone,
    required this.owner_password,
    required this.owner_image,
    required this.owner_accountBank,
    required this.owner_accountNo,
    required this.owner_accountHolder,
  });

  Map<String, dynamic> toJson() => {
    'owner_id': owner_id,
    'owner_name': owner_name,
    'owner_address': owner_address,
    'owner_email': owner_email,
    'owner_phone': owner_phone,
    'owner_password': owner_password,
    'owner_image': owner_image,
    'owner_accountBank': owner_accountBank,
    'owner_accountNo': owner_accountNo,
    'owner_accountHolder': owner_accountHolder,
  };

  static House_Owner fromJson(Map<String, dynamic> json) => House_Owner(
    owner_id: json['owner_id'],
    owner_name: json['owner_name'],
    owner_address: json['owner_address'],
    owner_email: json['owner_email'],
    owner_phone: json['owner_phone'],
    owner_password: json['owner_password'],
    owner_image: json['owner_image'],
    owner_accountBank: json['owner_accountBank'],
    owner_accountNo: json['owner_accountNo'],
    owner_accountHolder: json['owner_accountHolder'],
  );
}

class _LoginHouseOwnerScreenState extends State<LoginHouseOwnerScreen> {

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

final FirebaseAuth auth = FirebaseAuth.instance;
//final user = FirebaseAuth.instance.currentUser!;
User? currentUser;

  final body = {
    'To': '+0183964057', // Replace with the valid E.164 formatted phone number
    'Channel': 'sms',
  };

// Function to generate a random OTP (Simulated OTP generation)
  String generateOTP() {
    // Generate a random 6-digit OTP
    return (100000 + Random().nextInt(900000)).toString();
  }

  /// Function to send OTP via Twilio SMS
  void sendOTP(String phoneNumber, String otp) async {
    final accountSid = 'ACd3fa59e3bf4f697642c450bde7575afe';
    final authToken = '3ce24465fe3f2edfe8ce808b6603f6c4';
    final serviceId = 'VA2ad05453363988edf273b7ace6d5b5da';

    final url = Uri.parse('https://verify.twilio.com/v2/Services/$serviceId/Verifications');
    final headers = {
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final body = {
      'To': phoneNumber,
      'Channel': 'sms',
    };

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 201) {
      print('OTP sent successfully!');
    } else {
      print('Failed to send OTP. Status code: ${response.statusCode}');
    }
  }

  void verifyOTP(String phoneNumber, String otp) async {
    final accountSid = 'ACd3fa59e3bf4f697642c450bde7575afe';
    final authToken = '3ce24465fe3f2edfe8ce808b6603f6c4';
    final serviceId = 'VA2ad05453363988edf273b7ace6d5b5da';

    final url = Uri.parse('https://verify.twilio.com/v2/Services/$serviceId/VerificationCheck');
    final headers = {
      'Authorization': 'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final body = {
      'To': phoneNumber,
      'Code': otp,
    };

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('OTP verified successfully!');
      // You can proceed with user authentication or any other action here.
    } else {
      print('Failed to verify OTP. Status code: ${response.statusCode}');
    }
  }

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
    userProvider.setCurrentUserIdByOwnerId(uid);

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
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      House_Owner? owner = await getUserByEmail(email);

      if (owner != null) {
        // Decrypt the stored password for comparison
        final decryptedPassword = _decryptPassword(owner.owner_password);

        if (decryptedPassword == password) {
          // Password matches, proceed with login

          // Generate and send OTP to the user's registered mobile number
          String phoneNumber = owner.owner_phone;
          String otp = generateOTP(); // Assuming you have the generateOTP() function implemented.

          sendOTP(phoneNumber, otp);

          // Store the generated OTP and user data in variables for later verification
          String storedOTP = otp;
          House_Owner storedOwner = owner;

          // Show a dialog to enter the OTP
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Enter OTP"),
                content: TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // Implement the logic to verify the entered OTP
                    if (value == storedOTP) {
                      // OTP is correct, proceed with login
                      final userProvider = Provider.of<UserProvider>(
                          context, listen: false);
                      userProvider.setCurrentUserId(storedOwner.owner_id);
                      Navigator.pushNamed(
                          context, AppRoutes.homeHouseOwnerScreen);
                    } else {
                      // Incorrect OTP, show an error message
                      Fluttertoast.showToast(
                        msg: "Invalid OTP. Please try again.",
                      );
                    }
                  },
                ),
              );
            },
          );
        } else {
          // Password doesn't match
          Fluttertoast.showToast(
            msg: "Invalid Email or Password",
          );
          passwordController.text = "";
        }
      }else {
        // User not found
        Fluttertoast.showToast(
          msg: "Invalid Email or Password",
        );
        emailController.text = "";
        passwordController.text = "";
      }
    } catch (e) {
      // Handle any errors that may occur during the login process
      Fluttertoast.showToast(
        msg: "An error occurred. Please try again.",
      );
    }
  }

  String _decryptPassword(String encryptedPassword) {
    final key = encrypt.Key.fromLength(32); // AES-256 requires a 32-byte key
    final iv = encrypt.IV.fromLength(16); // AES uses a 16-byte IV

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedPassword), iv: iv);

    return decrypted;
  }

  Future<House_Owner?> getUserByEmail(String email) async {
    print("Fetching user with email: $email");
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('house_owner')
          .where('owner_email', isEqualTo: email)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        print("User found with email: $email");
        return House_Owner.fromJson(snapshot.docs.first.data());
      }
    } catch (e) {
      print("Error fetching user: $e");
    }

    print("User not found with email: $email");
    return null;
  }

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
                              "Email",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: AppStyle.txtLatoSemiBold1292))),
                  CustomTextFormField(
                      focusNode: FocusNode(),
                      autofocus: true,
                      controller: emailController,
                      margin: getMargin(left: 10, top: 5, right: 10),
                      variant: TextFormFieldVariant.OutlineBlack90035,
                      shape: TextFormFieldShape.RoundedBorder23,
                      padding: TextFormFieldPadding.PaddingT14_1,
                      fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                      suffix: Container(margin: getMargin(left: 30, top: 13, right: 12, bottom: 10),
                          child: CustomImageView(
                              svgPath: ImageConstant.imgMail)),
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
                              svgPath: ImageConstant.imgLockIndigoA100)
                      ),
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
                           )])),
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
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.registerHouseOwnerScreen); }
 }
