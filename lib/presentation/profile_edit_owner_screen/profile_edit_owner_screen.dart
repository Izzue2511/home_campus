import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
// ignore_for_file: must_be_immutable

class ProfileEditOwnerScreen extends StatefulWidget {
  @override
  _ProfileEditOwnerScreenState createState() => _ProfileEditOwnerScreenState();
}

class House_Owner{
  String owner_id;
  final String owner_name;
  final String owner_address;
  final String owner_email;
  final String owner_phone;
  final String owner_password;

  House_Owner({
    this.owner_id = '',
    required this.owner_name,
    required this.owner_address,
    required this.owner_email,
    required this.owner_phone,
    required this.owner_password,
  });

  Map<String, dynamic> toJson() => {
    'owner_id': owner_id,
    'owner_name': owner_name,
    'owner_address': owner_address,
    'owner_email': owner_email,
    'owner_phone': owner_phone,
    'owner_password': owner_password,
  };

  static House_Owner fromJson(Map<String, dynamic> json) => House_Owner(
    owner_id: json['owner_id'],
    owner_name: json['owner_name'],
    owner_address: json['owner_address'],
    owner_email: json['owner_email'],
    owner_phone: json['owner_phone'],
    owner_password: json['owner_password'],
  );
}

class _ProfileEditOwnerScreenState extends State<ProfileEditOwnerScreen> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser;

  @override
  void initState() {
    super.initState();
    inputData();
  }

  void inputData() async {
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final currentUserId = currentUser!.uid;
      // Here you have the current user ID (uid), and you can use it as needed.
      // For example, you can pass it to the `getUserByMatricNumber` function.
      setState(() {
        // Call setState to trigger a rebuild if needed.
      });
    } else {
      // Handle the case where the user is null, such as showing an error message or redirecting to the login screen.
    }
  }

  String _encryptPassword(String password) {
    final key = encrypt.Key.fromLength(32); // AES-256 requires a 32-byte key
    final iv = encrypt.IV.fromLength(16); // AES uses a 16-byte IV

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(password, iv: iv);

    return encrypted.base64;
  }

  String _decryptPassword(String encryptedPassword) {
    final key = encrypt.Key.fromLength(32); // AES-256 requires a 32-byte key
    final iv = encrypt.IV.fromLength(16); // AES uses a 16-byte IV

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedPassword), iv: iv);

    return decrypted;
  }

// Function to check if the user is authenticated
  bool isUserAuthenticated() {
    return auth.currentUser != null;
  }

