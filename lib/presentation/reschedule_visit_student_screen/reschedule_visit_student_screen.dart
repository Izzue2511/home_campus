import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/app_bar/appbar_iconbutton.dart';
import 'package:homecampus/widgets/app_bar/appbar_subtitle.dart';
import 'package:homecampus/widgets/app_bar/custom_app_bar.dart';
import 'package:homecampus/widgets/custom_button.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore_for_file: must_be_immutable

class RescheduleVisitStudentScreen extends StatefulWidget {
  @override
  _RescheduleVisitStudentScreenState createState() => _RescheduleVisitStudentScreenState();

}

class PropertySchedule {
  final Rental_Property property;
  final Schedule_Visit schedule;

  PropertySchedule(this.property, this.schedule);
}

class Rental_Property{
  String property_id;
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

  Rental_Property({
    this.property_id = '',
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
  });

  Map<String, dynamic> toJson() => {
    'property_id': property_id,
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
  };

  static Rental_Property fromJson(Map<String, dynamic> json) => Rental_Property(
      property_id: json['property_id'],
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
      locker: json['locker']
  );
}

class Schedule_Visit{
  String schedule_id;
  final String client_name;
  final String client_email;
  final String client_phone;
  final String schedule_time;
  final String schedule_date;
  final String schedule_status;

  Schedule_Visit({
    this.schedule_id = '',
    required this.client_name,
    required this.client_email,
    required this.client_phone,
    required this.schedule_time,
    required this.schedule_date,
    required this.schedule_status,
  });

  Map<String, dynamic> toJson() => {
    'schedule_id': schedule_id,
    'client_name': client_name,
    'client_email': client_email,
    'client_phone': client_phone,
    'schedule_time': schedule_time,
    'schedule_date': schedule_date,
    'schedule_status': schedule_status,
  };

  static Schedule_Visit fromJson(Map<String, dynamic> json) => Schedule_Visit(
    schedule_id: json['schedule_id'],
    client_name: json['client_name'],
    client_email: json['client_email'],
    client_phone: json['client_phone'],
    schedule_time: json['schedule_time'],
    schedule_date: json['schedule_date'],
    schedule_status: json['schedule_status'],
  );
}

class _RescheduleVisitStudentScreenState extends State<RescheduleVisitStudentScreen> {

  final user = FirebaseAuth.instance.currentUser!;

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TimeOfDay _timeOfDay = TimeOfDay.now();
  DateTime _dateTime = DateTime.now();

  void _showTimePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

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

