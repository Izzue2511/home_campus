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

class ProfileEditHouseOwnerScreen extends StatefulWidget {
  @override
  _ProfileEditHouseOwnerScreenState createState() => _ProfileEditHouseOwnerScreenState();

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

class _ProfileEditHouseOwnerScreenState extends State<ProfileEditHouseOwnerScreen> {

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
TextEditingController addressController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController mobileController = TextEditingController();
TextEditingController matricnumController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

Widget buildTenant (Tenant tenant, String currentUserId) => Column(
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
                        hintText: tenant.tenant_name,
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
                          hintText: tenant.tenant_address,
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
                        hintText: tenant.tenant_email,
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
                        hintText: tenant.tenant_phone,
                        margin: getMargin(left: 48, right: 48),
                        padding: TextFormFieldPadding.PaddingAll11),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: getPadding(left: 54, top: 15, bottom: 5),
                            child: Text(
                                "Matric Number",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtPoppinsMedium14))),
                    CustomTextFormField(
                        focusNode: FocusNode(),
                        autofocus: true,
                        controller: matricnumController,
                        hintText: tenant.tenant_matricNum,
                        margin: getMargin(left: 48, right: 48),
                        padding: TextFormFieldPadding.PaddingAll11,
                        textInputAction: TextInputAction.done),
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
                        hintText: tenant.tenant_password,
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

                          final docTenant = FirebaseFirestore.instance.collection('tenant').doc(currentUserId);

                          Map<String, Object> updateData = {};

                          if (nameController.text == "") {
                            updateData['tenant_name'] = tenant.tenant_name;
                          } else {
                            updateData['tenant_name'] = nameController.text;
                          }

                          if (addressController.text == "") {
                            updateData['tenant_address'] = tenant.tenant_address;
                          } else {
                            updateData['tenant_address'] = addressController.text;
                          }

                          if (emailController.text == "") {
                            updateData['tenant_email'] = tenant.tenant_email;
                          } else {
                            updateData['tenant_email'] = emailController.text;
                          }

                          if (mobileController.text == "") {
                            updateData['tenant_phone'] = tenant.tenant_phone;
                          } else {
                            updateData['tenant_phone'] = mobileController.text;
                          }

                          if (matricnumController.text == "") {
                            updateData['tenant_matricNum'] = tenant.tenant_matricNum;
                          } else {
                            updateData['tenant_matricNum'] = matricnumController.text;
                          }

                          if (passwordController.text == "") {
                            updateData['tenant_password'] = tenant.tenant_password;
                          } else {
                            updateData['tenant_password'] = passwordController.text;
                          }

                          docTenant.update(updateData);

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

Future<Tenant?> readTenant(String currentUserId) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('tenant')
        .where('tenant_id', isEqualTo: currentUserId)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      final tenantData = querySnapshot.docs.first.data();
      return Tenant.fromJson(tenantData);
    } else {
      print("No tenant found for the current user.");
      return null;
    }
  } catch (e) {
    print("Error fetching owner data: $e");
    return null;
  }
}

@override
Widget build(
    BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
  final currentUserId = userProvider.currentUserId;
  print('Current UserID: $currentUserId');

 return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.whiteA700,
         resizeToAvoidBottomInset: false,
         body:  FutureBuilder<Tenant?>(
           future: readTenant(currentUserId),
           builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
               return Center(child: CircularProgressIndicator());
             } else if (snapshot.hasError) {
               return Text('Something went wrong! ${snapshot.error}');
             } else if (snapshot.hasData) {
               final tenant = snapshot.data;
               return tenant == null
                   ? Center(child: Text('No Tenant'))
                   : buildTenant(tenant, currentUserId);
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
                             padding: getPadding(top: 15),
                             child: GestureDetector(
                                 onTap: () {
                                   onTapHome(context);
                                 },
                                 child: Column(
                                     mainAxisSize: MainAxisSize.min,
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [CustomImageView(
                                         imagePath: ImageConstant.imgVuesaxboldhome,
                                         height: getSize(26),
                                         width: getSize(26)),
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
                               onTap: () {
                                 onTapSaved(context);
                               },
                               child:Padding(
                                   padding: getPadding(top: 15),
                                   child: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [
                                         CustomImageView(
                                             svgPath: ImageConstant.imgClock,
                                             height: getSize(25),
                                             width: getSize(25)),
                                         Padding(
                                             padding: getPadding(top: 2),
                                             child: Text(
                                                 "Saved",
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: AppStyle.txtHindMedium12))
                                       ]
                                   )
                               )
                           ),
                           GestureDetector(
                               onTap: () {onTapSchedule(context);},
                               child: Padding(
                                   padding: getPadding(top: 15),
                                   child: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [CustomImageView(
                                           svgPath: ImageConstant.imgCalendar10,
                                           height: getSize(25),
                                           width: getSize(25)),
                                         Padding(
                                             padding: getPadding(top: 2),
                                             child: Text(
                                                 "Booking",
                                                 overflow: TextOverflow.ellipsis,
                                                 textAlign: TextAlign.left,
                                                 style: AppStyle.txtHindMedium12))]
                                   )
                               )
                           ),
                           GestureDetector(
                               onTap: () {onTapProfile(context);},
                               child:Padding(
                                   padding: getPadding(top: 15),
                                   child: Column(
                                       mainAxisSize: MainAxisSize.min,
                                       mainAxisAlignment: MainAxisAlignment.start,
                                       children: [CustomImageView(
                                           svgPath: ImageConstant.imgUser,
                                           height: getSize(25),
                                           width: getSize(25)),
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
onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileStudentScreen); } 
onTapUpdateprofile(BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileStudentScreen); }
onTapHome(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeStudentScreen); }
onTapSchedule(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
onTapSaved(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.savedPage); }
onTapProfile(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileStudentScreen); }
 }
