import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
// import 'package:homecampus/routes/app_routes.dart';
// ignore_for_file: must_be_immutable

class ScheduledStatusPage extends StatefulWidget {
  @override
  _ScheduledStatusPageState createState() => _ScheduledStatusPageState();

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


class _ScheduledStatusPageState extends State<ScheduledStatusPage> {

  int selectedButtonIndex = 0; // Initialize the selected button index
  final FirebaseAuth auth = FirebaseAuth.instance;
  //final user = FirebaseAuth.instance.currentUser!;
  User? currentUser;
  String? bookingId;

  @override
  void initState() {
    super.initState();
    inputData();
  }

  void inputData() async {
    bookingId = Provider.of<UserProvider>(context).bookingId;
    print('Booking ID: $bookingId'); // Add this line to print the propertyId
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

  List<String> buttonTitles = [
    "Pending",
    "Confirmed",
    "Canceled",
  ];

  void onTapRequested(BuildContext context, String bookingId) {
    print('Selected Booking ID: $bookingId');
    Provider.of<UserProvider>(context, listen: false).setBookingId(bookingId);
    Navigator.pushNamed(context, '/schedule_visit_details_student_screen', arguments: bookingId);
  }

  void onTapConfirmed(BuildContext context, String bookingId) {
    print('Selected Booking ID: $bookingId');
    Provider.of<UserProvider>(context, listen: false).setBookingId(bookingId);
    Navigator.pushNamed(context, '/schedule_visit_confirmed_student_screen', arguments: bookingId);
  }

  void onTapCanceled(BuildContext context, String bookingId) {
    print('Selected Booking ID: $bookingId');
    Provider.of<UserProvider>(context, listen: false).setBookingId(bookingId);
    Navigator.pushNamed(context, '/schedule_visit_canceled_student_screen', arguments: bookingId);
  }

  Widget buildRequested (Booking_Property booking, Rental_Property property) => Container(
      width: double.maxFinite,
      child: Container(
          margin: getMargin(top: 30),
          padding: getPadding(left: 15, top: 17, right: 15, bottom: 17),
          decoration: AppDecoration.outlineBluegray5001.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //sini
                Padding(
                    padding: getPadding(left: 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        margin: getMargin(top: 5),
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
                //sini
                Padding(
                    padding: getPadding(top: 15, bottom: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomButton(
                              height: getVerticalSize(46),
                              text: "Cancel",
                              margin: getMargin(right: 10),
                              variant: ButtonVariant.GradientRed900Deeporange600, // Set the background color to red
                              fontStyle: ButtonFontStyle.InterSemiBold14, // Set the text color to white
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Confirmation"),
                                      content: Text("Are you sure you want to cancel? Your booking payment will not be returned!"),
                                      actions: [
                                        TextButton(
                                          child: Text("Cancel"),
                                          onPressed: () {
                                            onTapCancelCanceled(context); // Close the dialog
                                          },
                                        ),
                                        TextButton(
                                          child: Text("Confirm"),
                                          onPressed: () {
                                            onTapConfirmCanceled(context); // Close the dialog

                                            final docBooking = FirebaseFirestore.instance.collection('booking_property').doc(booking.booking_id);

                                            docBooking.update({
                                              'booking_status': 'Canceled',
                                            }).then((value) {
                                              // Update successful
                                              print("Booking status updated to Canceled");
                                            }).catchError((error) {
                                              // Handle the error
                                              print("Failed to update booking status: $error");
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Expanded(
                              child: CustomButton(
                                  height: getVerticalSize(46),
                                  text: "View Details",
                                  margin: getMargin(left: 10),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  fontStyle: ButtonFontStyle.InterSemiBold14,
                                  onTap: () {
                                    final bookingId = booking.booking_id;
                                    onTapRequested(context, bookingId);
                                  }
                              )
                          )
                        ]
                    )
                )
              ]
          )
      )
  );

  Widget buildConfirmed (Booking_Property booking, Rental_Property property) => Container(
      width: double.maxFinite,
      child: Container(
          margin: getMargin(top: 30),
          padding: getPadding(left: 15, top: 17, right: 15, bottom: 17),
          decoration: AppDecoration.outlineBluegray5001.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Padding(
                  padding: getPadding(left: 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      margin: getMargin(top: 5),
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
                    padding: getPadding(top: 15, bottom: 5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomButton(
                              height: getVerticalSize(46),
                              text: "Cancel",
                              margin: getMargin(right: 10),
                              variant: ButtonVariant.GradientRed900Deeporange600, // Set the background color to red
                              fontStyle: ButtonFontStyle.InterSemiBold14, // Set the text color to white
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Confirmation"),
                                      content: Text("Are you sure you want to cancel? Your booking payment will not be returned!"),
                                      actions: [
                                        TextButton(
                                          child: Text("Cancel"),
                                          onPressed: () {
                                            onTapCancelCanceled(context); // Close the dialog
                                          },
                                        ),
                                        TextButton(
                                          child: Text("Confirm"),
                                          onPressed: () {
                                            onTapConfirmCanceled(context); // Close the dialog

                                            final docBooking = FirebaseFirestore.instance.collection('booking_property').doc(booking.booking_id);

                                            docBooking.update({
                                              'booking_status': 'Canceled',
                                            }).then((value) {
                                              // Update successful
                                              print("Booking status updated to Canceled");
                                            }).catchError((error) {
                                              // Handle the error
                                              print("Failed to update booking status: $error");
                                            }
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Expanded(
                              child: CustomButton(
                                  height: getVerticalSize(46),
                                  text: "View Details",
                                  margin: getMargin(left: 10),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  fontStyle: ButtonFontStyle.InterSemiBold14,
                                  onTap: () {
                                    final bookingId = booking.booking_id;
                                    onTapConfirmed(context, bookingId);
                                  }
                                  )
                          )
                        ]
                    )
                )
              ]
          )
      )
  );

  Widget buildCanceled (Booking_Property booking, Rental_Property property) => Container(
      width: double.maxFinite,
      child: Container(
          margin: getMargin(top: 30),
          padding: getPadding(left: 15, top: 17, right: 15, bottom: 17),
          decoration: AppDecoration.outlineBluegray5001.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Padding(
                  padding: getPadding(left: 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      margin: getMargin(top: 5),
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
                    padding: getPadding(top: 15, bottom: 5, left: 151),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: CustomButton(
                                  height: getVerticalSize(46),
                                  text: "View Details",
                                  margin: getMargin(left: 10),
                                  variant: ButtonVariant.OutlineBlack9003f_1,
                                  fontStyle: ButtonFontStyle.InterSemiBold14,
                                  onTap: () {
                                    final bookingId = booking.booking_id;
                                    onTapCanceled(context, bookingId);
                                  }
                                  )
                          )
                        ]
                    )
                )
              ]
          )
      )
  );

  Future<Rental_Property> getPropertyDetails(String propertyId) async {
    final docSnapshot = await FirebaseFirestore.instance.collection('rental_property').doc(propertyId).get();
    return Rental_Property.fromJson(docSnapshot.data()!);
  }

  Stream<List<Booking_Property>> readRequested(String tenantId) =>
      FirebaseFirestore.instance
          .collection('booking_property')
          .where('tenant_id', isEqualTo: tenantId) // Add a filter based on the tenant_id
          .where('booking_status', isEqualTo: 'Requested') // Add a filter based on the booking_status
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => Booking_Property.fromJson(doc.data())).toList());

  Stream<List<Booking_Property>> readConfirmed(String tenantId) =>
      FirebaseFirestore.instance
          .collection('booking_property')
          .where('tenant_id', isEqualTo: tenantId) // Add a filter based on the tenant_id
          .where('booking_status', isEqualTo: 'Confirmed') // Add a filter based on the booking_status
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => Booking_Property.fromJson(doc.data())).toList());

  Stream<List<Booking_Property>> readCanceled(String tenantId) =>
      FirebaseFirestore.instance
          .collection('booking_property')
          .where('tenant_id', isEqualTo: tenantId) // Add a filter based on the tenant_id
          .where('booking_status', isEqualTo: 'Canceled') // Add a filter based on the booking_status
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => Booking_Property.fromJson(doc.data())).toList());

