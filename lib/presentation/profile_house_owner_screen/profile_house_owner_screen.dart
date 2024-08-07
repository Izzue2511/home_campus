// import '../profile_house_owner_screen/widgets/settingscards1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
// ignore_for_file: must_be_immutable
class ProfileHouseOwnerScreen extends StatefulWidget {
  @override
  _ProfileHouseOwnerScreenState createState() => _ProfileHouseOwnerScreenState();

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

class _ProfileHouseOwnerScreenState extends State<ProfileHouseOwnerScreen> {

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

  String _decryptPassword(String encryptedPassword) {
    final key = encrypt.Key.fromLength(32); // AES-256 requires a 32-byte key
    final iv = encrypt.IV.fromLength(16); // AES uses a 16-byte IV

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt(encrypt.Encrypted.fromBase64(encryptedPassword), iv: iv);

    return decrypted;
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
                  Navigator.pushNamed(context, AppRoutes.loginHouseOwnerScreen);
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

  Widget buildOwner (House_Owner owner, String currentUserId, String decryptedPassword) =>
      Container(
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
                                      "Account",
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
                                                      final docOwner = FirebaseFirestore.instance.collection('house_owner').doc(owner.owner_id);
                                                      // Add your delete logic here
                                                      docOwner.delete();

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
                                      owner.owner_name,
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
                                    owner.owner_address,
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
                                      owner.owner_email,
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
                                      owner.owner_phone,
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
                                      obscureText(decryptedPassword),
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
                                      Icons.account_balance_outlined,
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
                                      owner.owner_accountBank,
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
                                    Icons.account_balance_wallet_outlined,
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
                                    owner.owner_accountNo,
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
                                    Icons.account_box_outlined,
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
                                      owner.owner_accountHolder,
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
              padding: getPadding(left: 45, top: 5, right: 45, bottom: 15),
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
                                    onTapHomeicon(context);
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
                                onTap: () {onTapButton(context);},
                                child:Padding(
                                    padding: getPadding(top: 15),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              svgPath: ImageConstant.imgComputer,
                                              height: getSize(25),
                                              width: getSize(25)),
                                          Padding(
                                              padding: getPadding(top: 2),
                                              child: Text(
                                                  "Property",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle.txtHindMedium12))
                                        ]
                                    )
                                )
                            ),
                            GestureDetector(
                                onTap: () {onTapExploreicon(context);},
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
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.loginHouseOwnerScreen); }
  onTapCancelDeleted(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileHouseOwnerScreen); }
onTapEditProfile(BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileEditOwnerScreen); }
onTapNotification(BuildContext context) { Navigator.pushNamed(context, AppRoutes.notificationOwnerScreen); }
 onTapHomeicon(BuildContext context) {
   Navigator.pushNamed(context, AppRoutes.homeHouseOwnerScreen); }
 onTapExploreicon(BuildContext context) {
   Navigator.pushNamed(context, AppRoutes.scheduledRequestedScreen); }
 onTapButton(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.addHouseRentalScreen); }
 onTapProfile(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileHouseOwnerScreen); }
 }
