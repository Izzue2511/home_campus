import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/app_bar/appbar_iconbutton.dart';
import 'package:homecampus/widgets/app_bar/appbar_subtitle.dart';
import 'package:homecampus/widgets/app_bar/custom_app_bar.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
import 'package:homecampus/routes/app_routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
// ignore_for_file: must_be_immutable

class ScheduleVisitScreen extends StatefulWidget {
 @override
 _ScheduleVisitScreenState createState() => _ScheduleVisitScreenState();

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
}

class _ScheduleVisitScreenState extends State<ScheduleVisitScreen> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  //final user = FirebaseAuth.instance.currentUser!;
  User? currentUser;

  // Declare currentUserId as an instance variable
  String currentUserId = '';

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
      setState(() {
        currentUserId = currentUser!.uid; // Update the instance variable here
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

TextEditingController fullnameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phonenumberController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> createBooking(Booking_Property booking, String tenantID) async {
    final docBooking = FirebaseFirestore.instance.collection('booking_property').doc();
    booking.booking_id = docBooking.id; // Assign the document ID to the booking_id field
    booking.tenant_id = tenantID; // Assign the currentUserId to the tenant_id field

    final json = booking.toJson();
    await docBooking.set(json);
  }

  File? file;
  String? filePath;

  Future<void> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result == null || result.files.isEmpty) return;

      final file = File(result.files.single.path!);
      final filePermanent = await saveFilePermanently(file.path);
      final path = filePermanent.path;
      setState(() {
        this.file = filePermanent;
        filePath = path;
        isFileUploaded = true;
      });
    } catch (e) {
      print('Failed to pick file: $e');
    }
  }

  Future<File> saveFilePermanently(String filePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = path.basename(filePath);
    final file = File('${directory.path}/$name');

    return File(filePath).copy(file.path);
  }

DateTime _dateTime = DateTime.now();

