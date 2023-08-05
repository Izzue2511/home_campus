import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart'; // Import the UserProvider class from the newly created file
import 'package:homecampus/presentation/home_student_screen/home_student_screen.dart';

class LoginStudentScreen extends StatefulWidget {
  const LoginStudentScreen({Key? key}) : super(key: key);

  @override
  State<LoginStudentScreen> createState() => _LoginStudentScreenState();
}

class Tenant{
  String tenant_id;
  final String tenant_name;
  final String tenant_address;
  final String tenant_email;
  final String tenant_phone;
  final String tenant_matricNum;
  final String tenant_password;

  Tenant({
    this.tenant_id = '',
    required this.tenant_name,
    required this.tenant_address,
    required this.tenant_email,
    required this.tenant_phone,
    required this.tenant_matricNum,
    required this.tenant_password,
  });

  Map<String, dynamic> toJson() => {
    'tenant_id': tenant_id,
    'tenant_name': tenant_name,
    'tenant_address': tenant_address,
    'tenant_email': tenant_email,
    'tenant_phone': tenant_phone,
    'tenant_matricNum': tenant_matricNum,
    'tenant_password': tenant_password,
  };

  static Tenant fromJson(Map<String, dynamic> json) => Tenant(
    tenant_id: json['tenant_id'],
    tenant_name: json['tenant_name'],
    tenant_address: json['tenant_address'],
    tenant_email: json['tenant_email'],
    tenant_phone: json['tenant_phone'],
    tenant_matricNum: json['tenant_matricNum'],
    tenant_password: json['tenant_password'],
  );
}

class _LoginStudentScreenState extends State<LoginStudentScreen> {

TextEditingController matricnumberController = TextEditingController();
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
    // For example, you can pass it to the `getUserByMatricNumber` function.

    // Update the Current UserID to the Firebase Auth user's UID on app startup
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.setCurrentUserIdByTenantId(uid);

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

  bool passToggle = true;


  void onTapLogin(BuildContext context) async {
    String matricNumber = matricnumberController.text.trim();
    String password = passwordController.text.trim();

    try {
      Tenant? tenant = await getUserByMatricNumber(matricNumber);

      if (tenant != null && tenant.tenant_password == passwordController.text) {
        // Update the Current UserID to the tenant_id
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setCurrentUserId(tenant.tenant_id);

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeStudentScreen(),
          ),
        );
      } else {
        // Password doesn't match or user not found
        Fluttertoast.showToast(
          msg: "Invalid Matric Number or Password",
        );
        matricnumberController.text = "";
        passwordController.text = "";
      }
    } catch (e) {
      // Handle any errors that may occur during the login process
      Fluttertoast.showToast(
        msg: "An error occurred. Please try again.",
      );
    }
  }


Future<Tenant?> getUserByMatricNumber(String matricNumber) async {
  print("Fetching user with matric number: $matricNumber");
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('tenant')
        .where('tenant_matricNum', isEqualTo: matricNumber)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      print("User found with matric number: $matricNumber");
      return Tenant.fromJson(snapshot.docs.first.data());
    }
  } catch (e) {
    print("Error fetching user: $e");
  }

  print("User not found with matric number: $matricNumber");
  return null;
}


  // Replace the existing onTapLogin function definition with this:
  @override
