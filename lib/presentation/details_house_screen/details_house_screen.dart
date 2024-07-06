
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
// import 'package:homecampus/routes/app_routes.dart';
// ignore_for_file: must_be_immutable

class DetailsHouseScreen extends StatefulWidget {
 @override
 _DetailsHouseScreenState createState() => _DetailsHouseScreenState();

}

class House_Owner{
 String owner_id;
 final String owner_name;
 final String owner_address;
 final String owner_email;
 final String owner_phone;
 final String owner_password;
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

 House_Owner.fromJson(Map<String, dynamic> json)
     : owner_id = json['owner_id'],
      owner_name = json['owner_name'],
      owner_address = json['owner_address'],
      owner_email = json['owner_email'],
      owner_phone = json['owner_phone'],
      owner_password = json['owner_password'],
      owner_image = json['owner_image'],
      owner_accountBank = json['owner_accountBank'],
      owner_accountNo = json['owner_accountNo'],
      owner_accountHolder = json['owner_accountHolder'];

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

class _DetailsHouseScreenState extends State<DetailsHouseScreen> {

 int silderIndex = 1;

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
   final currentUserId = currentUser!.uid;

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

 void _launchWhatsApp() async {
  String phoneNumber = "0183964057"; // Replace with your specific number

  String url = "https://wa.me/$phoneNumber";

  if (await canLaunch(url)) {
   await launch(url);
  } else {
   throw 'Could not launch WhatsApp';
  }
 }

 void onTapBook(BuildContext context, String propertyId) {
  print('Selected Property ID: $propertyId');
  Provider.of<UserProvider>(context, listen: false).setPropertyId(propertyId);
  Navigator.pushNamed(context, '/schedule_visit_screen', arguments: propertyId);
 }

 bool favourite = true;

