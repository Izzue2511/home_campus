import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/app_bar/appbar_iconbutton.dart';
import 'package:homecampus/widgets/app_bar/appbar_subtitle.dart';
import 'package:homecampus/widgets/app_bar/custom_app_bar.dart';
// import 'package:homecampus/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
// import 'package:homecampus/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
// ignore_for_file: must_be_immutable

class ScheduleVisitDetailsStudentScreen extends StatefulWidget {
  @override
  _ScheduleVisitDetailsStudentScreenState createState() => _ScheduleVisitDetailsStudentScreenState();

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

class Booking_Property{
  String booking_id;
  String tenant_id;
  String property_id;
  String owner_id;
  final String booking_price;
  final String booking_receipt;
  final String booking_date;
  final String booking_status;

  Booking_Property({
    this.booking_id = '',
    required this.tenant_id,
    required this.property_id,
    required this.owner_id,
    required this.booking_price,
    required this.booking_receipt,
    required this.booking_date,
    required this.booking_status,
  });

  Map<String, dynamic> toJson() => {
    'booking_id': booking_id,
    'tenant_id': tenant_id,
    'property_id': property_id,
    'owner_id': owner_id,
    'booking_price': booking_price,
    'booking_receipt': booking_receipt,
    'booking_date': booking_date,
    'booking_status': booking_status,
  };

  static Booking_Property fromJson(Map<String, dynamic> json) => Booking_Property(
    booking_id: json['booking_id'],
    tenant_id: json['tenant_id'],
    property_id: json['property_id'],
    owner_id: json['owner_id'],
    booking_price: json['booking_price'],
    booking_receipt: json['booking_receipt'],
    booking_date: json['booking_date'],
    booking_status: json['booking_status'],
  );
}

class _ScheduleVisitDetailsStudentScreenState extends State<ScheduleVisitDetailsStudentScreen> {

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
    final String? bookingIdArg =
    ModalRoute.of(context)?.settings.arguments as String?;
    print('Booking ID: $bookingIdArg');
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


  bool isFileUploaded = false;

  String getFileName(Booking_Property booking) {
    if (booking.booking_receipt != null) {
      Uri uri = Uri.parse(booking.booking_receipt!);
      String decodedPath = Uri.decodeFull(uri.path);
      List<String> pathSegments = decodedPath.split('/');
      String fileName = pathSegments.last;
      return fileName;
    } else {
      return 'No file picked';
    }
  }

  String getFileSize(Booking_Property booking) {
    if (booking.booking_receipt != null) {
      int sizeInBytes = File(booking.booking_receipt!).lengthSync();
      double sizeInKB = sizeInBytes / 1024;
      return sizeInKB.toStringAsFixed(2) + ' KB';
    } else {
      return '';
    }
  }

  File? file;
  String? filePath;
  String? downloadURL;

