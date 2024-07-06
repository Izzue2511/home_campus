//import '../details_house_rental_screen/widgets/slidershadow2_item_widget.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
// import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
// import 'package:homecampus/routes/app_routes.dart';

// ignore_for_file: must_be_immutable
class DetailsHouseRentalScreen extends StatefulWidget {

 @override
 _DetailsHouseRentalScreenState createState() =>
     _DetailsHouseRentalScreenState();

}

class Rental_Property{
  String property_id;
  String owner_id;
  final String property_image;
  final String property_name;
  final String property_description;
  final String property_address;
  final String property_bedroom;
  final String property_bathroom;
  final int property_price;
  final bool air_conditioner;
  final bool washing_machine;
  final bool fridge;
  final bool gas_stove;
  final bool wifi;
  final bool kettle;
  final bool rice_cooker;
  final bool clothes_hanger;
  final bool study_table;
  final bool dining_table;
  final bool locker;
  final bool property_availability;

  Rental_Property({
    this.property_id = '',
    required this.owner_id,
    required this.property_image,
    required this.property_name,
    required this.property_description,
    required this.property_address,
    required this.property_bedroom,
    required this.property_bathroom,
    required this.property_price,
    required this.air_conditioner,
    required this.washing_machine,
    required this.fridge,
    required this.gas_stove,
    required this.wifi,
    required this.kettle,
    required this.rice_cooker,
    required this.clothes_hanger,
    required this.study_table,
    required this.dining_table,
    required this.locker,
    required this.property_availability,
  });

  Map<String, dynamic> toJson() => {
    'property_id': property_id,
    'owner_id': owner_id,
    'property_image': property_image,
    'property_name': property_name,
    'property_description': property_description,
    'property_address': property_address,
    'property_bedroom': property_bedroom,
    'property_bathroom': property_bathroom,
    'property_price': property_price,
    'air_conditioner': air_conditioner,
    'washing_machine': washing_machine,
    'fridge': fridge,
    'gas_stove': gas_stove,
    'wifi': wifi,
    'kettle': kettle,
    'rice_cooker': rice_cooker,
    'clothes_hanger': clothes_hanger,
    'study_table': study_table,
    'dining_table': dining_table,
    'locker': locker,
    'property_availability': property_availability,
  };

  static Rental_Property fromJson(Map<String, dynamic> json) => Rental_Property(
      property_id: json['property_id'],
      owner_id: json['owner_id'],
      property_image: json['property_image'],
      property_name: json['property_name'],
      property_description: json['property_description'],
      property_address: json['property_address'],
      property_bedroom: json['property_bedroom'],
      property_bathroom: json['property_bathroom'],
      property_price: json['property_price'],
      air_conditioner: json['air_conditioner'],
      washing_machine: json['washing_machine'],
      fridge: json['fridge'],
      gas_stove: json['gas_stove'],
      wifi: json['wifi'],
      kettle: json['kettle'],
      rice_cooker: json['rice_cooker'],
      clothes_hanger: json['clothes_hanger'],
      study_table: json['study_table'],
      dining_table: json['dining_table'],
      locker: json['locker'],
      property_availability: json['property_availability']
  );
}

