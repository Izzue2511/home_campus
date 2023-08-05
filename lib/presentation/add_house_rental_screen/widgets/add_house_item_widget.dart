import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

class AddHouseItemWidget extends StatefulWidget {
  final int initialNumber;
  final Future<int>? Function(int) onNumberChange;
  const AddHouseItemWidget(
      {Key? key, required this.initialNumber, required this.onNumberChange})
      : super(key: key);
  @override
  _AddHouseItemWidgetState createState() => _AddHouseItemWidgetState(number: initialNumber);

}

class _AddHouseItemWidgetState extends State<AddHouseItemWidget> {
  int number;
  bool isSaving = false;
  _AddHouseItemWidgetState({required this.number});

  void changeNumber(int newNumber) async {
    setState(() {
      isSaving = true;
    });
    newNumber = await widget.onNumberChange(newNumber) ?? newNumber;
    setState(() {
      number = newNumber;
      isSaving = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(
          left: 15,
          top: 20,
          right: 15,
          bottom: 20,
        ),
        decoration: AppDecoration.fillGray10001.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder26,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: getPadding(
                left: 1,
                top: 8,
                bottom: 6,
              ),
              child: Text(
                "Bedroom",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtLatoSemiBold16.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.36,
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              height: getSize(
                30,
              ),
              width: getSize(
                30,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgCloseIndigoA100,
                    height: getSize(
                      30,
                    ),
                    width: getSize(
                      30,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        9,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  GestureDetector(
                    onTap: (isSaving || number < 1)
                        ? null
                        : () => changeNumber(number - 1),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgIconminus,
                      height: getSize(
                        10,
                      ),
                      width: getSize(
                        10,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: getPadding(
                left: 18,
                top: 5,
                bottom: 4,
              ),
              child: Text(
                number.toString(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtLatoSemiBold16.copyWith(
                  letterSpacing: getHorizontalSize(
                    0.48,
                  ),
                ),
              ),
            ),
            Container(
              height: getSize(
                30,
              ),
              width: getSize(
                30,
              ),
              margin: getMargin(
                left: 18,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomImageView(
                    svgPath: ImageConstant.imgCloseIndigoA100,
                    height: getSize(
                      30,
                    ),
                    width: getSize(
                      30,
                    ),
                    radius: BorderRadius.circular(
                      getHorizontalSize(
                        9,
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                  GestureDetector(
                    onTap: (isSaving) ? null : () => changeNumber(number + 1),
                    child: CustomImageView(
                      svgPath: ImageConstant.imgPlusWhiteA700,
                      height: getSize(
                        10,
                      ),
                      width: getSize(
                        10,
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