  Future<void> _downloadPDF(Booking_Property booking) async {
    try {
      if (booking.booking_receipt != null) {
        await launch(booking.booking_receipt!);
      } else {
        print('Booking receipt is not available');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

Widget buildBooking (Booking_Property booking, Rental_Property property) => Container(
    height: getVerticalSize(850),
    width: double.maxFinite,
    child: Stack(
        alignment: Alignment.center,
        children: [CustomImageView(
            imagePath: ImageConstant.imgBg,
            height: getVerticalSize(829),
            width: getHorizontalSize(414),
            alignment: Alignment.center),
          Align(
              alignment: Alignment.center,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomAppBar(
                        height: getVerticalSize(72),
                        leadingWidth: 76,
                        leading: AppbarIconbutton(
                            svgPath: ImageConstant.imgIcback,
                            margin: getMargin(left: 39),
                            onTap: () {onTapIcback3(context);}),
                        centerTitle: true,
                        title: AppbarSubtitle(
                            text: "Booking Property")
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            padding: getPadding(top: 15),
                            child: Container(
                                margin: getMargin(bottom: 40),
                                padding: getPadding(left: 40, right: 40),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: getMargin(right: 0),
                                          padding: getPadding(top: 20, bottom: 10),
                                          decoration: AppDecoration.outlineGray40066.copyWith(borderRadius: BorderRadiusStyle.circleBorder21),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  height: getVerticalSize(130),
                                                  width: getHorizontalSize(139),
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(
                                                        getHorizontalSize(20)),
                                                    child: Image.network(
                                                      property.property_image ?? '',
                                                      height: getVerticalSize(130),
                                                      width: getHorizontalSize(130),
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
                                                Padding(
                                                    padding: getPadding(bottom: 5),
                                                    child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                              width: getHorizontalSize(158),
                                                              margin: getMargin(top: 4),
                                                              child: Text(
                                                                  property.property_name,
                                                                  maxLines: null,
                                                                  textAlign: TextAlign.left,
                                                                  style: AppStyle.txtHindRegular16)
                                                          ),
                                                          Text(
                                                              "Merlimau, Melaka",
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.left,
                                                              style: AppStyle.txtHindRegular13.copyWith(letterSpacing: getHorizontalSize(0.13))
                                                          ),
                                                          Padding(
                                                              padding: getPadding(top: 5),
                                                              child: RichText(
                                                                  text: TextSpan(
                                                                      children: [TextSpan(
                                                                          text: "RM" + property.property_price.toString(),
                                                                          style: TextStyle(
                                                                              color: ColorConstant.gray90001,
                                                                              fontSize: getFontSize(18),
                                                                              fontFamily: 'Hind',
                                                                              fontWeight: FontWeight.w700,
                                                                              letterSpacing: getHorizontalSize(0.12))),
                                                                        TextSpan(
                                                                            text: " /month",
                                                                            style: TextStyle(
                                                                                color: ColorConstant.gray600,
                                                                                fontSize: getFontSize(12),
                                                                                fontFamily: 'Hind',
                                                                                fontWeight: FontWeight.w400,
                                                                                letterSpacing: getHorizontalSize(0.12)))]),
                                                                  textAlign: TextAlign.left)
                                                          ),
                                                          Padding(
                                                              padding: getPadding(top: 5, left: 0, bottom: 5),
                                                              child: Row(
                                                                  children: [
                                                                    CustomImageView(
                                                                        svgPath: ImageConstant.imgCalendar10,
                                                                        height: getSize(15),
                                                                        width: getSize(15),
                                                                        margin: getMargin(top: 0, bottom: 0,left: 0)
                                                                    ),
                                                                    Padding(
                                                                        padding: getPadding(left: 5, top: 0),
                                                                        child: Text(
                                                                            booking.booking_date,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtPoppinsRegular12Bluegray30002)
                                                                    ),
                                                                  ]
                                                              )
                                                          ),
                                                        ]
                                                    )
                                                )
                                              ]
                                          )
                                      ),
                                      Padding(
                                          padding: getPadding(top: 25),
                                          child: Text(
                                              "Booking Details",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtRubikMedium16)
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20,left: 0),
                                        child: Text(
                                          'Booking Price:',
                                          style: TextStyle(
                                            fontFamily: 'Hind',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10,left: 0),
                                        child: Text(
                                          "RM" + booking.booking_price.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Hind',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20,left: 0),
                                        child: Text(
                                          'Booking Date:',
                                          style: TextStyle(
                                            fontFamily: 'Hind',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10,left: 0),
                                        child: Text(
                                          booking.booking_date,
                                          style: TextStyle(
                                            fontFamily: 'Hind',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20,left: 0),
                                        child: Text(
                                          'Booking Status:',
                                          style: TextStyle(
                                            fontFamily: 'Hind',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10,left: 0),
                                        child: Text(
                                          booking.booking_status,
                                          style: TextStyle(
                                            fontFamily: 'Hind',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 20,left: 0),
                                        child: Text(
                                          'Booking Receipt:',
                                          style: TextStyle(
                                            fontFamily: 'Hind',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10,left: 0),
                                        child: Container(
                                          margin: getMargin(
                                            left: 7,
                                            top: 29,
                                            right: 7,
                                          ),
                                          padding: getPadding(
                                            left: 8,
                                            top: 2,
                                            right: 8,
                                            bottom: 2,
                                          ),
                                          decoration: AppDecoration.fillGray5003.copyWith(
                                            borderRadius:
                                            BorderRadiusStyle.roundedBorder5,
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Card(
                                                clipBehavior: Clip.antiAlias,
                                                elevation: 0,
                                                margin: getMargin(
                                                  top: 3,
                                                  bottom: 3,
                                                ),
                                                color: ColorConstant.red900,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadiusStyle.roundedBorder5,
                                                ),
                                                child: Container(
                                                  height: getVerticalSize(
                                                    42,
                                                  ),
                                                  width: getHorizontalSize(
                                                    36,
                                                  ),
                                                  padding: getPadding(
                                                    all: 6,
                                                  ),
                                                  decoration:
                                                  AppDecoration.fillGray5003.copyWith(
                                                    borderRadius:
                                                    BorderRadiusStyle.roundedBorder5,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      CustomImageView(
                                                        imagePath:
                                                        ImageConstant.imgImage2,
                                                        height: getVerticalSize(
                                                          28,
                                                        ),
                                                        width: getHorizontalSize(
                                                          23,
                                                        ),
                                                        alignment: Alignment.topCenter,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: getPadding(
                                                  left: 12,
                                                  top: 10,
                                                  bottom: 10,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      getFileName(booking),
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtHindMedium12,
                                                    ),

                                                  ],
                                                ),
                                              ),
                                              Spacer(),
                                              Container(
                                                height: getSize(
                                                  38,
                                                ),
                                                width: getSize(
                                                  38,
                                                ),
                                                margin: getMargin(
                                                  top: 11,
                                                  right: 5,
                                                ),
                                                child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        _downloadPDF(booking);
                                                      },
                                                      child: CustomImageView(
                                                        svgPath: ImageConstant.imgCalendar11,
                                                        height: getSize(38),
                                                        width: getSize(38),
                                                        alignment: Alignment.center,
                                                      ),

                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]
                                )
                            )
                        )
                    )
                  ]
              )
          )
        ]
    )
);

  Future<Map<String, dynamic>?> readBookingAndProperty(String bookingId) async {
    if (bookingId == null) {
      print('Booking ID is null');
      return null;
    }

    final docBooking =
    FirebaseFirestore.instance.collection('booking_property').doc(bookingId);
    final snapshot = await docBooking.get();

    if (snapshot.exists) {
      final bookingProperty = Booking_Property.fromJson(snapshot.data()!);

      final docProperty =
      FirebaseFirestore.instance.collection('rental_property').doc(bookingProperty.property_id);
      final propertySnapshot = await docProperty.get();

      if (propertySnapshot.exists) {
        final propertyData = propertySnapshot.data()!;
        final property = Rental_Property.fromJson(propertyData);
        return {'booking': bookingProperty, 'property': property};
      } else {
        print('Property not found for booking ID: ${bookingProperty.property_id}');
        return null;
      }
    } else {
      print('Booking property not found for booking ID: $bookingId');
      return null;
    }
  }

@override
Widget build(
    BuildContext context) {
  final userProvider = Provider.of<UserProvider>(context);
  final currentUserId = userProvider.currentUserId;
  print('Current UserID: $currentUserId');

  final String? bookingIdArg =
  ModalRoute.of(context)?.settings.arguments as String?;
  print('Booking ID: $bookingIdArg');

 return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.whiteA700,
         resizeToAvoidBottomInset: false,
         body: FutureBuilder<Map<String, dynamic>?>(
           future: readBookingAndProperty(bookingIdArg!), // Pass propertyIdArg as an argument
           builder: (context, snapshot) {
             if (snapshot.hasError) {
               return Text('Something went wrong! ${snapshot.error}');
             } else if (snapshot.connectionState == ConnectionState.waiting) {
               return Center(child: CircularProgressIndicator());
             } else if (snapshot.hasData) {
               final data = snapshot.data!;
               final booking = data['booking'] as Booking_Property;
               final property = data['property'] as Rental_Property;
               return buildBooking(booking, property);
             } else {
               return Center(child: Text('No Booking Property'));
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
onTapIcback3(BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
onTapEditschedule(BuildContext context) { Navigator.pushNamed(context, AppRoutes.rescheduleVisitStudentScreen); }
onTapHome(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeStudentScreen); }
onTapSchedule(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
onTapSaved(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.savedPage); }
onTapProfile(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileStudentScreen); }
 }