class _DetailsHouseRentalScreenState extends State<DetailsHouseRentalScreen> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  //final user = FirebaseAuth.instance.currentUser!;
  User? currentUser;

  @override
  void initState() {
    super.initState();
    inputData();
  }


  void inputData() async {
    //propertyId = Provider.of<UserProvider>(context).propertyId;
    //print('Property ID: $propertyId'); // Add this line to print the propertyId
    final String? propertyIdArg =
    ModalRoute.of(context)?.settings.arguments as String?;
    print('Property ID: $propertyIdArg');
    currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      // final currentUserId = currentUser!.uid;

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

  bool _isAvailable = false;

  int silderIndex = 1;

  void onTapEdit(BuildContext context, String propertyId) {
    print('Selected Property ID: $propertyId');
    Provider.of<UserProvider>(context, listen: false).setPropertyId(propertyId);
    Navigator.pushNamed(context, '/update_house_rental_screen', arguments: propertyId);
  }

Widget buildProperty (Rental_Property property) => Container(
    height: getVerticalSize(1571),
    width: double.maxFinite,
    child: Stack(
        alignment: Alignment.bottomLeft,
        children: [Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
                child: Padding(
                    padding: getPadding(bottom: 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: getVerticalSize(400),
                                  width: getHorizontalSize(369),
                                  child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                                height: getVerticalSize(335),
                                                width: getHorizontalSize(369),
                                                child: Stack(
                                                    alignment: Alignment.bottomCenter,
                                                    children: [
                                                      Container(
                                                        height: getVerticalSize(290),
                                                        width: getHorizontalSize(369),
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(
                                                              getHorizontalSize(20)),
                                                          child: Image.network(
                                                            property.property_image ?? '',
                                                            height: getVerticalSize(235),
                                                            width: getHorizontalSize(340),
                                                            fit: BoxFit.cover,
                                                            errorBuilder: (context, error, stackTrace) {
                                                              return Icon(
                                                                Icons.error_outline,
                                                                size: getHorizontalSize(40),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Padding(
                                                              padding: getPadding(right: 57),
                                                              child: Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [CustomIconButton(
                                                                      height: 37,
                                                                      width: 37,
                                                                      margin: getMargin(left: 15, bottom: 180),
                                                                      onTap: () {onTapBtnIcback(context);},
                                                                      child: CustomImageView(
                                                                          svgPath: ImageConstant.imgIcback)),
                                                                  ]
                                                              )
                                                          )
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(top: 244, left: 250),
                                                        child: Align(
                                                          //alignment: Alignment.center,
                                                          child: Padding(
                                                            padding: getPadding(left: 0, right: 0),
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    //Text('Property Availability Status'),
                                                                    SizedBox(height: 20),
                                                                    Switch(
                                                                      value: _isAvailable,
                                                                      onChanged: (value) {
                                                                        setState(() {
                                                                          _isAvailable = value;

                                                                          final docProperty = FirebaseFirestore.instance.collection('rental_property').doc(property.property_id);

                                                                          docProperty.update({
                                                                            'property_availability': value,
                                                                          }).then((value) {
                                                                            // Update successful
                                                                            print("Property availability sucessfully updated!");
                                                                          }).catchError((error) {
                                                                            // Handle the error
                                                                            print("Failed to update property availability: $error");
                                                                          }
                                                                          );
                                                                        }
                                                                        );
                                                                      },
                                                                      activeColor: Colors.deepPurpleAccent.withOpacity(0.7),
                                                                    ),
                                                                    SizedBox(height: 20),
                                                                    //Text(_isAvailable ? 'Available' : 'Not Available'),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ]
                                                )
                                            )
                                        ),
                                        Align(
                                            alignment: Alignment.bottomLeft,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [Text(
                                                    property.property_name,
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtRalewaySemiBold20),
                                                  Padding(
                                                      padding: getPadding(top: 10),
                                                      child: Text(
                                                          property.property_address,
                                                          overflow: TextOverflow.ellipsis,
                                                          textAlign: TextAlign.left,
                                                          style: TextStyle(
                                                              color: ColorConstant.gray60002,
                                                              fontSize: getFontSize(12),
                                                              fontFamily: 'Raleway',
                                                              fontWeight: FontWeight.w400)))
                                                ]
                                            )
                                        )
                                      ]
                                  )
                              )
                          ),
                          Padding(
                              padding: getPadding(left: 22, top: 6),
                              child: Row(
                                  children: [CustomImageView(
                                      imagePath: ImageConstant.imgGroup2,
                                      height: getSize(19),
                                      width: getSize(19),
                                      margin: getMargin(top: 3, bottom: 2)
                                  ),
                                    Padding(
                                        padding: getPadding(left: 5, top: 2, bottom: 1),
                                        child: Text(
                                            property.property_bedroom,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSFProDisplayRegular16Gray600.copyWith(letterSpacing: getHorizontalSize(0.32))
                                        )
                                    ),
                                    CustomImageView(
                                        svgPath: ImageConstant.imgIcbath,
                                        height: getSize(24),
                                        width: getSize(24),
                                        margin: getMargin(left: 10, top:1)),
                                    Padding(
                                        padding: getPadding(left: 5, top: 2,),
                                        child: Text(
                                            property.property_bathroom,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSFProDisplayRegular16Gray600.copyWith(letterSpacing: getHorizontalSize(0.32))
                                        )
                                    )
                                  ]
                              )
                          ),
                          Padding(
                              padding: getPadding(left: 22, top: 20),
                              child: Text(
                                  "Description",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtRalewayMedium16)),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: getHorizontalSize(368),
                                  margin: getMargin(left: 22, top: 11, right: 23),
                                  child: RichText(
                                      text: TextSpan(
                                          children: [TextSpan(
                                              text: property.property_description,
                                              style: TextStyle(
                                                  color: ColorConstant.gray60002,
                                                  fontSize: getFontSize(12),
                                                  fontFamily: 'Raleway',
                                                  fontWeight: FontWeight.w400)),
                                          ]
                                      ),
                                      textAlign: TextAlign.left)
                              )
                          ),
                          Container(
                              height: getVerticalSize(1130),
                              width: double.maxFinite,
                              margin: getMargin(top: 12),
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: SizedBox(
                                            width: getHorizontalSize(390),
                                            child: Divider(
                                                height: getVerticalSize(1),
                                                thickness: getVerticalSize(1),
                                                color: ColorConstant.blueGray100,
                                                indent: getHorizontalSize(24))
                                        )
                                    ),
                                    Positioned(
                                      top: 20,
                                      left: 25,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Property Facilities",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtRalewaySemiBold20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 50, left: 10), // Adjust the margin value as needed
                                      child: Positioned(
                                        child: SingleChildScrollView(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics: NeverScrollableScrollPhysics(),
                                            itemCount: 11,
                                            itemBuilder: (BuildContext context, int index) {
                                              List<String> iconNames = [
                                                'Air Conditioner',
                                                'Washing Machine',
                                                'Fridge',
                                                'Gas Stove',
                                                'Wi-Fi',
                                                'Kettle',
                                                'Rice Cooker',
                                                'Clothes Hanger',
                                                'Study Table',
                                                'Dining Table',
                                                'Locker',
                                              ];

                                              List<IconData> icons = [
                                                Icons.ac_unit,
                                                Icons.local_laundry_service, // Washing Machine icon
                                                Icons.kitchen,
                                                Icons.local_fire_department,
                                                Icons.wifi,
                                                Icons.heat_pump,
                                                Icons.soup_kitchen,
                                                Icons.balcony, // Clothes Hanger icon (placeholder)
                                                Icons.desk,
                                                Icons.dining,
                                                Icons.lock,
                                              ];

                                              List<bool> displayIcons = [
                                                property.air_conditioner,  // Display Air Conditioner icon and name
                                                property.washing_machine,  // Display Washing Machine icon and name
                                                property.fridge,  // Display Fridge icon and name
                                                property.gas_stove, // Do not display Gas Stove icon and name
                                                property.wifi,  // Display Wi-Fi icon and name
                                                property.kettle, // Do not display Kettle icon and name
                                                property.rice_cooker,  // Display Rice Cooker icon and name
                                                property.clothes_hanger,  // Display Clothes Hanger icon and name
                                                property.study_table, // Do not display Study Table icon and name
                                                property.dining_table,  // Display Dining Table icon and name
                                                property.locker,  // Display Locker icon and name
                                              ];

                                              if (displayIcons[index]) {
                                                return ListTile(
                                                  leading: Icon(
                                                    icons[index],
                                                    color: Colors.deepPurpleAccent.withOpacity(0.8),
                                                  ),
                                                  title: Text(iconNames[index]),
                                                );
                                              } else {
                                                return SizedBox(); // Return an empty SizedBox for icons that should not be displayed
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 680,
                                          //- (displayIcons.where((display) => display).length * 20).toDouble(),
                                      left: 25,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Location",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtRalewaySemiBold20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 610.0,
                                              //- (displayIcons.where((display) => display).length * 40).toDouble(),
                                      ),
                                      child: Align(
                                          child: Container(
                                              height: getVerticalSize(274),
                                              width: getHorizontalSize(368),
                                              child: Stack(
                                                  alignment: Alignment.bottomRight,
                                                  children: [
                                                    CustomImageView(
                                                      imagePath: ImageConstant.imgRectangle,
                                                      height: getVerticalSize(274),
                                                      width: getHorizontalSize(368),
                                                      alignment: Alignment.center),
                                                    Align(
                                                        alignment: Alignment.bottomRight,
                                                        child: Padding(
                                                            padding: getPadding(right: 11, bottom: 8),
                                                            child: Column(
                                                                mainAxisSize: MainAxisSize.min,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [CustomImageView(
                                                                    imagePath: ImageConstant.imgLocation30x30,
                                                                    height: getSize(30),
                                                                    width: getSize(30)),
                                                                  CustomImageView(
                                                                      svgPath: ImageConstant.imgVolumeIndigoA100,
                                                                      height: getSize(28),
                                                                      width: getSize(28),
                                                                      alignment: Alignment.centerRight,
                                                                      margin: getMargin(top: 110))
                                                                ]
                                                            )
                                                        )
                                                    )
                                                  ]
                                              )
                                          )
                                      ),
                                    ),
                                    Align(
                                        //alignment: Alignment.bottomCenter,
                                        child: Container(
                                            width: double.maxFinite,
                                            margin: getMargin(
                                                top: 1035,
                                                    //- (displayIcons.where((display) => display).length * 120).toDouble(),
                                            ),
                                            padding: getPadding(left: 22, top: 18, right: 22, bottom: 18),
                                            decoration: AppDecoration.fillWhiteA700,
                                            child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: getPadding(left: 7, top: 18, bottom: 16),
                                                    child: RichText(
                                                        text: TextSpan(
                                                            children: [TextSpan(
                                                                text: "RM" + property.property_price.toString(),
                                                                style: TextStyle(
                                                                    color: ColorConstant.gray90001,
                                                                    fontSize: getFontSize(18),
                                                                    fontFamily: 'SF Pro Display',
                                                                    fontWeight: FontWeight.w600,
                                                                    letterSpacing: getHorizontalSize(0.23))),
                                                              TextSpan(
                                                                  text: " /monthly",
                                                                  style: TextStyle(
                                                                      color: ColorConstant.gray600,
                                                                      fontSize: getFontSize(16),
                                                                      fontFamily: 'SF Pro Display',
                                                                      fontWeight: FontWeight.w400,
                                                                      letterSpacing: getHorizontalSize(0.23))
                                                              )
                                                            ]
                                                        ),
                                                        textAlign: TextAlign.left)
                                                  ),
                                                  Container(
                                                    width: 45,
                                                    height: 45,
                                                    margin: getMargin(left: 90),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.red.withOpacity(0.7),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.4),
                                                          spreadRadius: 1,
                                                          blurRadius: 5,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ],
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext context) {
                                                            return AlertDialog(
                                                              title: Text('Confirmation'),
                                                              content: Text('Are you sure you want to delete?'),
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
                                                                    final docProperty = FirebaseFirestore.instance.collection('rental_property').doc(property.property_id);
                                                                    // Add your delete logic here
                                                                    docProperty.delete();

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
                                                  Container(
                                                    width: 45,
                                                    height: 45,
                                                    margin: getMargin(right: 10),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.deepPurpleAccent.withOpacity(0.7),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.4),
                                                          spreadRadius: 1,
                                                          blurRadius: 5,
                                                          offset: Offset(0, 3),
                                                        ),
                                                      ],
                                                    ),
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.edit_outlined,
                                                        color: Colors.white,
                                                      ),
                                                      onPressed: () {
                                                          final propertyId = property.property_id;
                                                          onTapEdit(context, propertyId);
                                                      },
                                                    ),
                                                  ),
                                                ]
                                            )
                                        )
                                    )
                                  ]
                              )
                          )
                        ]
                    )
                )
            )
        ),
        ]
    )
);

  Future<Rental_Property?> readProperty(String propertyId) async {
    if (propertyId == null) {
      print('Property ID is null');
      return null;
    }

    final docProperty =
    FirebaseFirestore.instance.collection('rental_property').doc(propertyId);
    final snapshot = await docProperty.get();

    if (snapshot.exists) {
      final rentalProperty = Rental_Property.fromJson(snapshot.data()!);
      print('Found rental property: $rentalProperty');
      return rentalProperty;
    } else {
      print('Rental property not found for property ID: $propertyId');
      return null;
    }
  }

  @override
