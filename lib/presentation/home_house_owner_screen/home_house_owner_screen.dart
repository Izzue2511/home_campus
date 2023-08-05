import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_drop_down.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
import 'package:homecampus/routes/app_routes.dart';
import 'package:homecampus/core/app_export.dart';
// ignore_for_file: must_be_immutable

class HomeHouseOwnerScreen extends StatefulWidget {
  @override
  _HomeHouseOwnerScreenState createState() => _HomeHouseOwnerScreenState();

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

class _HomeHouseOwnerScreenState extends State<HomeHouseOwnerScreen> {

  TextEditingController searchController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  //final user = FirebaseAuth.instance.currentUser!;
  User? currentUser;
  String? propertyId; // Remove the existing declaration

  @override
  void initState() {
    super.initState();
    inputData();
    searchController.addListener(onSearchTextChanged);
  }

  void onSearchTextChanged() {
    setState(() {});
  }

  List<Rental_Property> filterProperties(List<Rental_Property> properties, String keyword) {
    return properties.where((property) {
      // Perform filtering based on multiple criteria
      bool nameMatch = property.property_name.toLowerCase().contains(keyword.toLowerCase());
      bool locationMatch = property.property_address.toLowerCase().contains(keyword.toLowerCase());
      bool priceMatch = property.property_price.toString().contains(keyword.toLowerCase());
      bool bedroomMatch = property.property_bedroom.toLowerCase().contains(keyword.toLowerCase());
      bool bathroomMatch = property.property_bathroom.toLowerCase().contains(keyword.toLowerCase());

      // Return true if any of the filtering criteria match
      return nameMatch || locationMatch || priceMatch || bedroomMatch || bathroomMatch;
    }).toList();
  }

  void inputData() async {
    propertyId = Provider.of<UserProvider>(context).propertyId;
    print('Property ID: $propertyId'); // Add this line to print the propertyId
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

// Function to check if the user is authenticated
  bool isUserAuthenticated() {
    return auth.currentUser != null;
  }

  void onTapPropertyDetails(BuildContext context, String propertyId) {
    print('Selected Property ID: $propertyId');
    Provider.of<UserProvider>(context, listen: false).setPropertyId(propertyId);
    Navigator.pushNamed(context, '/details_house_rental_screen', arguments: propertyId);
  }

  Widget buildProperty (Rental_Property property) => Container(
      margin: getMargin(left: 25, top: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFABABAB), // Adjust the shadow color as per your design
            offset: Offset(4, 4),
            blurRadius: 6,
            spreadRadius: -2,
          ),
          BoxShadow(
            color: Colors.white, // Adjust the highlight color as per your design
            offset: Offset(-4, -4),
            blurRadius: 6,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Container(
              width: double.maxFinite,
              child: GestureDetector(

                  // Code where you are navigating to DetailsHouseRentalScreen
                  onTap: () {
                    final propertyId = property.property_id;
                    onTapPropertyDetails(context, propertyId);
                  },

                  child: Container(
                      padding: getPadding(left: 12, top: 11, right: 12, bottom: 11),
                      decoration: AppDecoration.fillWhiteA700.copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Container(
                              height: getVerticalSize(235),
                              width: getHorizontalSize(340),
                              child: Stack(
                                  alignment: Alignment.topCenter,
                                  children: [CustomImageView(
                                      imagePath: 'assets/images/house_1.jpg',
                                      height: getVerticalSize(235),
                                      width: getHorizontalSize(340),
                                      radius: BorderRadius.circular(
                                          getHorizontalSize(20)),
                                      alignment: Alignment.center),
                                  ]
                              )
                          ),
                            Padding(
                                padding: getPadding(top: 8, right: 1),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [Padding(
                                        padding: getPadding(top: 2, bottom: 3),
                                        child: Text(
                                            property.property_name,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtRalewayMedium16)),
                                      Container(
                                          padding: getPadding(left: 8, top: 4, right: 8, bottom: 4),
                                          decoration: AppDecoration.fillIndigoA100af.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [Text(
                                                "RM" + property.property_price.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.left,
                                                style: AppStyle.txtMontserratSemiBold12.copyWith(letterSpacing: getHorizontalSize(0.36)),
                                              ),

                                                Padding(
                                                    padding: getPadding(top: 6, bottom: 1),
                                                    child: Text(
                                                        "/mo",
                                                        overflow: TextOverflow.ellipsis,
                                                        textAlign: TextAlign.left,
                                                        style: AppStyle.txtMontserratSemiBold12.copyWith(letterSpacing: getHorizontalSize(0.36)))
                                                )
                                              ]
                                          )
                                      )
                                    ]
                                )
                            ),
                            Padding(
                                padding: getPadding(top: 3, bottom: 3),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomImageView(
                                        svgPath: ImageConstant.imgLocation,
                                        height: getSize(15),
                                        width: getSize(15),
                                        margin: getMargin(bottom: 5)),
                                      Padding(
                                          padding: getPadding(left: 3, bottom: 3),
                                          child: Text(
                                              "Merlimau, Melaka",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtPoppinsMedium12)),
                                      CustomImageView(
                                          imagePath: ImageConstant.imgGroup2,
                                          height: getSize(14),
                                          width: getSize(14),
                                          margin: getMargin(left: 140, top: 7, bottom: 3)),
                                      Padding(
                                          padding: getPadding(left: 6, top: 6, bottom: 2),
                                          child: Text(
                                              property.property_bedroom,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtSFProDisplayRegular13IndigoA100.copyWith(letterSpacing: getHorizontalSize(0.13),                                                                  )
                                          )
                                      ),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgIcbath,
                                          height: getSize(20),
                                          width: getSize(20),
                                          margin: getMargin(left: 6,bottom: 1)),
                                      Padding(
                                          padding: getPadding(left: 6, top: 6, bottom: 1),
                                          child: Text(
                                            property.property_bathroom,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtSFProDisplayRegular13IndigoA100.copyWith(letterSpacing: getHorizontalSize(0.13)),
                                          )
                                      ),
                                    ]
                                )
                            )
                          ]
                      )
                  )
              )
          )
          ]
      )
  );

  Stream<List<Rental_Property>> readProperty(String ownerId) =>
      FirebaseFirestore.instance
          .collection('rental_property')
          .where('owner_id', isEqualTo: ownerId) // Add a filter based on the owner_id
          .snapshots()
          .map((snapshot) =>
          snapshot.docs.map((doc) => Rental_Property.fromJson(doc.data())).toList());


  @override