TextEditingController nameController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController mobileController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Widget buildOwner (House_Owner owner, String currentUserId,String decryptedPassword) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [Expanded(
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: getVerticalSize(230),
                        width: double.maxFinite,
                        child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                      width: double.maxFinite,
                                      margin: getMargin(bottom: 70),
                                      padding: getPadding(left: 38, top: 35, right: 38, bottom: 35),
                                      decoration: AppDecoration.fillIndigoA100,
                                      child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [CustomIconButton(
                                              height: 40, width: 40, margin: getMargin(bottom: 52),
                                              onTap: () {onTapBtnIcback(context);},
                                              child: CustomImageView(
                                                  svgPath: ImageConstant.imgIcback)),
                                            Padding(
                                                padding: getPadding(left: 91, top: 5, bottom: 53),
                                                child: Text(
                                                    "Edit Profile",
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtPoppinsSemiBold15)
                                            )
                                          ]
                                      )
                                  )
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                      height: getSize(142),
                                      width: getSize(142),
                                      child: Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [CustomImageView(
                                              imagePath: ImageConstant.imgUnsplashjmurdhtm7ng,
                                              height: getSize(142),
                                              width: getSize(142),
                                              radius: BorderRadius.circular(
                                                  getHorizontalSize(71)),
                                              alignment: Alignment.center),
                                            CustomImageView(
                                                svgPath: ImageConstant.imgEdit,
                                                height: getSize(24),
                                                width: getSize(24),
                                                alignment: Alignment.bottomRight,
                                                margin: getMargin(right: 22, bottom: 24))
                                          ]
                                      )
                                  )
                              )
                            ]
                        )
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 54, top: 15, bottom: 5),
                            child: Text(
                                "Name",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium14))),
                    CustomTextFormField(
                        focusNode: FocusNode(),
                        autofocus: true,
                        controller: nameController,
                        hintText: owner.owner_name,
                        maxLines: null,
                        margin: getMargin(left: 48, right: 48),
                        padding: TextFormFieldPadding.PaddingAll11),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 54, top: 15, bottom: 5),
                            child: Text(
                                "Address",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium14))),
                    Container(
                      width: getHorizontalSize(430),
                      margin: getMargin(top: 0),
                      child: CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: addressController,
                          hintText: owner.owner_address,
                          maxLines: 2,
                          margin: getMargin(left: 48, right: 48),
                          padding: TextFormFieldPadding.PaddingAll11),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 54, top: 15, bottom: 5),
                            child: Text(
                                "Email",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium14))),
                    CustomTextFormField(
                        focusNode: FocusNode(),
                        autofocus: true,
                        controller: emailController,
                        hintText: owner.owner_email,
                        margin: getMargin(left: 48, right: 48),
                        padding: TextFormFieldPadding.PaddingAll11,
                        textInputType: TextInputType.emailAddress),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 54, top: 15, bottom: 5),
                            child: Text(
                                "Mobile No.",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium14))),
                    CustomTextFormField(
                        focusNode: FocusNode(),
                        autofocus: true,
                        controller: mobileController,
                        hintText: owner.owner_phone,
                        margin: getMargin(left: 48, right: 48),
                        padding: TextFormFieldPadding.PaddingAll11),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 54, top: 15, bottom: 5),
                            child: Text(
                                "Password",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium14))),
                    CustomTextFormField(
                        focusNode: FocusNode(),
                        autofocus: true,
                        controller: passwordController,
                        hintText: decryptedPassword,
                        margin: getMargin(left: 48, right: 48),
                        padding: TextFormFieldPadding.PaddingAll11,
                        textInputAction: TextInputAction.done),
                    CustomButton(
                      height: getVerticalSize(55),
                      width: getHorizontalSize(320),
                      text: "Update Profile",
                      margin: getMargin(top: 30, bottom: 30),
                      shape: ButtonShape.RoundedBorder15,
                      fontStyle: ButtonFontStyle.RubikMedium18,
                      onTap: () async {
                        final docOwner = FirebaseFirestore.instance.collection('house_owner').doc(currentUserId);

                        Map<String, Object> updateData = {};

                        if (nameController.text == "") {
                          updateData['owner_name'] = owner.owner_name;
                        } else {
                          updateData['owner_name'] = nameController.text;
                        }

                        if (addressController.text == "") {
                          updateData['owner_address'] = owner.owner_address;
                        } else {
                          updateData['owner_address'] = addressController.text;
                        }

                        if (emailController.text == "") {
                          updateData['owner_email'] = owner.owner_email;
                        } else {
                          updateData['owner_email'] = emailController.text;
                        }

                        if (mobileController.text == "") {
                          updateData['owner_phone'] = owner.owner_phone;
                        } else {
                          updateData['owner_phone'] = mobileController.text;
                        }

                        if (passwordController.text == "") {
                          // If the password field is empty, keep the existing encrypted password
                          updateData['owner_password'] = owner.owner_password;
                        } else {
                          // Encrypt the new password before updating
                          String encryptedPassword = _encryptPassword(passwordController.text);
                          updateData['owner_password'] = encryptedPassword;
                        }

                        docOwner.update(updateData);

                        onTapUpdateprofile(context);
                      },
                    )

                  ]
              )
          )
      ),
    ),
    ]
);

  Future<House_Owner?> readOwner(String currentUserId) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('house_owner')
          .where('owner_id', isEqualTo: currentUserId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final ownerData = querySnapshot.docs.first.data();
        return House_Owner.fromJson(ownerData);
      } else {
        print("No house owner found for the current user.");
        return null;
      }
    } catch (e) {
      print("Error fetching owner data: $e");
      return null;
    }
  }