Widget build(
    BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
  final currentUserId = userProvider.currentUserId;
  print('Current UserID: $currentUserId');

  final String? propertyIdArg =
  ModalRoute.of(context)?.settings.arguments as String?;
  print('Property ID: $propertyIdArg');

 return SafeArea(
     child: Scaffold(
         body: FutureBuilder<Rental_Property?>(
           future: readProperty(propertyIdArg!), // Pass propertyIdArg as an argument
           builder: (context, snapshot) {
             if (snapshot.hasError) {
               return Text('Something went wrong! ${snapshot.error}');
             } else if (snapshot.connectionState == ConnectionState.waiting) {
               return Center(child: CircularProgressIndicator());
             } else if (snapshot.hasData) {
               final property = snapshot.data!;
               return buildProperty(property);
             } else {
               return Center(child: Text('No Rental Property'));
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

onTapBtnIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeHouseOwnerScreen); } 
onTapreviews(BuildContext context) { Navigator.pushNamed(context, AppRoutes.reviewScreenOwnerScreen); }
  onTapConfirmDeleted(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeHouseOwnerScreen); }
  onTapCancelDeleted(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.detailsHouseRentalScreen); }
onTapHomeicon(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.homeHouseOwnerScreen); }
onTapExploreicon(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.scheduledRequestedScreen); }
onTapButton(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.addHouseRentalScreen); }
onTapProfile(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileHouseOwnerScreen); }
}