 Widget buildProperty (Rental_Property property, House_Owner owner) => Container(
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
                                                                children: [
                                                                 CustomIconButton(
                                                                    height: 37,
                                                                    width: 37,
                                                                    margin: getMargin(left: 15, bottom: 180),
                                                                    onTap: () {
                                                                     onTapBack(context);},
                                                                    child: CustomImageView(
                                                                        svgPath: ImageConstant.imgIcback)),
                                                                ]
                                                            )
                                                        )
                                                    ),
                                                    Align(
                                                     alignment: Alignment.center,
                                                     child: Padding(
                                                      padding: getPadding(left: 8, right: 11),
                                                      child: Column(
                                                       mainAxisSize: MainAxisSize.min,
                                                       crossAxisAlignment: CrossAxisAlignment.end,
                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       children: [
                                                        GestureDetector(
                                                         onTap: () {
                                                          setState(() {
                                                           favourite = !favourite;
                                                          });
                                                         },
                                                         child: CustomIconButton(
                                                          height: 35,
                                                          width: 35,
                                                          margin: getMargin(top: 270, left: 305),
                                                          shape: IconButtonShape.CircleBorder12,
                                                          padding: IconButtonPadding.PaddingAll6,
                                                          child: Icon(
                                                           favourite ? Icons.favorite_outline : Icons.favorite, // Swap the icons based on the favourite variable
                                                           color: favourite ? Colors.white : Colors.white, // Set the colors based on the favourite variable
                                                           size: 20,
                                                          ),
                                                         ),
                                                        ),
                                                       ],
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
                                               children: [
                                                Text(
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
                                  children: [
                                   CustomImageView(
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
                                   ),

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
                                          children: [
                                           TextSpan(
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
                              height: getVerticalSize(1200),
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
                                   Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                     width: double.maxFinite,
                                     height: 80,
                                     margin: getMargin(top: 1, left: 25, right: 25),
                                     padding: getPadding(left: 22, top: 18, right: 22, bottom: 18),
                                     //decoration: AppDecoration.fillWhiteA700,
                                     child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                       // Profile Picture and Text
                                       Row(
                                        children: [
                                         CustomImageView(
                                             imagePath: ImageConstant.imgEllipse,
                                             height: getSize(45),
                                             width: getSize(45),
                                             radius: BorderRadius.circular(
                                                 getHorizontalSize(19)),
                                             alignment: Alignment.center),
                                         SizedBox(width: 10),
                                         Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                           Container(
                                            width: getHorizontalSize(159),
                                            margin: getMargin(top: 0),
                                             child: Text(
                                              owner.owner_name,
                                              style: TextStyle(
                                              fontFamily: 'SFProDisplay',
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                             ),
                                              maxLines: null,
                                             ),
                                           ),
                                           Text(
                                            'House Owner',
                                            style: TextStyle(
                                             fontFamily: 'SFProDisplay',
                                             fontSize: 12,
                                             color: Colors.grey[600],
                                             fontWeight: FontWeight.normal,
                                            ),
                                           ),
                                          ],
                                         ),
                                        ],
                                       ),
                                       // Chat Icon and Call Phone Button
                                       Container(
                                        width: getHorizontalSize(106),
                                        margin: getMargin(top: 0),
                                        child: Row(
                                         children: [
                                          Container(
                                           width: 45,
                                           height: 45,
                                           decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
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
                                             Icons.chat,
                                             color: Colors.deepPurpleAccent.withOpacity(0.8),
                                            ),
                                            onPressed: () {
                                             // Add your chat button logic here
                                             _launchWhatsApp();
                                            },
                                           ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                           width: 45,
                                           height: 45,
                                           decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
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
                                             Icons.phone,
                                             color: Colors.deepPurpleAccent.withOpacity(0.8),
                                            ),
                                            onPressed: () {
                                             // Add your phone button logic here
                                            },
                                           ),
                                          ),
                                         ],
                                        ),
                                       ),
                                      ],
                                     ),
                                    ),
                                   ),
                                   Positioned(
                                    top: 90,
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
                                    margin: EdgeInsets.only(top: 120, left: 10), // Adjust the margin value as needed
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
                                   Align(
                                    //alignment: Alignment.bottomCenter,
                                       child: Container(
                                           width: double.maxFinite,
                                           margin: getMargin(
                                            top: 1105,
                                            //- (displayIcons.where((display) => display).length * 120).toDouble(),
                                           ),
                                           padding: getPadding(left: 22, top: 18, right: 22, bottom: 18),
                                           decoration: AppDecoration.fillWhiteA700,
                                           child: Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                               children: [Padding(
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
                                                       textAlign: TextAlign.left)),
                                                Container(
                                                    height: getVerticalSize(53),
                                                    width: getHorizontalSize(169),
                                                    margin: getMargin(top: 5),
                                                    child: Stack(
                                                        alignment: Alignment.topLeft,
                                                        children: [
                                                         CustomButton(
                                                             height: getVerticalSize(50),
                                                             width: getHorizontalSize(155),
                                                             text: "Book Property",
                                                             variant: ButtonVariant.OutlineBlack9003f_1,
                                                             shape: ButtonShape.RoundedBorder20,
                                                             padding: ButtonPadding.PaddingT14,
                                                             fontStyle: ButtonFontStyle.InterMedium18,
                                                             suffixWidget: Container(
                                                                 margin: getMargin(right: 15),
                                                             ),
                                                             onTap: () {
                                                              final propertyId = property.property_id;
                                                              onTapBook(context, propertyId);
                                                             },
                                                             alignment: Alignment.topRight)
                                                        ]
                                                    )
                                                )
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

 Future<Map<String, dynamic>?> readPropertyAndOwner(String propertyId) async {
  if (propertyId == null) {
   print('Property ID is null');
   return null;
  }

  final docProperty =
  FirebaseFirestore.instance.collection('rental_property').doc(propertyId);
  final snapshot = await docProperty.get();

  if (snapshot.exists) {
   final rentalProperty = Rental_Property.fromJson(snapshot.data()!);

   final docOwner =
   FirebaseFirestore.instance.collection('house_owner').doc(rentalProperty.owner_id);
   final ownerSnapshot = await docOwner.get();

   if (ownerSnapshot.exists) {
    final ownerData = ownerSnapshot.data()!;
    final owner = House_Owner.fromJson(ownerData);
    return {'property': rentalProperty, 'owner': owner};
   } else {
    print('Owner not found for property ID: ${rentalProperty.owner_id}');
    return null;
   }
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
          body: FutureBuilder<Map<String, dynamic>?>(
           future: readPropertyAndOwner(propertyIdArg!), // Pass propertyIdArg as an argument
           builder: (context, snapshot) {
            if (snapshot.hasError) {
             return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
             return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
             final data = snapshot.data!;
             final property = data['property'] as Rental_Property;
             final owner = data['owner'] as House_Owner;
             return buildProperty(property, owner);
            } else {
             return Center(child: Text('No Rental Property'));
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

 onTapBack(BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeStudentScreen); }
 onTapHome(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeStudentScreen); }
 onTapSchedule(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
 onTapSaved(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.savedPage); }
 onTapProfile(
     BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileStudentScreen); }
}
