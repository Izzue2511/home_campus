import 'package:flutter/material.dart';
import 'package:homecampus/core/app_export.dart';

class AddHouseItemWidget2 extends StatefulWidget {
  final int initialNumber2;
  final Future<int>? Function(int) onNumberChange2;
  const AddHouseItemWidget2(
      {Key? key, required this.initialNumber2, required this.onNumberChange2})
      : super(key: key);
  @override
  _AddHouseItemWidget2State createState() => _AddHouseItemWidget2State(number2: initialNumber2);

}

class _AddHouseItemWidget2State extends State<AddHouseItemWidget2> {
  TextEditingController bathroomController = TextEditingController();

  int number2;
  bool isSaving = false;
  _AddHouseItemWidget2State({required this.number2});

  void changeNumber(int newNumber2) async {
    setState(() {
      isSaving = true;
    });
    newNumber2 = await widget.onNumberChange2(newNumber2) ?? newNumber2;
    setState(() {
      number2 = newNumber2;
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
                "Bathroom",
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
                    onTap: (isSaving || number2 < 1)
                        ? null
                        : () => changeNumber(number2 - 1),
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
                number2.toString(),
                //controller: bathroomController,
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
                    onTap: (isSaving) ? null : () => changeNumber(number2 + 1),
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
