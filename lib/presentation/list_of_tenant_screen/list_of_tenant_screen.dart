import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
// import 'package:homecampus/widgets/custom_button.dart';
// import 'package:homecampus/widgets/custom_drop_down.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:homecampus/core/utils/user_provider.dart';
// import 'package:homecampus/routes/app_routes.dart';
// ignore_for_file: must_be_immutable

class ListOfTenantScreen extends StatefulWidget {
  @override
  _ListOfTenantScreenState createState() => _ListOfTenantScreenState();
}

class Tenant{
  String tenant_id;
  final String tenant_name;
  final String tenant_address;
  final String tenant_email;
  final String tenant_phone;
  final String tenant_matricNum;
  final String tenant_password;

  Tenant({
    this.tenant_id = '',
    required this.tenant_name,
    required this.tenant_address,
    required this.tenant_email,
    required this.tenant_phone,
    required this.tenant_matricNum,
    required this.tenant_password,
  });

  Map<String, dynamic> toJson() => {
    'tenant_id': tenant_id,
    'tenant_name': tenant_name,
    'tenant_address': tenant_address,
    'tenant_email': tenant_email,
    'tenant_phone': tenant_phone,
    'tenant_matricNum': tenant_matricNum,
    'tenant_password': tenant_password,
  };

  static Tenant fromJson(Map<String, dynamic> json) => Tenant(
    tenant_id: json['tenant_id'],
    tenant_name: json['tenant_name'],
    tenant_address: json['tenant_address'],
    tenant_email: json['tenant_email'],
    tenant_phone: json['tenant_phone'],
    tenant_matricNum: json['tenant_matricNum'],
    tenant_password: json['tenant_password'],
  );
}

class _ListOfTenantScreenState extends State<ListOfTenantScreen> {

  TextEditingController searchController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser;
  String? tenantId; // Remove the existing declaration

  @override
  void initState() {
    super.initState();
    inputData();
    searchController.addListener(onSearchTextChanged);
  }

  void onSearchTextChanged() {
    setState(() {});
  }

  List<Tenant> filterProperties(List<Tenant> tenants, String keyword) {
    return tenants.where((tenant) {
      // Perform filtering based on multiple criteria
      bool nameMatch = tenant.tenant_name.toLowerCase().contains(keyword.toLowerCase());
      // Return true if any of the filtering criteria match
      return nameMatch;
    }).toList();
  }

  void inputData() async {
    //tenantId = Provider.of<UserProvider>(context).tenantId;
    print('Tenant ID: $tenantId'); // Add this line to print the propertyId
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

  void onTapTenantDetails(BuildContext context, String tenantId) {
    print('Selected Tenant ID: $tenantId');
    //Provider.of<UserProvider>(context, listen: false).setTenantId(tenantId);
    Navigator.pushNamed(context, '/admin_rental_property_details_screen', arguments: tenantId);
  }

  Widget buildTenant (Tenant tenant) => Container(
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
                    final tenantId = tenant.tenant_id;
                    onTapTenantDetails(context, tenantId);
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
                                  children: [
                                    Container(
                                      height: getVerticalSize(235),
                                      width: getHorizontalSize(340),
                                    ),
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
                                            tenant.tenant_name,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: AppStyle.txtRalewayMedium16)),
                                      Container(
                                          padding: getPadding(left: 8, top: 4, right: 8, bottom: 4),
                                          decoration: AppDecoration.fillIndigoA100af.copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
                                          child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [Text(
                                                "RM",
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
                                      ),
                                      CustomImageView(
                                          svgPath: ImageConstant.imgIcbath,
                                          height: getSize(20),
                                          width: getSize(20),
                                          margin: getMargin(left: 6,bottom: 1)),
                                      Padding(
                                          padding: getPadding(left: 6, top: 6, bottom: 1),
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

  Stream<List<Tenant>> readTenant() => FirebaseFirestore.instance
      .collection('tenant')
      .snapshots()
      .map((snapshot) =>
        snapshot.docs.map((doc) => Tenant.fromJson(doc.data())).toList());

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
                            height: getVerticalSize(120),
                            width: double.maxFinite,
                            padding: getPadding(left: 33, right: 33),
                            decoration: AppDecoration.gradientIndigoA100IndigoA100,
                            child: Stack(
                                alignment: Alignment.topRight,
                                children: [
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
                                                              hintText: "Search Tenant",
                                                              border: InputBorder.none,
                                                            ),
                                                            style: AppStyle.txtRalewayRegular12Indigo200.copyWith(
                                                                letterSpacing: getHorizontalSize(0.36)),
                                                            // Add any additional properties or controllers for the text field if needed.
                                                          ),
                                                        ),
                                                       Padding(padding: getPadding(left: 21),
                                                           child: SizedBox(
                                                               height: getVerticalSize(36),
                                                               child: VerticalDivider(
                                                                   width: getHorizontalSize(1),
                                                                   thickness: getVerticalSize(1),
                                                                   color: ColorConstant.indigo2006c))),
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
                                     margin: getMargin(left: 14, top: 56, bottom: 0)
                                 ),
                                ]
                            )
                        ),
                         Align(
                             alignment: Alignment.centerLeft,
                             child: Padding(
                                 padding: getPadding(left: 37, top: 12),
                                 child: Text(
                                     "List of Tenant",
                                     overflow: TextOverflow.ellipsis,
                                     textAlign: TextAlign.left,
                                     style: AppStyle.txtPoppinsSemiBold24)
                             )
                         ),
                          StreamBuilder<List<Tenant>>(
                            stream: readTenant(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Text('Something went wrong! ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                final tenantList = snapshot.data!;
                                final filteredList = filterProperties(tenantList, searchController.text);
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: filteredList.length,
                                  itemBuilder: (context, index) {
                                    final tenant = filteredList[index];
                                    return buildTenant(tenant); // Replace with your implementation of buildProperty
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

                        children: [Padding(
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
                             onTap: () {onTapExploreicon(context);},
                             child: Padding(
                                 padding: getPadding(top: 15),
                                 child: Column(
                                     mainAxisSize: MainAxisSize.min,
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     children: [
                                       CustomImageView(
                                         svgPath: ImageConstant.imgCalendar1,
                                         height: getSize(25),
                                         width: getSize(25)),
                                      Padding(
                                          padding: getPadding(top: 2),
                                          child: Text(
                                              "Tenant",
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle.txtHindMedium12))]
                                 )
                             )
                         ),
                          GestureDetector(
                             onTap: () {onTapChat(context);},
                             child:Padding(
                             padding: getPadding(top: 15),
                             child: Column(
                                 mainAxisSize: MainAxisSize.min,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   CustomImageView(
                                     svgPath: ImageConstant.imgCalendar2,
                                     height: getSize(25),
                                     width: getSize(25)),
                                  Padding(
                                      padding: getPadding(top: 2),
                                      child: Text(
                                          "Owner",
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
        //bottom navigator
    )
);
}

onTapImgSearch(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.searchScreenOwnerScreen); }
onTapExploreicon(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.scheduledRequestedScreen); }
onTapChat(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.chatOwnerScreen); }
onTapProfile(
    BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileAdminScreen); }
 }