  Widget buildSchedule (Rental_Property property, Schedule_Visit schedule) => Form(
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
                                  onTap: () {onTapIcback4(context);}),
                              centerTitle: true,
                              title: AppbarSubtitle(
                                  text: "Schedule Visit")
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                                  padding: getPadding(top: 15),
                                  child: Container(
                                      margin: getMargin(bottom: 40),
                                      padding: getPadding(left: 39, right: 39),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: getMargin(right: 1),
                                                padding: getPadding(top: 20, bottom: 20),
                                                decoration: AppDecoration.outlineGray40066.copyWith(borderRadius: BorderRadiusStyle.roundedBorder18),
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [CustomImageView(
                                                        imagePath: ImageConstant.imgUnsplash2d4laqalbda,
                                                        height: getVerticalSize(135),
                                                        width: getHorizontalSize(130),
                                                        radius: BorderRadius.circular(
                                                            getHorizontalSize(20))),
                                                      Padding(
                                                          padding: getPadding(bottom: 6),
                                                          child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [Row(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [CustomImageView(
                                                                      svgPath: ImageConstant.imgStarOrange200,
                                                                      height: getSize(12),
                                                                      width: getSize(12),
                                                                      margin: getMargin(top: 3, bottom: 4)),
                                                                    Padding(
                                                                        padding: getPadding(left: 6),
                                                                        child: RichText(
                                                                            text: TextSpan(
                                                                                children: [TextSpan(
                                                                                    text: "4.8",
                                                                                    style: TextStyle(
                                                                                        color: ColorConstant.gray90001,
                                                                                        fontSize: getFontSize(12),
                                                                                        fontFamily: 'Hind',
                                                                                        fontWeight: FontWeight.w400)
                                                                                ),
                                                                                ]
                                                                            ),
                                                                            textAlign: TextAlign.left)
                                                                    )
                                                                  ]
                                                              ),
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
                                                                    padding: getPadding(top: 16),
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
                                                                        textAlign: TextAlign.left))]))])),
                                            Padding(
                                                padding: getPadding(top: 24),
                                                child: Text(
                                                    "Enter Details",
                                                    overflow: TextOverflow.ellipsis,
                                                    textAlign: TextAlign.left,
                                                    style: AppStyle.txtRubikMedium16)),
                                            CustomTextFormField(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller: nameController,
                                                hintText: schedule.client_name,
                                                margin: getMargin(top: 20),
                                                variant: TextFormFieldVariant.OutlineBluegray9007f,
                                                shape: TextFormFieldShape.RoundedBorder6,
                                                fontStyle: TextFormFieldFontStyle.RubikLight14),
                                            CustomTextFormField(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller: emailController,
                                                hintText: schedule.client_email,
                                                margin: getMargin(top: 20),
                                                variant: TextFormFieldVariant.OutlineBluegray9007f,
                                                fontStyle: TextFormFieldFontStyle.RubikLight14,
                                                textInputType: TextInputType.emailAddress),
                                            CustomTextFormField(
                                                focusNode: FocusNode(),
                                                autofocus: true,
                                                controller: phoneController,
                                                hintText: schedule.client_phone,
                                                margin: getMargin(top: 20),
                                                variant: TextFormFieldVariant.OutlineBluegray9007f,
                                                fontStyle: TextFormFieldFontStyle.RubikLight14,
                                                textInputAction: TextInputAction.done,
                                                textInputType: TextInputType.phone),
                                            GestureDetector(onTap: _showDatePicker,
                                                child: Container(
                                                    margin: getMargin(top: 20),
                                                    padding: getPadding(top: 10, bottom: 10),
                                                    decoration: AppDecoration.outlineGray30001.copyWith(borderRadius: BorderRadiusStyle.circleBorder26),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [Container(
                                                          width: 45,
                                                          height: 45,
                                                          child: IconButton(
                                                            icon: Icon(
                                                              Icons.calendar_month,
                                                              color: Colors.deepPurpleAccent.withOpacity(0.8),
                                                              size: 35, // Adjust the size according to your preference
                                                            ),
                                                            onPressed: () {
                                                              // Add your phone button logic here
                                                            },
                                                          ),
                                                        ),
                                                          Padding(
                                                              padding: getPadding(top: 5),
                                                              child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [Text(
                                                                      "Schedule Date",
                                                                      overflow: TextOverflow.ellipsis,
                                                                      textAlign: TextAlign.left,
                                                                      style: AppStyle.txtNunitoSansRegular14),
                                                                    Padding(
                                                                        padding: getPadding(top: 5),
                                                                        child: Text(
                                                                            _dateTime.format().toString(),
                                                                            overflow: TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtNunitoSansBold17.copyWith(letterSpacing: getHorizontalSize(0.17)))
                                                                    )
                                                                  ]
                                                              )
                                                          ),
                                                          CustomImageView(
                                                              svgPath: ImageConstant.imgArrowright,
                                                              height: getSize(33),
                                                              width: getSize(33),
                                                              margin: getMargin(top: 10,
                                                                  bottom: 5))
                                                        ]
                                                    )
                                                )
                                            ),
                                            GestureDetector(onTap: _showTimePicker,
                                                child: Container(
                                                    margin: getMargin(top: 20),
                                                    padding: getPadding(top: 10, bottom: 10),
                                                    decoration: AppDecoration.outlineGray30001.copyWith(borderRadius: BorderRadiusStyle.circleBorder26),
                                                    child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [Container(
                                                          width: 45,
                                                          height: 45,
                                                          child: IconButton(
                                                            icon: Icon(
                                                              Icons.watch_later,
                                                              color: Colors.deepPurpleAccent.withOpacity(0.8),
                                                              size: 35, // Adjust the size according to your preference
                                                            ),
                                                            onPressed: () {
                                                              // Add your phone button logic here
                                                            },
                                                          ),
                                                        ),
                                                          Padding(
                                                              padding: getPadding(top: 5),
                                                              child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  children: [Text(
                                                                      "Schedule Time",
                                                                      overflow: TextOverflow.ellipsis,
                                                                      textAlign: TextAlign.left,
                                                                      style: AppStyle.txtNunitoSansRegular14),
                                                                    Padding(
                                                                        padding: getPadding(top: 5),
                                                                        child: Text(
                                                                            _timeOfDay.format(context).toString(),
                                                                            overflow: TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.left,
                                                                            style: AppStyle.txtNunitoSansBold17.copyWith(letterSpacing: getHorizontalSize(0.17)))
                                                                    )
                                                                  ]
                                                              )
                                                          ),
                                                          CustomImageView(
                                                              svgPath: ImageConstant.imgArrowright,
                                                              height: getSize(33),
                                                              width: getSize(33),
                                                              margin: getMargin(top: 10,
                                                                  bottom: 5))
                                                        ]
                                                    )
                                                )
                                            ),
                                            CustomButton(
                                                height: getVerticalSize(54),
                                                text: "Update Schedule",
                                                margin: getMargin(top: 33),
                                                fontStyle: ButtonFontStyle.RubikMedium18,
                                                onTap: () {
                                                  final docSchedule = FirebaseFirestore.instance.collection('schedule_visit').doc('G3ST5phGfxFOtP19QXeu');

                                                  Map<String, Object> updateData = {};
                                                  /*
                                                  final schedule = Schedule_Visit(
                                                    client_name: nameController.text,
                                                    client_email: emailController.text,
                                                    client_phone: phoneController.text,
                                                    schedule_time: _timeOfDay.format(context).toString(),
                                                    schedule_date: _dateTime.format().toString(),
                                                    schedule_status: "Requested",
                                                  );*/

                                                  if (nameController.text == "") {
                                                    updateData['client_name'] = schedule.client_name;
                                                  } else {
                                                    updateData['client_name'] = nameController.text;
                                                  }

                                                  if (emailController.text == "") {
                                                    updateData['client_email'] = schedule.client_email;
                                                  } else {
                                                    updateData['client_email'] = emailController.text;
                                                  }

                                                  if (phoneController.text == "") {
                                                    updateData['client_phone'] = schedule.client_phone;
                                                  } else {
                                                    updateData['client_phone'] = phoneController.text;
                                                  }

                                                  if (_dateTime.format().toString() == schedule.schedule_date) {
                                                    updateData['schedule_date'] = schedule.schedule_date;
                                                  } else {
                                                    updateData['schedule_date'] = _dateTime.format().toString();
                                                  }

                                                  if (_timeOfDay.format(context).toString() == schedule.schedule_time) {
                                                    updateData['schedule_time'] = schedule.schedule_time;
                                                  } else {
                                                    updateData['schedule_time'] = _timeOfDay.format(context).toString();
                                                  }

                                                  docSchedule.update(updateData);

                                                  onTapUpdateschedule(context);

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

  Future<PropertySchedule?> readSchedule() async {
    final docSchedule =
    FirebaseFirestore.instance.collection('schedule_visit').doc('G3ST5phGfxFOtP19QXeu');
    final scheduleSnapshot = await docSchedule.get();
    final docProperty =
    FirebaseFirestore.instance.collection('rental_property').doc('dzD9KzN5ivA1a53LTKBM');
    final propertySnapshot = await docProperty.get();

    if (scheduleSnapshot.exists && propertySnapshot.exists) {
      final schedule = Schedule_Visit.fromJson(scheduleSnapshot.data()!);
      final property = Rental_Property.fromJson(propertySnapshot.data()!);
      return PropertySchedule(property, schedule);
    }
  }

@override
Widget build(
    BuildContext context) {
 return SafeArea(
     child: Scaffold(
         backgroundColor: ColorConstant.whiteA700,
         resizeToAvoidBottomInset: false,
         body:  FutureBuilder<PropertySchedule?>(
           future: readSchedule(),
           builder: (context, snapshot) {
             if (snapshot.hasError) {
               return Text('Something went wrong! ${snapshot.error}');
             } else if (snapshot.hasData) {
               final propertySchedule = snapshot.data;
               if (propertySchedule == null) {
                 return Center(child: Text('No Schedule Visit'));
               }
               final property = propertySchedule.property;
               final schedule = propertySchedule.schedule;

               return buildSchedule(property, schedule);
             } else {
               return Center(child: CircularProgressIndicator());
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

onTapIcback4(BuildContext context) { Navigator.pushNamed(
    context, AppRoutes.scheduleVisitDetailsStudentScreen); }
onTapUpdateschedule(BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
  onTapHome(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.homeStudentScreen); }
  onTapSchedule(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledStatusPage); }
  onTapSaved(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.savedPage); }
  onTapChat(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.chatScreen); }
  onTapProfile(
      BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileStudentScreen); }
 }