    @override
    Widget build(
        BuildContext context) {
      final userProvider = Provider.of<UserProvider>(context);
      final currentUserId = userProvider.currentUserId;
      print('Current UserID: $currentUserId');
      return SafeArea(
          child: Scaffold(
              backgroundColor: ColorConstant.whiteA700,
              body: Container(
                  width: double.maxFinite,
                  decoration: AppDecoration.fillWhiteA700,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                                padding: getPadding(top: 5),
                                child:
                                Padding(
                                    padding: getPadding(left: 40, right: 40, bottom: 5),
                                    child:
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [Padding(
                                                  padding: getPadding(top: 25),
                                                  child: Text(
                                                      "Booking Property",
                                                      overflow: TextOverflow.ellipsis,
                                                      textAlign: TextAlign.center,
                                                      style: AppStyle.txtRubikBold18)
                                              ),
                                              ]
                                          ),
                                          Container(
                                            margin: getMargin(top: 30),
                                            decoration: AppDecoration.fillBluegray5001.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: List.generate(
                                                buttonTitles.length,
                                                    (index) => GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedButtonIndex = index;
                                                    });
                                                  },
                                                  child: CustomButton(
                                                    height: getVerticalSize(50),
                                                    width: getHorizontalSize(110),
                                                    text: buttonTitles[index],
                                                    variant: index == selectedButtonIndex ? ButtonVariant.OutlineBlack9003f_1 : ButtonVariant.FillBluegray5001,
                                                    fontStyle: ButtonFontStyle.InterSemiBold14,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (selectedButtonIndex == 0) ...[
                                            // Additional content for "Requested" button
                                            StreamBuilder<List<Booking_Property>>(
                                              stream: readRequested(currentUserId),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState == ConnectionState.waiting) {
                                                  return Center(child: CircularProgressIndicator());
                                                } else if (snapshot.hasError) {
                                                  return Text('Something went wrong! ${snapshot.error}');
                                                } else if (snapshot.hasData) {
                                                  final bookingPropertyList = snapshot.data!;
                                                  return ListView.builder(
                                                    shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemCount: bookingPropertyList.length,
                                                    itemBuilder: (context, index) {
                                                      final bookingProperty = bookingPropertyList[index];
                                                      // Get the corresponding Rental_Property object from the database using property_id
                                                      return FutureBuilder<Rental_Property>(
                                                        future: getPropertyDetails(bookingProperty.property_id),
                                                        builder: (context, rentalSnapshot) {
                                                          if (rentalSnapshot.connectionState == ConnectionState.waiting) {
                                                            return CircularProgressIndicator();
                                                          } else if (rentalSnapshot.hasError) {
                                                            return Text('Something went wrong! ${rentalSnapshot.error}');
                                                          } else if (rentalSnapshot.hasData) {
                                                            final rentalProperty = rentalSnapshot.data!;
                                                            return buildRequested(bookingProperty, rentalProperty); // Pass both bookingProperty and rentalProperty to the buildRequested function
                                                          } else {
                                                            return Text('No data available');
                                                          }
                                                        },
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  return Text('No data available');
                                                }
                                              },
                                            ),

                                          ],
                                          if (selectedButtonIndex == 1) ...[
                                            StreamBuilder<List<Booking_Property>>(
                                              stream: readConfirmed(currentUserId),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState == ConnectionState.waiting) {
                                                  return Center(child: CircularProgressIndicator());
                                                } else if (snapshot.hasError) {
                                                  return Text('Something went wrong! ${snapshot.error}');
                                                } else if (snapshot.hasData) {
                                                  final bookingPropertyList = snapshot.data!;
                                                  return ListView.builder(
                                                    shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemCount: bookingPropertyList.length,
                                                    itemBuilder: (context, index) {
                                                      final bookingProperty = bookingPropertyList[index];
                                                      // Get the corresponding Rental_Property object from the database using property_id
                                                      return FutureBuilder<Rental_Property>(
                                                        future: getPropertyDetails(bookingProperty.property_id),
                                                        builder: (context, rentalSnapshot) {
                                                          if (rentalSnapshot.connectionState == ConnectionState.waiting) {
                                                            return CircularProgressIndicator();
                                                          } else if (rentalSnapshot.hasError) {
                                                            return Text('Something went wrong! ${rentalSnapshot.error}');
                                                          } else if (rentalSnapshot.hasData) {
                                                            final rentalProperty = rentalSnapshot.data!;
                                                            return buildConfirmed(bookingProperty, rentalProperty); // Pass both bookingProperty and rentalProperty to the buildRequested function
                                                          } else {
                                                            return Text('No data available');
                                                          }
                                                        },
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  return Text('No data available');
                                                }
                                              },
                                            ),
                                          ],
                                          if (selectedButtonIndex == 2) ...[
                                            // Additional content for "Canceled" button
                                            StreamBuilder<List<Booking_Property>>(
                                              stream: readCanceled(currentUserId),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState == ConnectionState.waiting) {
                                                  return Center(child: CircularProgressIndicator());
                                                } else if (snapshot.hasError) {
                                                  return Text('Something went wrong! ${snapshot.error}');
                                                } else if (snapshot.hasData) {
                                                  final bookingPropertyList = snapshot.data!;
                                                  return ListView.builder(
                                                    shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemCount: bookingPropertyList.length,
                                                    itemBuilder: (context, index) {
                                                      final bookingProperty = bookingPropertyList[index];
                                                      // Get the corresponding Rental_Property object from the database using property_id
                                                      return FutureBuilder<Rental_Property>(
                                                        future: getPropertyDetails(bookingProperty.property_id),
                                                        builder: (context, rentalSnapshot) {
                                                          if (rentalSnapshot.connectionState == ConnectionState.waiting) {
                                                            return CircularProgressIndicator();
                                                          } else if (rentalSnapshot.hasError) {
                                                            return Text('Something went wrong! ${rentalSnapshot.error}');
                                                          } else if (rentalSnapshot.hasData) {
                                                            final rentalProperty = rentalSnapshot.data!;
                                                            return buildCanceled(bookingProperty, rentalProperty); // Pass both bookingProperty and rentalProperty to the buildRequested function
                                                          } else {
                                                            return Text('No data available');
                                                          }
                                                        },
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  return Text('No data available');
                                                }
                                              },
                                            ),
                                          ],
                                        ]
                                    )
                                )
                            )
                        )
                      ]
                  )
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

    onTapConfirmCanceled(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
    onTapCancelCanceled(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
    onTapHome(
        BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeStudentScreen); }
    onTapSchedule(
        BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
    onTapSaved(
        BuildContext context) { Navigator.pushNamed(context, AppRoutes.savedPage); }
    onTapProfile(
        BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileStudentScreen); }
  }

