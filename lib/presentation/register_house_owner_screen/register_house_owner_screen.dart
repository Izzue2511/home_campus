import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:homecampus/core/utils/aes_helper.dart';
// ignore_for_file: must_be_immutable

class RegisterHouseOwnerScreen extends StatefulWidget {
  @override
  _RegisterHouseOwnerScreenState createState() => _RegisterHouseOwnerScreenState();

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
}

class _RegisterHouseOwnerScreenState extends State<RegisterHouseOwnerScreen>{

TextEditingController fullnameController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController phoneNumController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Future<void> createOwner(House_Owner owner) async {
  final docOwner = FirebaseFirestore.instance.collection('house_owner').doc();
  owner.owner_id = docOwner.id; // Assign the document ID to the property_id field

  final json = owner.toJson();
  await docOwner.set(json);
}

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

  void onTapCreateaccount(BuildContext context) async {
    if (_formKey.currentState?.validate() == true) {
      final owner = House_Owner(
        owner_name: fullnameController.text,
        owner_address: addressController.text,
        owner_email: emailController.text,
        owner_phone: "+6" + phoneNumController.text,
        owner_password: passwordController.text,
        owner_image: "",
        owner_accountBank: "No Account Bank",
        owner_accountNo: "No Account Number",
        owner_accountHolder: "No Account Holder",
      );

      // Encrypt the password before saving it to Firebase
      final encryptedPassword = _encryptPassword(owner.owner_password);
      owner.owner_password = encryptedPassword;

      createOwner(owner); // Save the owner to Firebase (your existing code)

      Navigator.pushNamed(context, AppRoutes.loginHouseOwnerScreen);
    }
  }


  String _encryptPassword(String password) {
    final key = encrypt.Key.fromLength(32); // AES-256 requires a 32-byte key
    final iv = encrypt.IV.fromLength(16); // AES uses a 16-byte IV

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);

    return encrypted.base64;
  }

@override
Widget build(
    BuildContext context) {
 return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.gray90005,
         resizeToAvoidBottomInset: false,
         body: SingleChildScrollView(
           child: Form(
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
                             validator: (value) {
                               if (value == null || value.trim().isEmpty) {
                                 return 'Please enter your name.';
                               }
                               return null;
                             },
                         ),
                         CustomTextFormField(
                             focusNode: FocusNode(),
                             autofocus: true,
                             controller: addressController,
                             hintText: "Address",
                             margin: getMargin(left: 32, top: 23, right: 33),
                             variant: TextFormFieldVariant.UnderLine_1,
                             fontStyle: TextFormFieldFontStyle.PoppinsRegular12,
                             textInputType: TextInputType.streetAddress,
                             validator: (value) {
                               if (value == null || value.trim().isEmpty) {
                                 return 'Please enter your address.';
                               }
                               return null;
                             },
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
                             controller: phoneNumController,
                             hintText: "Mobile No.",
                             margin: getMargin(left: 32, top: 23, right: 33),
                             variant: TextFormFieldVariant.UnderLine_1,
                             fontStyle: TextFormFieldFontStyle.PoppinsRegular12,
                             textInputType: TextInputType.phone,
                             validator: (value) {
                               if (value == null || value.trim().isEmpty) {
                                 return 'Please enter your mobile number.';
                               }
                               return null;
                             },
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password.';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters long.';
                              }
                              return null;
                            },
                        ),
                        CustomButton(
                            text: "Create Account",
                            margin: getMargin(left: 32, top: 43, right: 33),
                            variant: ButtonVariant.GradientIndigoA100IndigoA100_1,
                            shape: ButtonShape.RoundedBorder15,
                            padding: ButtonPadding.PaddingAll12,
                            fontStyle: ButtonFontStyle.PoppinsMedium1792,
                            onTap: () {

                                onTapCreateaccount(context);

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
           ),
         )
     )
 );
}
onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginHouseOwnerScreen); }
onTapTxtLogin(BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginHouseOwnerScreen); } 
 }