void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2063),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
}

  Widget buildProperty (Rental_Property property, House_Owner owner, String currentUserId,) => Form(
      key: _formKey,
      child:
      Container(
          height: getVerticalSize(850),
          width: double.maxFinite,
          child: Stack(
              alignment: Alignment.center,
              children: [CustomImageView(
                  imagePath: ImageConstant.imgBg,
                  height: getVerticalSize(830),
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
                                  onTap: () {onTapIcback(context);}),
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
                                                padding: getPadding(top: 20, bottom: 20),
                                                decoration: AppDecoration.outlineGray40066.copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [CustomImageView(
                                                        imagePath: 'assets/images/house_1.jpg',
                                                        height: getVerticalSize(130),
                                                        width: getHorizontalSize(130),
                                                        radius: BorderRadius.circular(
                                                            getHorizontalSize(20))),
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
                                                                        style: AppStyle.txtHindRegular16)),
                                                                Text("Merlimau, Melaka",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.left,
                                                                    style: AppStyle.txtHindRegular13.copyWith(letterSpacing: getHorizontalSize(0.13))),
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
                                                                        textAlign: TextAlign.left))
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
                                                padding: getPadding(left: 0, top: 10),
                                                child: Text(
                                                    "Please make a payment transaction to the account below for booking purpose.",
                                                    //overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtInterRegular12,
                                                    maxLines: null,
                                                )
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
                                                "RM" + property.property_price.toString(),
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
                                                'Bank Information',
                                                style: TextStyle(
                                                  fontFamily: 'Hind',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 20,left: 0),
                                              child: Text(
                                                'Account Bank:',
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
                                                owner.owner_accountBank,
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
                                                'Account No:',
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
                                                owner.owner_accountNo,
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
                                                'Account Holder:',
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
                                                owner.owner_accountHolder,
                                                style: TextStyle(
                                                  fontFamily: 'Hind',
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),

                                            //Upload file
                                            Padding(
                                                padding: getPadding(left: 0, top: 25),
                                                child: RichText(
                                                    text: TextSpan(
                                                        children: [TextSpan(
                                                            text: "Upload Payment Receipt",
                                                            style: TextStyle(
                                                                color: ColorConstant.gray90002,
                                                                fontSize: getFontSize(14),
                                                                fontFamily: 'Inter',
                                                                fontWeight: FontWeight.w700)),
                                                          TextSpan(
                                                              text: "*",
                                                              style: TextStyle(
                                                                  color: ColorConstant.pink30001,
                                                                  fontSize: getFontSize(14),
                                                                  fontFamily: 'Inter',
                                                                  fontWeight: FontWeight.w700))]),
                                                    textAlign: TextAlign.left,
                                                )
                                            ),
                                            Padding(
                                                padding: getPadding(left: 0, top: 10),
                                                child: Text(
                                                    "Please upload payment receipt as proof payment.",
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtInterRegular12,
                                                )
                                            ),
                                            Padding(
                                              padding: getPadding(left: 0, top: 20, right: 0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  file == null // Check if file is null instead of image
                                                      ? GestureDetector(
                                                    onTap: () => pickFile(), // Call the pickFile() function
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 0),
                                                      padding: EdgeInsets.only(
                                                          left: 40, top: 30, right: 40, bottom: 30),
                                                      decoration: AppDecoration.fillGray5004.copyWith(
                                                        borderRadius: BorderRadiusStyle.roundedBorder12,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.min,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          CustomImageView(
                                                            svgPath: ImageConstant.imgUploadIndigoA100,
                                                            height: 35,
                                                            width: 35,
                                                          ),
                                                          Padding(
                                                            padding: getPadding(top: 15),
                                                            child: Text(
                                                              "Upload File",
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.left,
                                                              style: AppStyle.txtInterBold12IndigoA100,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                      : // Replace Image.file with a widget to show the PDF content
                                                  Container(
                                                    width: 200,
                                                    height: 200,
                                                    color: Colors.grey, // Placeholder color for PDF content
                                                    child: Center(
                                                      child: Text(
                                                        'PDF File',
                                                        style: TextStyle(fontSize: 20, color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            CustomButton(
                                                height: getVerticalSize(54),
                                                text: "Confirm Booking",
                                                margin: getMargin(top: 33),
                                                fontStyle: ButtonFontStyle.RubikMedium18,
                                                onTap: () {
                                                  if (isFileUploaded) {
                                                    if (currentUserId != null &&
                                                        currentUserId
                                                            .isNotEmpty) {
                                                      final booking = Booking_Property(
                                                        booking_price: property
                                                            .property_price
                                                            .toString(),
                                                        booking_receipt: filePath!,
                                                        booking_date: _dateTime
                                                            .format()
                                                            .toString(),
                                                        booking_status: "Requested",
                                                        tenant_id: currentUserId,
                                                        property_id: property
                                                            .property_id,
                                                        owner_id: property
                                                            .owner_id,
                                                      );

                                                      onTapConfirm(context);

                                                      createBooking(
                                                          booking,
                                                          currentUserId);
                                                    } else {
                                                      print(
                                                          "CurrentUserid is null");
                                                      // Handle the case where currentUserId is null or empty
                                                      // You may show an error message or redirect to the login screen.
                                                    }
                                                  }
                                                  else {
                                                    // Show an error message or notification to inform the user to upload the file first
                                                    // For example:
                                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                      content: Text('Please upload the payment receipt first.'),
                                                    ));
                                                  }
                                                }
                                            )
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
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }*/

  final String? propertyIdArg =
  ModalRoute.of(context)?.settings.arguments as String?;
  print('Property ID: $propertyIdArg');

  return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.whiteA700,
         resizeToAvoidBottomInset: false,
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
               return buildProperty(property, owner, currentUserId);
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
                         padding: getPadding(top: 16),
                         child: GestureDetector(
                             onTap: () {
                               onTapHome(context);
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
                           onTap: () {onTapSchedule(context);},
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
                           onTap: () {
                             onTapSaved(context);
                           },
                           child:Padding(
                               padding: getPadding(top: 16),
                               child: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [CustomImageView(
                                       svgPath: ImageConstant.imgClock,
                                       height: getSize(24),
                                       width: getSize(24)),
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
onTapIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.detailsHouseScreen); }
onTapConfirm(BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledSuccessfullyScreen); }
onTapHome(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeStudentScreen); }
onTapSchedule(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
onTapSaved(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.savedPage); }
onTapProfile(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileStudentScreen); }
 }
