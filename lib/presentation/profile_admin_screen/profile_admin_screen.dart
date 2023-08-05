import '../profile_house_owner_screen/widgets/settingscards1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
// ignore_for_file: must_be_immutable
class ProfileAdminScreen extends StatefulWidget {
  @override
  _ProfileAdminScreenState createState() => _ProfileAdminScreenState();

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

class _ProfileAdminScreenState extends State<ProfileAdminScreen> {

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
                  Navigator.pushNamed(context, AppRoutes.loginAdminScreen);
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

  Widget buildAdmin (Admin admin, String currentUserId) => Container(
      width: double.maxFinite,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: getVerticalSize(150),
                            width: double.maxFinite,
                            child: Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  CustomButton(
                                      height: getVerticalSize(100),
                                      width: double.maxFinite,
                                      shape: ButtonShape.Square,
                                      padding: ButtonPadding.PaddingT86,
                                      fontStyle: ButtonFontStyle.DMSansBold20,
                                      alignment: Alignment.topCenter),
                                  Padding(
                                    padding: getPadding(right: 175, bottom: 50),
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
                                      margin: getMargin(right: 45,bottom: 50),
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
                                                      final docAdmin = FirebaseFirestore.instance.collection('admin').doc(admin.admin_id);
                                                      // Add your delete logic here
                                                      docAdmin.delete();

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
                                ]
                            )
                        ),
                        Padding(
                          padding: getPadding(top: 0, left: 145),
                          child: Row(
                            children: [
                              Text(
                                "Edit Account",
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
                                      admin.admin_name,
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
                                    admin.admin_username,
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
                                      admin.admin_email,
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
                                      obscureText(admin.admin_password),
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

  Future<Admin?> readAdmin(String currentUserId) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('admin')
          .where('admin_id', isEqualTo: currentUserId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final adminData = querySnapshot.docs.first.data();
        return Admin.fromJson(adminData);
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

  onTapConfirmDeleted(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginAdminScreen); }
  onTapCancelDeleted(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileAdminScreen); }
onTapEditProfile(BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileEditAdminScreen); }
onTapNotification(BuildContext context) { Navigator.pushNamed(context, AppRoutes.notificationOwnerScreen); }
 onTapHomeicon(BuildContext context) {
   Navigator.pushNamed(context, AppRoutes.homeAdminScreen); }
 onTapExploreicon(BuildContext context) {
   Navigator.pushNamed(context, AppRoutes.scheduledRequestedScreen); }
 onTapChat(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.chatOwnerScreen); }
 onTapProfile(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileAdminScreen); }
 }