Widget build(
    BuildContext context) {

    //final String tenant_id = auth.currentUser!.uid;
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
         backgroundColor: ColorConstant.gray90004,
         resizeToAvoidBottomInset: false,
         body: Form(
             key: _formKey,
             child: Container(
                 width: double.maxFinite,
                 child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [Expanded(
                         child: SingleChildScrollView(
                             child: Container(
                                 height: getVerticalSize(832),
                                 width: double.maxFinite,
                                 child: Stack(
                                     alignment: Alignment.bottomCenter,
                                     children: [
                                       Align(
                                         alignment: Alignment.topLeft,
                                         child: Container(
                                             height: getVerticalSize(364),
                                             width: getHorizontalSize(392),
                                             child: Stack(
                                                 alignment: Alignment.topLeft,
                                                 children: [CustomImageView(
                                                     imagePath: ImageConstant.imgIllustration,
                                                     height: getVerticalSize(364),
                                                     width: getHorizontalSize(388),
                                                     alignment: Alignment.center),
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
                                              height: getVerticalSize(705),
                                              width: double.maxFinite, child: Stack(
                                              alignment: Alignment.topCenter,
                                              children: [CustomImageView(
                                                  imagePath: ImageConstant.imgBackground,
                                                  height: getVerticalSize(705),
                                                  width: getHorizontalSize(414),
                                                  onTap: () {},
                                                  alignment: Alignment.topCenter),
                                               Align(
                                                   alignment: Alignment.topCenter,
                                                   child: Container(
                                                       width: double.maxFinite,
                                                       margin: getMargin(top: 87, bottom: 66),
                                                       child: Row(
                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           children: [CustomImageView(
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
                                                                     Align(
                                                                         alignment: Alignment.topLeft,
                                                                         child: Padding(
                                                                             padding: getPadding(top: 72),
                                                                             child: Text(
                                                                                 "Welcome Back!",
                                                                                 overflow: TextOverflow.ellipsis,
                                                                                 textAlign: TextAlign.left,
                                                                                 style: AppStyle.txtPoppinsBold22))),
                                                                     Align(
                                                                         alignment: Alignment.bottomLeft,
                                                                         child: Padding(
                                                                             padding: getPadding(bottom: 52),
                                                                             child: Text(
                                                                                 "Hi, kindly login to continue...",
                                                                                 overflow: TextOverflow.ellipsis,
                                                                                 textAlign: TextAlign.left,
                                                                                 style: AppStyle.txtPoppinsRegular12WhiteA700)
                                                                         )
                                                                     )
                                                                    ]
                                                                )
                                                            )
                                                           ]
                                                       )
                                                   )
                                               ),
                                               CustomImageView(
                                                   imagePath: ImageConstant.imgRedopenedbook,
                                                   height: getVerticalSize(145),
                                                   width: getHorizontalSize(158),
                                                   radius: BorderRadius.circular(
                                                       getHorizontalSize(79)),
                                                   alignment: Alignment.bottomRight,

                                               ),
                                               Align(
                                                   alignment: Alignment.topCenter,
                                                   child: Padding(
                                                       padding: getPadding(left: 50, top: 283, right: 50),
                                                       child: Column(
                                                           mainAxisSize: MainAxisSize.min,
                                                           crossAxisAlignment: CrossAxisAlignment.start,
                                                           mainAxisAlignment: MainAxisAlignment.start,
                                                           children: [Container(
                                                                 height: getVerticalSize(55),
                                                                 width: getHorizontalSize(314),
                                                                 child: Stack(
                                                                     alignment: Alignment.centerLeft,
                                                                     children: [CustomImageView(
                                                                         imagePath: ImageConstant.imgCard,
                                                                         height: getVerticalSize(55),
                                                                         width: getHorizontalSize(314),
                                                                         alignment: Alignment.center),
                                                                       CustomTextFormField(
                                                                         focusNode: FocusNode(),
                                                                         autofocus: true,
                                                                         width: getHorizontalSize(314),
                                                                         controller: matricnumberController,
                                                                         margin: getMargin(left:30, top: 4, right: 10),
                                                                         variant: TextFormFieldVariant.None,
                                                                         padding: TextFormFieldPadding.PaddingT14_1,
                                                                         fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                                                                         textInputAction: TextInputAction.done,
                                                                         textInputType: TextInputType.number,
                                                                       ),
                                                                       Align(
                                                                           alignment: Alignment.centerLeft,
                                                                           child: Padding(
                                                                               padding: getPadding(left: 17, top: 18, right: 29, bottom: 19),
                                                                               child: Row(
                                                                                   children: [CustomImageView(
                                                                                       svgPath: ImageConstant.imgUserGray50002,
                                                                                       height: getSize(17), width: getSize(17)
                                                                                   ),
                                                                                     Spacer(),
                                                                                     CustomImageView(
                                                                                         height: getVerticalSize(13),
                                                                                         width: getHorizontalSize(16),
                                                                                         margin: getMargin(top: 2, bottom: 1)
                                                                                     )
                                                                                   ]
                                                                               )
                                                                           )
                                                                       )
                                                                     ]
                                                                 )
                                                             ),
                                                            Padding(
                                                                padding: getPadding(left: 4, top: 11),
                                                                child: Text(
                                                                    "Password",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtPoppinsMedium1433)),
                                                             Container(
                                                               height: getVerticalSize(55),
                                                               width: getHorizontalSize(314),
                                                               margin: getMargin(top: 10),
                                                               child: Stack(
                                                                 alignment: Alignment.centerLeft,
                                                                 children: [
                                                                   CustomImageView(
                                                                     imagePath: ImageConstant.imgCard,
                                                                     height: getVerticalSize(55),
                                                                     width: getHorizontalSize(314),
                                                                     alignment: Alignment.center,
                                                                   ),
                                                                   CustomTextFormField(
                                                                     focusNode: FocusNode(),
                                                                     autofocus: true,
                                                                     width: getHorizontalSize(314),
                                                                     controller: passwordController,
                                                                     margin: getMargin(left: 30, top: 4, right: 10),
                                                                     variant: TextFormFieldVariant.None,
                                                                     padding: TextFormFieldPadding.PaddingT14_1,
                                                                     fontStyle: TextFormFieldFontStyle.PoppinsMedium1433,
                                                                     textInputAction: TextInputAction.done,
                                                                     textInputType: TextInputType.visiblePassword,
                                                                     isObscureText: passToggle,
                                                                     //obscureText: true, // Added property to hide the password value
                                                                   ),
                                                                   Align(
                                                                     alignment: Alignment.centerLeft,
                                                                     child: Padding(
                                                                       padding: getPadding(left: 17, top: 18, right: 29, bottom: 19),
                                                                       child: Row(
                                                                         children: [
                                                                           CustomImageView(
                                                                             svgPath: ImageConstant.imgShareGray50002,
                                                                             height: getSize(17),
                                                                             width: getSize(17),
                                                                           ),
                                                                           Spacer(),
                                                                           InkWell(
                                                                             onTap: () {
                                                                               setState(() {
                                                                                 passToggle = !passToggle;
                                                                               });
                                                                             },
                                                                             child: Icon(
                                                                                 passToggle ? Icons.visibility_off : Icons.visibility,
                                                                                 color: Colors.grey,
                                                                                 size: 20,

                                                                             ),
                                                                           ),
                                                                         ],
                                                                       ),
                                                                     ),
                                                                   ),
                                                                 ],
                                                               ),
                                                             ),
                                                            CustomButton(
                                                                text: "Login",
                                                                margin: getMargin(left: 1, top: 34),
                                                                variant: ButtonVariant.GradientIndigoA100IndigoA100,
                                                                shape: ButtonShape.CircleBorder12,
                                                                onTap: () {
                                                                  onTapLogin(context);
                                                                },
                                                                padding: ButtonPadding.PaddingAll12,
                                                                fontStyle: ButtonFontStyle.PoppinsSemiBold16,
                                                            ),
                                                           ]
                                                       )
                                                   )
                                               ),
                                               Align(
                                                   alignment: Alignment.topLeft,
                                                   child: Padding(
                                                       padding: getPadding(left: 54, top: 254),
                                                       child: Text(
                                                           "Matric Number",
                                                           overflow: TextOverflow.ellipsis,
                                                           textAlign: TextAlign.left,
                                                           style: AppStyle.txtPoppinsMedium1433))),
                                               Align(
                                                   alignment: Alignment.bottomCenter,
                                                   child: GestureDetector(
                                                       onTap: () {onTapTxtDonthaveanaccount(context);},
                                                       child: Container(
                                                           width: getHorizontalSize(167),
                                                           margin: getMargin(bottom: 100),
                                                           child: RichText(
                                                               text: TextSpan(
                                                                   children: [TextSpan(
                                                                       text: "Don’t have an account?",
                                                                       style: TextStyle(
                                                                           color: ColorConstant.whiteA700,
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
                                                               textAlign: TextAlign.center)
                                                       )
                                                   )
                                               )
                                              ]
                                          )
                                          )
                                      )
                                     ]
                                 )
                             )
                         )
                     )
                     ]
                 )
             )
         )
     )
 );
}

onTapBtnIcback(
     BuildContext context) {
 Navigator.pushNamed(context, AppRoutes.welcomeUserScreen); }
  /*
onTapLogin(
     BuildContext context) {
 Navigator.pushNamed(context, AppRoutes.homeStudentScreen); }*/
onTapTxtForgotpassword(BuildContext context) {
 Navigator.pushNamed(context, AppRoutes.studentForgotPasswordScreen); }
onTapTxtDonthaveanaccount(BuildContext context) {
 Navigator.pushNamed(context, AppRoutes.registerStudentScreen); }
 }
