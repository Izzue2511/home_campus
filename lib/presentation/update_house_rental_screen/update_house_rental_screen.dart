import 'package:flutter_svg/flutter_svg.dart';
import '../add_house_rental_screen/widgets/add_house_item_widget.dart';
import '../add_house_rental_screen/widgets/add_house_item_widget2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_button.dart';
// import 'package:homecampus/widgets/app_bar/appbar_image.dart';
import 'package:homecampus/widgets/custom_icon_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
// import 'package:homecampus/routes/app_routes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_analytics/observer.dart';

//import 'package:path/path.dart';
// ignore_for_file: must_be_immutable

class UpdateHouseRentalScreen extends StatefulWidget {
  @override
  _UpdateHouseRentalScreenState createState() => _UpdateHouseRentalScreenState();

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

class _UpdateHouseRentalScreenState extends State<UpdateHouseRentalScreen> {

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

  // Function to track events
  Future<void> _trackEvent(String eventName) async {
    await FirebaseAnalytics.instance.logEvent(name: eventName);
  }

// Function to check if the user is authenticated
  bool isUserAuthenticated() {
    return auth.currentUser != null;
  }

 TextEditingController nameController = TextEditingController();
 TextEditingController descriptionController = TextEditingController();
 TextEditingController priceController = TextEditingController();
 TextEditingController addressController = TextEditingController();

 int number = 0;
 int number2 = 0;
// Define the function to update the 'number' variable
  Future<int>? updateNumber(int newNumber) async {
    number = newNumber;
    // You can return a value or null based on your requirements
    return number;
  }
  Future<int>? updateNumber2(int newNumber2) async {
    number2 = newNumber2;
    // You can return a value or null based on your requirements
    return number2;
  }

  bool pressedAc = false;
  bool pressedWm = false;
  bool pressedFg = false;
  bool pressedGs = false;
  bool pressedWf = false;
  bool pressedKt = false;
  bool pressedRc = false;
  bool pressedCh = false;
  bool pressedSt = false;
  bool pressedDt = false;
  bool pressedLk = false;

