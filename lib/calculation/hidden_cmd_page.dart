import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:prepicofeed/calculation/hidden_cmd_model.dart';
import 'package:prepicofeed/utils/constants.dart';
import 'package:prepicofeed/data/enums.dart';


class HiddenCommand extends StatelessWidget {
  final String fishTyp, fishGro;
  final double? wtCoef;
  final int? wt;
  final int? fishNo;
  final double? weightStart;
  const HiddenCommand({Key? key,required this.fishTyp, required this.fishGro, this.wtCoef, this.wt, this.fishNo, this.weightStart,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hidden_cmd'.tr()),

      ),
      body: HiddenCmd(),
    );
  }

  Widget HiddenCmd(){
      return HiddenCmdWidget();

  }

  Widget HiddenCmdWidget(){

    CmdWeek week1 = CmdWeek(fishTyp,fishGro,wt,wtCoef,weightStart,fishNo);
    CmdWeek week2 = CmdWeek(fishTyp,fishGro,wt,wtCoef,week1.weightEnd,fishNo);
    CmdWeek week3 = CmdWeek(fishTyp,fishGro,wt,wtCoef,week2.weightEnd,fishNo);
    CmdWeek week4 = CmdWeek(fishTyp,fishGro,wt,wtCoef,week3.weightEnd,fishNo);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5),
          width: 320,
          color: kColorPrimary,
          child: Text(
            'week'.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
        ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                '1',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                '2',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                '3',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                '4',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5),
          width: 320,
          color: kColorPrimary,
          child: Text(
            'wt'.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                wt.toString(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                wt.toString(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                wt.toString(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                wt.toString(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5),
          width: 320,
          color: kColorPrimary,
          child: Text(
            'pm_at_the_beginning_of_the_week_(A)'.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week1.weightStart),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week2.weightStart),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week3.weightStart),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week4.weightStart),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5),
          width: 320,
          color: kColorPrimary,
          child: Text(
            'no'.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
              numberFormatter2().format(fishNo),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter2().format(fishNo),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter2().format(fishNo),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter2().format(fishNo),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5),
          width: 320,
          color: kColorPrimary,
          child: Text(
            'biomasse_(kg)'.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week1.biomas),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week2.biomas),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week3.biomas),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week4.biomas),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(5),
          width: 320,
          color: kColorPrimary,
          child: Text(
            'quantite_d_aliment_a_distribuer_par_jour_(kg)_(With_water_temperature_correction)'.tr(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week1.feedWeightDay),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week2.feedWeightDay),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week3.feedWeightDay),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              height: 35,
              width: 80,
              color: kColorPrimaryLight,
              child: Text(
                numberFormatter3().format(week4.feedWeightDay),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }


}
