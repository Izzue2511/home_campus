import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
// ignore_for_file: must_be_immutable

class ProfileStudentScreen extends StatefulWidget {
  @override
  _ProfileStudentScreenState createState() => _ProfileStudentScreenState();

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

class _ProfileStudentScreenState extends State<ProfileStudentScreen> {


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

  void onTapLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
            ),
            ElevatedButton(
              child: Text('Log Out'),
              onPressed: () async {
                Navigator.of(context).pop(); // Close the alert dialog
                try {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, AppRoutes.loginStudentScreen);
                } catch (e) {
                  // Handle any error that occurs during sign-out.
                  print('Error during sign-out: $e');
                }
              },
            ),
          ],
        );
      },
    );
  }

// Function to check if the user is authenticated
  bool isUserAuthenticated() {
    return auth.currentUser != null;
  }

  String obscureText(String text) {
    String obscuredText = '';
    for (int i = 0; i < text.length; i++) {
      obscuredText += '•'; // Replace each character with a bullet symbol (•)
    }
    return obscuredText;
  }

  Widget buildTenant(Tenant tenant, String currentUserId) => Container(
      width: double.maxFinite,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: getVerticalSize(200),
                            width: double.maxFinite,
                            child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  CustomButton(
                                      height: getVerticalSize(150),
                                      width: double.maxFinite,
                                      shape: ButtonShape.Square,
                                      padding: ButtonPadding.PaddingT86,
                                      fontStyle: ButtonFontStyle.DMSansBold20,
                                      alignment: Alignment.topCenter),
                                  Padding(
                                    padding: getPadding(right: 175, bottom: 100),
                                    child: Text(
                                      "Profile",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'DM Sans',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                      margin: getMargin(right: 45,bottom: 100),
                                      child: GestureDetector(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Confirmation'),
                                                content: Text('Are you sure you want to delete your account?'),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                    child: Text('Cancel'),
                                                    onPressed: () {
                                                      onTapCancelDeleted(context);
                                                    },
                                                  ),
                                                  ElevatedButton(
                                                    child: Text('Delete'),
                                                    onPressed: () {
                                                      final docTenant = FirebaseFirestore.instance.collection('tenant').doc(tenant.tenant_id);
                                                      // Add your delete logic here
                                                      docTenant.delete();

                                                      onTapConfirmDeleted(context);// Close the alert dialog
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.delete_outline,
                                          color: Colors.white,
                                        ),
                                      ),
                                  ),
                                  CustomImageView(
                                      imagePath: ImageConstant.imgUnsplashjmurdhtm7ng130x130,
                                      height: getSize(130),
                                      width: getSize(130),
                                      radius: BorderRadius.circular(
                                          getHorizontalSize(65)),
                                      alignment: Alignment.bottomCenter)
                                ]
                            )
                        ),
                        Padding(
                          padding: getPadding(top: 20, left: 145),
                          child: Row(
                            children: [
                              Text(
                                "Edit Profile",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtDMSansBold18,
                              ),
                              CustomIconButton(
                                height: 30,
                                width: 30,
                                margin: getMargin(left: 5),
                                variant: IconButtonVariant.FillIndigoA100,
                                padding: IconButtonPadding.PaddingAll6,
                                onTap: () {
                                  onTapEditProfile(context);
                                },
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgEdit,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //sini
                        Container(
                          margin: getMargin(left: 33, top: 28, right: 33),
                          decoration: AppDecoration.outlineBlack9003f,
                          child: Container(
                            padding: getPadding(
                              left: 16,
                              top: 9,
                              right: 16,
                              bottom: 9,
                            ),
                            decoration: AppDecoration.fillGray30066.copyWith(
                              borderRadius: BorderRadiusStyle.circleBorder29,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  margin: getMargin(
                                    top: 5,
                                    bottom: 15,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.person_outline,
                                      color: Colors.deepPurpleAccent.withOpacity(0.7),
                                      size: 25, // Adjust the size according to your preference
                                    ),
                                    onPressed: () {
                                      // Add your phone button logic here
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: getPadding(
                                    left: 10,
                                    top: 0,
                                  ),
                                  child: Container(
                                    width: getHorizontalSize(270),
                                    margin: getMargin(top: 0),
                                    child:
                                    Text(
                                      tenant.tenant_name,
                                      //overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtDMSansMedium13,
                                      maxLines: null,
                                      //softWrap: false, // Set softWrap to false to limit words in one line
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
                        ), // <-- Added closing parenthesis for the first Container
                        Container(
                          margin: getMargin(left: 33, top: 28, right: 33), // <-- Moved margin after the positional arguments
                          padding: getPadding(
                            left: 16,
                            top: 9,
                            right: 16,
                            bottom: 9,
                          ),
                          decoration: AppDecoration.fillGray30066.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder29,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                margin: getMargin(
                                  top: 5,
                                  bottom: 15,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.home_outlined,
                                    color: Colors.deepPurpleAccent.withOpacity(0.7),
                                    size: 25, // Adjust the size according to your preference
                                  ),
                                  onPressed: () {
                                    // Add your phone button logic here
                                  },
                                ),
                              ),
                                Padding(
                                    padding: getPadding(
                                      left: 10,
                                      top: 0,
                                    ),
                                    child: Container(
                                      width: getHorizontalSize(270),
                                      margin: getMargin(top: 0),
                                      child:
                                        Text(
                                          tenant.tenant_address,
                                          //overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtDMSansMedium13,
                                          maxLines: null,
                                          //softWrap: false, // Set softWrap to false to limit words in one line
                                        ),
                                    ),
                                  ),
                              Spacer(),
                            ],
                          ),
                        ),

                        Container(
                          margin: getMargin(left: 33, top: 28, right: 33), // <-- Moved margin after the positional arguments
                          padding: getPadding(
                            left: 16,
                            top: 9,
                            right: 16,
                            bottom: 9,
                          ),
                          decoration: AppDecoration.fillGray30066.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder29,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                margin: getMargin(
                                  top: 5,
                                  bottom: 15,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.deepPurpleAccent.withOpacity(0.7),
                                    size: 25, // Adjust the size according to your preference
                                  ),
                                  onPressed: () {
                                    // Add your phone button logic here
                                  },
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 10,
                                  top: 0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      tenant.tenant_email,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtDMSansMedium13,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Container(
                          margin: getMargin(left: 33, top: 28, right: 33), // <-- Moved margin after the positional arguments
                          padding: getPadding(
                            left: 16,
                            top: 9,
                            right: 16,
                            bottom: 9,
                          ),
                          decoration: AppDecoration.fillGray30066.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder29,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                margin: getMargin(
                                  top: 5,
                                  bottom: 15,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.phone_iphone_outlined,
                                    color: Colors.deepPurpleAccent.withOpacity(0.7),
                                    size: 25, // Adjust the size according to your preference
                                  ),
                                  onPressed: () {
                                    // Add your phone button logic here
                                  },
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 10,
                                  top: 0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      tenant.tenant_phone,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtDMSansMedium13,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Container(
                          margin: getMargin(left: 33, top: 28, right: 33), // <-- Moved margin after the positional arguments
                          padding: getPadding(
                            left: 16,
                            top: 9,
                            right: 16,
                            bottom: 9,
                          ),
                          decoration: AppDecoration.fillGray30066.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder29,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                margin: getMargin(
                                  top: 5,
                                  bottom: 15,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.school_outlined,
                                    color: Colors.deepPurpleAccent.withOpacity(0.7),
                                    size: 25, // Adjust the size according to your preference
                                  ),
                                  onPressed: () {
                                    // Add your phone button logic here
                                  },
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 10,
                                  top: 0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      tenant.tenant_matricNum,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtDMSansMedium13,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        Container(
                          margin: getMargin(left: 33, top: 28, right: 33), // <-- Moved margin after the positional arguments
                          padding: getPadding(
                            left: 16,
                            top: 9,
                            right: 16,
                            bottom: 9,
                          ),
                          decoration: AppDecoration.fillGray30066.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder29,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                margin: getMargin(
                                  top: 5,
                                  bottom: 15,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.deepPurpleAccent.withOpacity(0.7),
                                    size: 25, // Adjust the size according to your preference
                                  ),
                                  onPressed: () {
                                    // Add your phone button logic here
                                  },
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 10,
                                  top: 0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      obscureText(tenant.tenant_password),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtDMSansMedium13,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onTapLogout(context);
                          },
                          child: Container(
                              margin: getMargin(left: 30, top: 40, right: 30, bottom: 40),
                              padding: getPadding(left: 118, top: 10, right: 118, bottom: 10),
                              decoration: AppDecoration.gradientIndigoA10001DeeppurpleA200.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                        padding: getPadding(top: 5),
                                        child: Text(
                                            "Log Out",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtHindMedium22.copyWith(letterSpacing: getHorizontalSize(0.29))
                                        )
                                    ),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgArrowleft,
                                        height: getSize(30),
                                        width: getSize(30),
                                        margin: getMargin(left: 10, top: 5, bottom: 5))
                                  ]
                              )
                          ),
                        ),
                      ]
                  )
              )
          )
          ]
      )
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
      print("Error fetching tenant data: $e");
      return null;
    }
  }

  @override
Widget build(BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
  final currentUserId = userProvider.currentUserId;
  print('Current UserID: $currentUserId');
/*
  if (!isUserAuthenticated()) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  if (currentUserId == null) {
    // If the currentUserId is null, show a loading indicator or redirect to the login screen.
    // You can decide what to do here based on your app's requirements.
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }*/

 return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.whiteA700,
         body: FutureBuilder<Tenant?>(
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

  onTapConfirmDeleted(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginStudentScreen); }
  onTapCancelDeleted(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileStudentScreen); }
 onTapNotification(BuildContext context) { Navigator.pushNamed(context, AppRoutes.notificationOwnerScreen); }
 onTapEditProfile(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileEditHouseOwnerScreen); }
 onTapHome(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeStudentScreen); }
 onTapSchedule(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
 onTapSaved(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.savedPage); }
 onTapProfile(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileStudentScreen); }

 }
