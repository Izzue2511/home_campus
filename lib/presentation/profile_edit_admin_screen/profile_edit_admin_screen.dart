import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
// ignore_for_file: must_be_immutable

class ProfileEditAdminScreen extends StatefulWidget {
  @override
  _ProfileEditAdminScreenState createState() => _ProfileEditAdminScreenState();
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

class _ProfileEditAdminScreenState extends State<ProfileEditAdminScreen> {

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

//final user = FirebaseAuth.instance.currentUser!;

// Function to check if the user is authenticated
  bool isUserAuthenticated() {
    return auth.currentUser != null;
  }

TextEditingController nameController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Widget buildAdmin (Admin admin, String currentUserId) => Column(
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
                        hintText: admin.admin_name,
                        maxLines: null,
                        margin: getMargin(left: 48, right: 48),
                        padding: TextFormFieldPadding.PaddingAll11),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 54, top: 15, bottom: 5),
                            child: Text(
                                "Username",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium14))),
                    Container(
                      width: getHorizontalSize(430),
                      margin: getMargin(top: 0),
                      child: CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: usernameController,
                          hintText: admin.admin_username,
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
                        hintText: admin.admin_email,
                        margin: getMargin(left: 48, right: 48),
                        padding: TextFormFieldPadding.PaddingAll11,
                        textInputType: TextInputType.emailAddress),
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
                        hintText: admin.admin_password,
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
                        onTap: () {

                          final docAdmin = FirebaseFirestore.instance.collection('admin').doc(currentUserId);

                          Map<String, Object> updateData = {};

                          if (nameController.text == "") {
                            updateData['admin_name'] = admin.admin_name;
                          } else {
                            updateData['admin_name'] = nameController.text;
                          }

                          if (usernameController.text == "") {
                            updateData['admin_username'] = admin.admin_username;
                          } else {
                            updateData['admin_username'] = usernameController.text;
                          }

                          if (emailController.text == "") {
                            updateData['admin_email'] = admin.admin_email;
                          } else {
                            updateData['admin_email'] = emailController.text;
                          }

                          if (passwordController.text == "") {
                            updateData['admin_password'] = admin.admin_password;
                          } else {
                            updateData['admin_password'] = passwordController.text;
                          }

                          docAdmin.update(updateData);

                          onTapUpdateprofile(context);
                        }
                        )
                  ]
              )
          )
      ),
    ),
    ]
);

  Future<Admin?> readAdmin(String currentUserId) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('admin')
          .where('admin_id', isEqualTo: currentUserId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final ownerData = querySnapshot.docs.first.data();
        return Admin.fromJson(ownerData);
      } else {
        print("No admin found for the current user.");
        return null;
      }
    } catch (e) {
      print("Error fetching admin data: $e");
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
         FutureBuilder<Admin?>(
           future: readAdmin(currentUserId),
           builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
               return Center(child: CircularProgressIndicator());
             } else if (snapshot.hasError) {
               return Text('Something went wrong! ${snapshot.error}');
             } else if (snapshot.hasData) {
               final admin = snapshot.data;
               return admin == null
                   ? Center(child: Text('No Admin'))
                   : buildAdmin(admin, currentUserId);
             } else {
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

onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileAdminScreen); }
onTapUpdateprofile(BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileAdminScreen); }
onTapHomeicon(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.homeAdminScreen); }
onTapExploreicon(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.scheduledRequestedScreen); }
onTapChat(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.chatOwnerScreen); }
onTapProfile(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileAdminScreen); }
 }
