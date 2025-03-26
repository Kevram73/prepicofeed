import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prepicofeed/calculation/edit_widget.dart';
import 'package:prepicofeed/calculation/result_model.dart';
import 'package:prepicofeed/calculation/result_widget.dart';
import 'package:prepicofeed/components/custom_button.dart';
import 'package:prepicofeed/data/enums.dart';
import 'package:prepicofeed/feedbuyprogram/buy_edit_widget.dart';
import 'package:prepicofeed/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class BuyCalculationPage extends StatefulWidget {



  final String fishType;
  const BuyCalculationPage({Key? key, required this.fishType}) : super(key: key);

  @override
  State<BuyCalculationPage> createState() => _BuyCalculationPageState();
}

class _BuyCalculationPageState extends State<BuyCalculationPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.fishType == fishType.tilapia.name ? Text('calculation_food_buy_tilapia'.tr()):Text('calculation_food_buy_silure'.tr()),

      ),
      body: BuyEditWidget(fishType: widget.fishType),
    );
  }


}