@override
Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
  final currentUserId = userProvider.currentUserId;
  print('Current UserID: $currentUserId');

 return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.whiteA700,
         resizeToAvoidBottomInset: false,
         body:
         FutureBuilder<House_Owner?>(
           future: readOwner(currentUserId),
           builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
               return Center(child: CircularProgressIndicator());
             } else if (snapshot.hasError) {
               return Text('Something went wrong! ${snapshot.error}');
             } else if (snapshot.hasData) {
               final owner = snapshot.data;
               if (owner == null) {
                 return Center(child: Text('No House Owner'));
               }
               String decryptedPassword = _decryptPassword(
                   owner.owner_password);

               return buildOwner(owner, currentUserId, decryptedPassword);
             }else {
               return Center(child: Text('No data available'));
             }
           },
         ),

         bottomNavigationBar: Container(
             width: double.maxFinite,
             padding: getPadding(left: 44, top: 5, right: 44, bottom: 15),
             decoration: AppDecoration.fillWhiteA700,
             child: Column(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [Container(
                     decoration: AppDecoration.fillWhiteA700,
                     child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.end,

                         children: [Padding(
                             padding: getPadding(top: 16),
                             child: GestureDetector(
                                 onTap: () {
                                   onTapHomeicon(context);
                                 },
                                 child: Column(
                                     mainAxisSize: MainAxisSize.min,
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [CustomImageView(
                                         imagePath: ImageConstant.imgVuesaxboldhome,
                                         height: getSize(24),
                                         width: getSize(24)),
                                       Padding(
                                           padding: getPadding(top: 2),
                                           child: Text(
                                               "Home",
                                               overflow: TextOverflow.ellipsis,
                                               textAlign: TextAlign.left,
                                               style: AppStyle.txtHindMedium12)
                                       )
                                     ]
                                 )
                             )
                         ),
                           GestureDetector(
                               onTap: () {onTapExploreicon(context);},
                               child: Padding(
                                   padding: getPadding(top: 16),
                                   child: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [CustomImageView(
                                           svgPath: ImageConstant.imgCalendar10,
                                           height: getSize(24),
                                           width: getSize(24)),
                                         Padding(
                                             padding: getPadding(top: 2),
                                             child: Text(
                                                 "Schedule",
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: AppStyle.txtHindMedium12))]))),
                           Container(
                             height: getSize(64),
                             width: getSize(64),
                             child: Stack(
                               alignment: Alignment.topCenter,
                               children: [
                                 Align(
                                   alignment: Alignment.center,
                                   child: GestureDetector(
                                     child: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         Container(
                                           height: getSize(55),
                                           width: getSize(55),
                                           decoration: BoxDecoration(
                                             color: ColorConstant.gray20001,
                                             borderRadius: BorderRadius.circular(getHorizontalSize(27)),
                                           ),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                                 GestureDetector(
                                   child: CustomImageView(
                                     onTap: () {onTapButton(context);},
                                     svgPath: ImageConstant.imgIcon,
                                     height: getSize(43),
                                     width: getSize(43),
                                     alignment: Alignment.topCenter,
                                     margin: getMargin(top: 7),
                                   ),
                                 ),
                               ],
                             ),
                           ),

                           GestureDetector(
                               onTap: () {onTapChat(context);},
                               child:Padding(
                                   padding: getPadding(top: 16),
                                   child: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [CustomImageView(
                                           svgPath: ImageConstant.imgComputer,
                                           height: getSize(24),
                                           width: getSize(24)),
                                         Padding(
                                             padding: getPadding(top: 2),
                                             child: Text(
                                                 "Chat",
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: AppStyle.txtHindMedium12))
                                       ]
                                   )
                               )
                           ),
                           GestureDetector(
                               onTap: () {onTapProfile(context);},
                               child:Padding(
                                   padding: getPadding(top: 16),
                                   child: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [CustomImageView(
                                           svgPath: ImageConstant.imgUser,
                                           height: getSize(24),
                                           width: getSize(24)),
                                         Padding(
                                             padding: getPadding(top: 2),
                                             child: Text(
                                                 "Profile",
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: AppStyle.txtHindMedium12)
                                         )
                                       ]
                                   )
                               ))
                         ]
                     )
                 )
                 ]
             )
         )
     )
 );
}

onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileHouseOwnerScreen); } 
onTapUpdateprofile(BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileHouseOwnerScreen); }
onTapHomeicon(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.homeHouseOwnerScreen); }
onTapExploreicon(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.scheduledRequestedScreen); }
onTapButton(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.addHouseRentalScreen); }
onTapChat(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.chatOwnerScreen); }
onTapProfile(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileHouseOwnerScreen); }
 }