  File? image;
  String? imagePath;

  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imagePermanent = await saveImagePermanently(image.path);
      final path = imagePermanent.path;
      setState(() {
        this.image = imagePermanent;
        imagePath = path;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = path.basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  Widget buildProperty (Rental_Property property) => Container(
      width: double.maxFinite,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Expanded(
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomButton(
                            height: getVerticalSize(80),
                            text: "Property Information",
                            variant: ButtonVariant.FillWhiteA700,
                            shape: ButtonShape.CustomBorderTL16,
                            padding: ButtonPadding.PaddingT31,
                            fontStyle: ButtonFontStyle.InterBold16),
                        Divider(
                            height: getVerticalSize(1),
                            thickness: getVerticalSize(1),
                            color: ColorConstant.gray10004),
                        Padding(padding: getPadding(left: 38, top: 15),
                            child: RichText(
                                text: TextSpan(
                                    children: [TextSpan(
                                        text: "Property Image",
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
                                textAlign: TextAlign.left)),
                        Container(
                            width: getHorizontalSize(300),
                            margin: getMargin(left: 38, top: 6, right: 75),
                            child: Text(
                                "Image format must only .jpg/.jpeg/.png and minimum size 300 x 300px",
                                maxLines: null,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular12)),

                        Padding(
                          padding: getPadding(left: 38, top: 15, right: 65),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAlias,
                                    elevation: 0,
                                    margin: EdgeInsets.all(0),
                                    color: ColorConstant.gray5004,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadiusStyle.roundedBorder12,
                                    ),
                                    child: Container(
                                      height: getVerticalSize(130),
                                      width: getHorizontalSize(147),
                                      decoration: AppDecoration.fillGray5004.copyWith(
                                        borderRadius: BorderRadiusStyle.roundedBorder12,
                                      ),
                                      child: Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          image != null ? Image.file(
                                            image!,
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ) :
                                          CustomImageView(
                                            height: getVerticalSize(130),
                                            width: getHorizontalSize(129),
                                            radius: BorderRadius.circular(getHorizontalSize(25)),
                                            alignment: Alignment.centerLeft,
                                          ),
                                          CustomIconButton(
                                            height: 30,
                                            width: 30,
                                            margin: getMargin(right: 5, top: 5),
                                            variant: IconButtonVariant.FillIndigoA100,
                                            padding: IconButtonPadding.PaddingAll9,
                                            alignment: Alignment.topRight,
                                            child: CustomImageView(
                                              svgPath: ImageConstant.imgClose,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: getHorizontalSize(55),
                                    margin: getMargin(left: 45, top: 5),
                                    padding: getPadding(left: 10, top: 5, right: 10, bottom: 5),
                                    decoration: AppDecoration.txtOutlineBluegray30026.copyWith(
                                      borderRadius: BorderRadiusStyle.txtRoundedBorder4,
                                    ),
                                    child: Text(
                                      "Cover",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtInterSemiBold12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: getPadding(left: 38, top: 16, right: 64),
                          child: Row(
                            children: [
                              Container(
                                margin: getMargin(left: 16),
                                padding: getPadding(left: 41, top: 33, right: 41, bottom: 33),
                                decoration: AppDecoration.fillGray5004.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder12,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: ()  => pickImage(),

                                      child: CustomImageView(
                                        svgPath: ImageConstant.imgUploadIndigoA100,
                                        height: getSize(32),
                                        width: getSize(32),
                                      ),
                                    ),
                                    Padding(
                                      padding: getPadding(top: 15),
                                      child: Text(
                                        "New Image",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtInterBold12IndigoA100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: getPadding(left: 38, top: 26),
                            child: RichText(
                                text: TextSpan(
                                    children: [TextSpan(
                                        text: "Property Name",
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
                                textAlign: TextAlign.left)),
                        Padding(
                            padding: getPadding(left: 38, top: 8),
                            child: Text(
                                "Include max. 25 characters to make it more simple and catchy.",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular12)),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: nameController,
                            hintText: property.property_name,
                            margin: getMargin(left: 38, top: 16, right: 38),
                            variant: TextFormFieldVariant.OutlineIndigo50,
                            fontStyle: TextFormFieldFontStyle.InterSemiBold14,
                            //textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            alignment: Alignment.center, maxLines: 2),
                        Padding(
                            padding: getPadding(left: 38, top: 26),
                            child: RichText(
                                text: TextSpan(
                                    children: [TextSpan(
                                        text: "Property Address",
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
                                textAlign: TextAlign.left)),
                        Padding(
                            padding: getPadding(left: 38, top: 8),
                            child: Text(
                                "Include house number, street name, ZIP code, city and state.",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: AppStyle.txtInterRegular12)),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: addressController,
                            hintText: property.property_address,
                            margin: getMargin(left: 38, top: 16, right: 38),
                            variant: TextFormFieldVariant.OutlineIndigo50,
                            fontStyle: TextFormFieldFontStyle.InterSemiBold14,
                            //textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            alignment: Alignment.center, maxLines: 3),
                        Padding(
                            padding: getPadding(left: 38, top: 26),
                            child: RichText(
                                text: TextSpan(
                                    children: [TextSpan(
                                        text: "Property Map Location",
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
                                textAlign: TextAlign.left)),
                        Form(
                          child: Padding(
                              padding: getPadding(left: 38, top: 6, right: 56),
                              child: Row(
                                  children: [CustomIconButton(
                                      height: 51,
                                      width: 51,
                                      variant: IconButtonVariant.OutlineGray10001,
                                      shape: IconButtonShape.CircleBorder25,
                                      padding: IconButtonPadding.PaddingAll14,
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgLocationBlueGray600)),
                                    Expanded(
                                        child: Container(
                                            width: getHorizontalSize(251),
                                            margin: getMargin(left: 15, top: 8, bottom: 6),
                                            child: TextFormField(
                                              onChanged: (value) {
                                              },
                                              textInputAction: TextInputAction.search,
                                              decoration: InputDecoration(
                                                hintText: "Search your property location...",
                                                suffixIcon: IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.search),
                                                ),
                                              ),
                                              maxLines: null,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtLatoRegular12Bluegray600.copyWith(
                                                letterSpacing: getHorizontalSize(0.36),
                                              ),
                                            )
                                        )
                                    )
                                  ]
                              )
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                "assets/images/img_currentlocation.svg",
                                height: 16,
                              ),
                              label: Text(
                                  "My current location",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtLatoRegular12Bluegray800.copyWith(letterSpacing: getHorizontalSize(0.36))
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: secondaryColor10LightTheme,
                                foregroundColor: textColorLightTheme,
                                elevation: 0,
                                fixedSize: const Size(double.infinity, 40),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                            padding: getPadding(left: 38, top: 26),
                            child: RichText(
                                text: TextSpan(
                                    children: [TextSpan(
                                        text: "Property Descriptions",
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
                                textAlign: TextAlign.left)),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: getHorizontalSize(330),
                                margin: getMargin(left: 38, top: 7, right: 45),
                                child: Text(
                                    "Include min. 260 characters to make it easier for tenants to understand and find your property.",
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterRegular12))),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: descriptionController,
                            hintText: property.property_description,
                            margin: getMargin(left: 38, top: 16, right: 38),
                            variant: TextFormFieldVariant.OutlineIndigo50,
                            fontStyle: TextFormFieldFontStyle.InterSemiBold14,
                            //textInputAction: TextInputAction.done,
                            textInputType: TextInputType.text,
                            alignment: Alignment.center, maxLines: 5),
                        Padding(
                          padding: getPadding(left: 38, top: 26),
                          child: RichText(
                              text: TextSpan(
                                  children: [TextSpan(
                                      text: "Property Features",
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
                              textAlign: TextAlign.left),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: getPadding(left: 38, top: 21, right: 49),
                                child: ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                          height: getVerticalSize(15));},
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return AddHouseItemWidget (
                                        initialNumber: int.parse(property.property_bedroom),
                                        onNumberChange: updateNumber,
                                      );
                                    }
                                )
                            )
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: getPadding(left: 38, top: 21, right: 49),
                            child: ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getVerticalSize(15));
                              },
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return AddHouseItemWidget2(
                                  initialNumber2: int.parse(property.property_bathroom),
                                  onNumberChange2: updateNumber2,
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                            padding: getPadding(left: 38, top: 26),
                            child: RichText(
                                text: TextSpan(
                                    children: [TextSpan(
                                        text: "Property Facilities",
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
                                textAlign: TextAlign.left)
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                                width: getHorizontalSize(330),
                                margin: getMargin(left: 38, top: 7, right: 45),
                                child: Text(
                                    "Select facilities that your property provided only.",
                                    maxLines: null,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtInterRegular12))),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: getPadding(left: 38, top: 19, right: 49),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          pressedAc = !pressedAc; // Toggle the state when the container is pressed
                                        });
                                      },
                                      child: Container(
                                        width: getHorizontalSize(107),
                                        padding: getPadding(left: 16, top: 11, right: 16, bottom: 11),
                                        decoration: pressedAc
                                            ? AppDecoration.txtOutlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.txtCircleBorder18) // Change the color when pressed
                                            : AppDecoration.txtOutlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.txtCircleBorder18, color: Colors.white),
                                        child: Text(
                                          "Air Conditioner",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle.txtLatoBold10.copyWith(
                                            letterSpacing: getHorizontalSize(0.3),
                                            color: pressedAc ? Colors.white : Colors.deepPurpleAccent, // Change the text color when pressed
                                          ),
                                        ),
                                      ),
                                    ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pressedWm = !pressedWm;
                                          });
                                        },
                                        child: Container(
                                          width: getHorizontalSize(113),
                                          margin: getMargin(left: 21),
                                          padding: getPadding(left: 14, top: 10, right: 14, bottom: 10),
                                          decoration: pressedWm
                                              ? AppDecoration.txtOutlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.txtCircleBorder18) // Change the color to the desired pressed color
                                              : AppDecoration.txtOutlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.txtCircleBorder18, color: Colors.white),
                                          child: Text(
                                            "Washing Machine",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: pressedWm
                                                ? AppStyle.txtLatoBold10.copyWith(letterSpacing: getHorizontalSize(0.3), color: Colors.white) // Change the text color to the desired pressed color
                                                : AppStyle.txtLatoBold10.copyWith(letterSpacing: getHorizontalSize(0.3), color: Colors.deepPurpleAccent),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pressedFg = !pressedFg;
                                          });
                                        },
                                        child: Container(
                                          width: getHorizontalSize(65),
                                          margin: getMargin(left: 21),
                                          padding: getPadding(left: 17, top: 10, right: 17, bottom: 10),
                                          decoration: pressedFg
                                              ? AppDecoration.txtOutlineBlack9003f.copyWith(
                                            borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                          )
                                              : AppDecoration.txtOutlineBlack9003f.copyWith(
                                            borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                            color: Colors.white, // Change to the original color
                                          ),
                                          child: Text(
                                            "Fridge",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtLatoBold10.copyWith(
                                              letterSpacing: getHorizontalSize(0.3),
                                              color: pressedFg ? Colors.white : Colors.deepPurpleAccent, // Change the text color when pressed
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                )
                            )
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: getPadding(left: 38, top: 22, right: 49),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          pressedGs = !pressedGs;
                                        });
                                      },
                                      child: Container(
                                        width: getHorizontalSize(71),
                                        padding: getPadding(left: 12, top: 11, right: 12, bottom: 11),
                                        decoration: pressedGs
                                            ? AppDecoration.txtOutlineBlack9003f.copyWith(
                                          borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                        )
                                            : AppDecoration.txtOutlineBlack9003f.copyWith(
                                          borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                          color: Colors.white, // Change to the original color
                                        ),
                                        child: Text(
                                          "Gas Stove",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: pressedGs
                                              ? AppStyle.txtLatoBold10.copyWith(
                                            letterSpacing: getHorizontalSize(0.3),
                                            color: Colors.white, // Change to the desired pressed text color
                                          )
                                              : AppStyle.txtLatoBold10.copyWith(
                                            letterSpacing: getHorizontalSize(0.3),
                                            color: Colors.deepPurpleAccent, // Change to the original text color
                                          ),
                                        ),
                                      ),
                                    ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pressedWf = !pressedWf;
                                          });
                                        },
                                        child: Container(
                                          width: getHorizontalSize(62),
                                          margin: getMargin(left: 19),
                                          padding: getPadding(left: 19, top: 11, right: 19, bottom: 11),
                                          decoration: pressedWf
                                              ? AppDecoration.txtOutlineBlack9003f.copyWith(
                                            borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                          )
                                              : AppDecoration.txtOutlineBlack9003f.copyWith(
                                            borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                            color: Colors.white, // Change the color to the original color
                                          ),
                                          child: Text(
                                            "WiFi",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: pressedWf
                                                ? AppStyle.txtLatoBold10Gray10001.copyWith(
                                              letterSpacing: getHorizontalSize(0.3),
                                              color: Colors.white, // Change the color to the desired pressed text color
                                            )
                                                : AppStyle.txtLatoBold10Gray10001.copyWith(
                                              letterSpacing: getHorizontalSize(0.3),
                                              color: Colors.deepPurpleAccent, // Change the color to the original text color
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            pressedKt = !pressedKt;
                                          });
                                        },
                                        child: Container(
                                          width: getHorizontalSize(65),
                                          margin: getMargin(left: 19),
                                          padding: getPadding(left: 18, top: 11, right: 18, bottom: 11),
                                          decoration: pressedKt
                                              ? AppDecoration.txtOutlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.txtCircleBorder18) // Change the color to the desired pressed color
                                              : AppDecoration.txtOutlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.txtCircleBorder18, color: Colors.white),
                                          child: Text(
                                            "Kettle",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: pressedKt
                                                ? AppStyle.txtLatoBold10.copyWith(letterSpacing: getHorizontalSize(0.3), color: Colors.white) // Change the text color to the desired pressed color
                                                : AppStyle.txtLatoBold10.copyWith(letterSpacing: getHorizontalSize(0.3), color: Colors.deepPurpleAccent),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pressedRc = !pressedRc; // Toggle the pressed state
                                          });
                                        },
                                        child: Container(
                                          width: getHorizontalSize(72),
                                          margin: getMargin(left: 19),
                                          padding: getPadding(left: 8, top: 11, right: 8, bottom: 11),
                                          decoration: pressedRc
                                              ? AppDecoration.txtOutlineBlack9003f.copyWith(
                                            borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                            color: Colors.deepPurpleAccent[150], // Change to desired color when pressed
                                          )
                                              : AppDecoration.txtOutlineBlack9003f.copyWith(
                                            borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                            color: Colors.white, // Change to original color
                                          ),
                                          child: Text(
                                            "Rice Cooker",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtLatoBold10.copyWith(
                                              letterSpacing: getHorizontalSize(0.3),
                                              color: pressedRc
                                                  ? Colors.white // Change to desired text color when pressed
                                                  : Colors.deepPurpleAccent, // Change to original text color
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                )
                            )
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Padding(
                                padding: getPadding(left: 38, top: 25, right: 49),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          pressedCh = !pressedCh;
                                        });
                                      },
                                      child: Container(
                                        width: getHorizontalSize(86),
                                        padding: getPadding(left: 4, top: 10, right: 4, bottom: 10),
                                        decoration: pressedCh
                                            ? AppDecoration.txtOutlineBlack9003f.copyWith(
                                          borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                          color: Colors.deepPurpleAccent[150], // Change to desired color
                                        )
                                            : AppDecoration.txtOutlineBlack9003f.copyWith(
                                          borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                          color: Colors.white, // Change to original color
                                        ),
                                        child: Text(
                                          " Clothes Hanger",
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: pressedCh
                                              ? AppStyle.txtLatoBold10.copyWith(
                                            letterSpacing: getHorizontalSize(0.3),
                                            color: Colors.white, // Change to desired text color
                                          )
                                              : AppStyle.txtLatoBold10.copyWith(
                                            letterSpacing: getHorizontalSize(0.3),
                                            color: Colors.deepPurpleAccent, // Change to original text color
                                          ),
                                        ),
                                      ),
                                    ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pressedSt = !pressedSt;
                                          });
                                        },
                                        child: Container(
                                          width: getHorizontalSize(71),
                                          margin: getMargin(left: 10),
                                          padding: getPadding(left: 4, top: 10, right: 4, bottom: 10),
                                          decoration: pressedSt
                                              ? AppDecoration.txtOutlineBlack9003f.copyWith(
                                            borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                            color: Colors.deepPurpleAccent[150], // Change to the desired pressed color
                                          )
                                              : AppDecoration.txtOutlineBlack9003f.copyWith(
                                            borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                            color: Colors.white, // Change to the desired default color
                                          ),
                                          child: Text(
                                            " Study Table",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtLatoBold10.copyWith(
                                              letterSpacing: getHorizontalSize(0.3),
                                              color: pressedSt ? Colors.white : Colors.deepPurpleAccent, // Change to the desired text color
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pressedDt = !pressedDt;
                                          });
                                        },
                                        child: Container(
                                          width: getHorizontalSize(71),
                                          margin: getMargin(left: 10),
                                          padding: getPadding(left: 4, top: 10, right: 4, bottom: 10),
                                          decoration: pressedDt
                                              ? AppDecoration.txtOutlineBlack9003f.copyWith(
                                            borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                            color: Colors.deepPurpleAccent[150], // Change to the desired pressed color
                                          )
                                              : AppDecoration.txtOutlineBlack9003f.copyWith(
                                            borderRadius: BorderRadiusStyle.txtCircleBorder18,
                                            color: Colors.white, // Change to the desired default color
                                          ),
                                          child: Text(
                                            " Dining Table",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtLatoBold10.copyWith(
                                              letterSpacing: getHorizontalSize(0.3),
                                              color: pressedDt ? Colors.white : Colors.deepPurpleAccent, // Change to the desired text color
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            pressedLk = !pressedLk;
                                          });
                                        },
                                        child: Container(
                                          width: getHorizontalSize(67),
                                          margin: getMargin(left: 12),
                                          padding: getPadding(left: 18, top: 11, right: 18, bottom: 11),
                                          decoration: pressedLk
                                              ? AppDecoration.txtOutlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.txtCircleBorder18) // Change the color to the desired pressed color
                                              : AppDecoration.txtOutlineBlack9003f.copyWith(borderRadius: BorderRadiusStyle.txtCircleBorder18, color: Colors.white),
                                          child: Text(
                                            "Locker",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: pressedLk
                                                ? AppStyle.txtLatoBold10.copyWith(letterSpacing: getHorizontalSize(0.3), color: Colors.white) // Change the text color to the desired pressed color
                                                : AppStyle.txtLatoBold10.copyWith(letterSpacing: getHorizontalSize(0.3), color: Colors.deepPurpleAccent),
                                          ),
                                        ),
                                      ),
                                    ]
                                )
                            )
                        ),
                        Padding(
                            padding: getPadding(left: 38, top: 33),
                            child: RichText(
                                text: TextSpan(
                                    children: [TextSpan(
                                        text: "Property Rent Per Month (RM)",
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
                                textAlign: TextAlign.left)
                        ),
                        CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: priceController,
                            hintText: property.property_price.toString(),
                            margin: getMargin(left: 38, top: 17, right: 38),
                            variant: TextFormFieldVariant.OutlineIndigo50,
                            fontStyle: TextFormFieldFontStyle.InterSemiBold14,
                            textInputType: TextInputType.number,
                            alignment: Alignment.center),
                        CustomButton(
                            height: getVerticalSize(56),
                            text: "Update Property",
                            margin: getMargin(left: 38, top: 25, right: 38, bottom: 25),
                            shape: ButtonShape.CircleBorder12,
                            padding: ButtonPadding.PaddingAll19,
                            fontStyle: ButtonFontStyle.InterBold16WhiteA700,
                            onTap: () {
                              final docProperty = FirebaseFirestore.instance.collection('rental_property').doc(property.property_id);

                              Map<String, Object> updateData = {};

                              if (nameController.text == "") {
                                updateData['property_name'] = property.property_name;
                              } else {
                                updateData['property_name'] = nameController.text;
                              }

                              if (addressController.text == "") {
                                updateData['property_address'] = property.property_address;
                              } else {
                                updateData['property_address'] = addressController.text;
                              }

                              if (descriptionController.text == "") {
                                updateData['property_description'] = property.property_description;
                              } else {
                                updateData['property_description'] = descriptionController.text;
                              }

                              if (int.parse(priceController.text) == property.property_price) {
                                updateData['property_price'] = property.property_price;
                              } else {
                                updateData['property_price'] = int.parse(priceController.text);
                              }

                              if (number.toString() == "0") {
                                updateData['property_bedroom'] = property.property_bedroom;
                              } else {
                                updateData['property_bedroom'] = number.toString();
                              }

                              if (number2.toString() == "0") {
                                updateData['property_bathroom'] = property.property_bathroom;
                              } else {
                                updateData['property_bathroom'] = number2.toString();
                              }

                              if (property.air_conditioner == true) {
                                updateData['air_conditioner'] = property.air_conditioner;
                              } else {
                                updateData['air_conditioner'] = pressedAc;
                              }

                              if (property.washing_machine == true) {
                                updateData['washing_machine'] = property.washing_machine;
                              } else {
                                updateData['washing_machine'] = pressedWm;
                              }

                              if (property.fridge == true) {
                                updateData['fridge'] = property.fridge;
                              } else {
                                updateData['fridge'] = pressedFg;
                              }

                              if (property.gas_stove == true) {
                                updateData['gas_stove'] = property.gas_stove;
                              } else {
                                updateData['gas_stove'] = pressedGs;
                              }

                              if (property.wifi == true) {
                                updateData['wifi'] = property.wifi;
                              } else {
                                updateData['wifi'] = pressedWf;
                              }

                              if (property.kettle == true) {
                                updateData['kettle'] = property.kettle;
                              } else {
                                updateData['kettle'] = pressedKt;
                              }

                              if (property.rice_cooker == true) {
                                updateData['rice_cooker'] = property.rice_cooker;
                              } else {
                                updateData['rice_cooker'] = pressedRc;
                              }

                              if (property.clothes_hanger == true) {
                                updateData['clothes_hanger'] = property.clothes_hanger;
                              } else {
                                updateData['clothes_hanger'] = pressedCh;
                              }

                              if (property.study_table == true) {
                                updateData['study_table'] = property.study_table;
                              } else {
                                updateData['study_table'] = pressedSt;
                              }

                              if (property.dining_table == true) {
                                updateData['dining_table'] = property.dining_table;
                              } else {
                                updateData['dining_table'] = pressedDt;
                              }

                              if (property.locker == true) {
                                updateData['locker'] = property.locker;
                              } else {
                                updateData['locker'] = pressedLk;
                              }

                              docProperty.update(updateData);

                              onTapUpdateproperty(context);
                              _trackEvent('button_clicked');
                            },

                            alignment: Alignment.center,
                        ),
                      ]
                  )
              )
          )
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
  }
*/
  final String? propertyIdArg =
  ModalRoute.of(context)?.settings.arguments as String?;
  print('Property ID: $propertyIdArg');

  return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.gray5003,
         resizeToAvoidBottomInset: false,
         body:  FutureBuilder<Rental_Property?>(
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

onTapUpdateproperty(BuildContext context) { Navigator.pushNamed(context, AppRoutes.updatePropertySuccessfullyScreen); }
onTapIcback(BuildContext context) { Navigator.pushNamed(context, AppRoutes.detailsHouseRentalScreen); }
  onTapHomeicon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homeHouseOwnerScreen); }
  onTapExploreicon(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.scheduledRequestedScreen); }
  onTapButton(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.addHouseRentalScreen); }
  onTapChat(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.chatOwnerScreen); }
  onTapProfile(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileHouseOwnerScreen); }
 }
