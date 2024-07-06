import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
// import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';
import 'package:homecampus/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class CustomPhoneNumber extends StatelessWidget {
  CustomPhoneNumber({
    required this.country,
    required this.onTap,
    required this.controller,
  });

  Country country;

  Function(Country) onTap;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            _openCountryPicker(context);
          },
          child: Padding(
            padding: getPadding(
              left: 2,
              bottom: 7,
            ),
            child: Text(
              "+${country.phoneCode}",
              style: AppStyle.txtPoppinsBold18,
            ),
          ),
        ),
        Expanded(
          child: CustomTextFormField(
            width: getHorizontalSize(
              176,
            ),
            focusNode: FocusNode(),
            autofocus: true,
            controller: controller,
            hintText: "81    4432     9692",
            variant: TextFormFieldVariant.UnderLineIndigoA100,
            fontStyle: TextFormFieldFontStyle.PoppinsBold18,
          ),
        ),
      ],
    );
  }

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          Container(
            margin: EdgeInsets.only(
              left: getHorizontalSize(10),
            ),
            width: getHorizontalSize(60.0),
            child: Text(
              "+${country.phoneCode}",
              style: TextStyle(fontSize: getFontSize(14)),
            ),
          ),
          const SizedBox(width: 8.0),
          Flexible(
            child: Text(
              country.name,
              style: TextStyle(fontSize: getFontSize(14)),
            ),
          ),
        ],
      );
  void _openCountryPicker(BuildContext context) => showDialog(
        context: context,
        builder: (context) => CountryPickerDialog(
          searchInputDecoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(fontSize: getFontSize(14)),
          ),
          isSearchable: true,
          title: Text('Select your phone code',
              style: TextStyle(fontSize: getFontSize(14))),
          onValuePicked: (Country country) => onTap(country),
          itemBuilder: _buildDialogItem,
        ),
      );
}