Widget build(
    BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final currentUserId = userProvider.currentUserId;
    print('Current UserID: $currentUserId');

    return SafeArea(
    child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        body:

        SizedBox(
            width: size.width,
            child: SingleChildScrollView(
                child: Padding(
                    padding: getPadding(bottom: 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: getVerticalSize(148),
                            width: double.maxFinite,
                            padding: getPadding(left: 33, right: 33),
                            decoration: AppDecoration.gradientIndigoA100IndigoA100,
                            child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                 Align(
                                     alignment: Alignment.topRight,
                                     child: Container(
                                         height: getSize(45),
                                         width: getSize(45),
                                         margin: getMargin(top: 22),
                                         child: Stack(
                                             alignment: Alignment.center,
                                             children: [CustomImageView(
                                                 svgPath: ImageConstant.imgButtonnotification,
                                                 height: getSize(45),
                                                 width: getSize(45),
                                                 alignment: Alignment.center),
                                              CustomImageView(
                                                  imagePath: ImageConstant.imgEllipse,
                                                  height: getSize(39),
                                                  width: getSize(39),
                                                  radius: BorderRadius.circular(
                                                      getHorizontalSize(19)),
                                                  alignment: Alignment.center)]))),
                                 Align(
                                     alignment: Alignment.bottomLeft,
                                     child: Container(
                                         height: getVerticalSize(44),
                                         width: getHorizontalSize(291),
                                         margin: getMargin(left: 3, bottom: 21),
                                         child: Stack(
                                             alignment: Alignment.center,
                                             children: [
                                               CustomImageView(
                                                 svgPath: ImageConstant.imgShapeGray10001,
                                                 height: getVerticalSize(44),
                                                 width: getHorizontalSize(291),
                                                 alignment: Alignment.center),
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        CustomImageView(
                                                          svgPath: ImageConstant.imgSearchIndigo100,
                                                          height: getSize(11),
                                                          width: getSize(11),
                                                          margin: getMargin(top: 12, bottom: 12, left: 10, right: 10),
                                                          //onTap: () {onTapImgSearch(context);}
                                                        ),
                                                        Expanded(
                                                          child: TextField(
                                                            controller: searchController,
                                                            decoration: InputDecoration(
                                                              hintText: "Search House, Apartment, etc",
                                                              border: InputBorder.none,
                                                            ),
                                                            style: AppStyle.txtRalewayRegular12Indigo200.copyWith(
                                                              letterSpacing: getHorizontalSize(0.36)),
                                                            // Add any additional properties or controllers for the text field if needed.
                                                          ),
                                                        ),
                                                       Padding(
                                                           padding: getPadding(left: 21),
                                                           child: SizedBox(
                                                               height: getVerticalSize(36),
                                                               child: VerticalDivider(
                                                                   width: getHorizontalSize(1),
                                                                   thickness: getVerticalSize(1),
                                                                   color: ColorConstant.indigo2006c,
                                                               )
                                                           )
                                                       ),
                                                       CustomImageView(
                                                           svgPath: ImageConstant.imgUpload,
                                                           height: getSize(20),
                                                           width: getSize(20),
                                                           margin: getMargin(left: 10, top: 8, bottom: 8, right: 10,)
                                                       )
                                                      ]
                                                  )
                                              )
                                             ]
                                         )
                                     )
                                 ),
                                 CustomImageView(
                                     svgPath: ImageConstant.imgFilterbuttonWhiteA700,
                                     height: getVerticalSize(44),
                                     width: getHorizontalSize(44),
                                     alignment: Alignment.topRight,
                                     margin: getMargin(left: 14, top: 83, bottom: 8)
                                 ),
                                  CustomDropDown(
                                    width: getHorizontalSize(140),
                                    focusNode: FocusNode(),
                                    autofocus: true,
                                    icon: Container(
                                      margin: getMargin(left: 0, right: 20),
                                      child: Text(
                                        "Merlimau, Melaka",
                                      ),
                                    ),
                                    margin: getMargin(left: 3, top: 18),
                                    padding: DropDownPadding.PaddingT19,
                                    fontStyle: DropDownFontStyle.RalewayMedium10,
                                    alignment: Alignment.topLeft,
                                    prefix: Container(
                                        margin: getMargin(left: 16, top: 14, right: 8, bottom: 17),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgLocationIndigoA100)
                                    ),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(50)),
                                  )
                                ]
                            )
                        ),
                         Align(
                             alignment: Alignment.centerLeft,
                             child: Padding(
                                 padding: getPadding(left: 37, top: 12),
                                 child: Text(
                                     "My Rental Property",
                                     overflow: TextOverflow.ellipsis,
                                     textAlign: TextAlign.left,
                                     style: AppStyle.txtPoppinsSemiBold24)
                             )
                         ),
                          StreamBuilder<List<Rental_Property>>(
                            stream: readProperty(currentUserId),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Text('Something went wrong! ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                final rentalPropertyList = snapshot.data!;
                                final filteredList = filterProperties(rentalPropertyList, searchController.text);
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: filteredList.length,
                                  itemBuilder: (context, index) {
                                    final rentalProperty = filteredList[index];
                                    return buildProperty(rentalProperty); // Replace with your implementation of buildProperty
                                  },
                                );
                              } else {
                                return Text('No data available');
                              }
                            },
                          ),
                        ]
                    )
                )
            )
        ),

        bottomNavigationBar: Container(
            margin: getMargin(left: 45, right: 45, bottom: 15),
            padding: getPadding(top: 5),
            decoration: AppDecoration.fillWhiteA700,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Container(
                    decoration: AppDecoration.fillWhiteA700,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,

                        children: [
                          Padding(
                            padding: getPadding(top: 15),
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
                                     children: [
                                       CustomImageView(
                                         svgPath: ImageConstant.imgCalendar10,
                                         height: getSize(25),
                                         width: getSize(25)),
                                      Padding(
                                          padding: getPadding(top: 2),
                                          child: Text(
                                              "Booking",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtHindMedium12)
                                      )
                                     ]
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
                                 children: [
                                   CustomImageView(
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
        //bottom navigator
    )
);
}

onTapImgSearch(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.searchScreenOwnerScreen); }
onTapExploreicon(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledRequestedScreen); }
onTapButton(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.addHouseRentalScreen); }
onTapProfile(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileHouseOwnerScreen); }
 }
