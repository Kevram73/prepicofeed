import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:prepicofeed/calculation/result_model.dart';
import 'package:prepicofeed/calculation/result_page.dart';
import 'package:prepicofeed/components/custom_button.dart';

import '../../../components/text_form_field.dart';
import '../../../utils/constants.dart';
import 'package:prepicofeed/data/enums.dart';

class EditWidget extends StatefulWidget {
  final String fishType,fishGrow ;
  final double fishWeight;

  const EditWidget({Key? key, required this.fishType, required this.fishGrow, required this.fishWeight}) : super(key: key);

  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {

  Result? result;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _tmpController = TextEditingController();
  final _weightController = TextEditingController();
  final _fishnoController = TextEditingController();
  final _feedindDaysController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _weightController.text = widget.fishWeight.toString();
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child:Container(
                        width: 110,
                        height: 110,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kColorPrimaryLight,
                        ),
                        child:CircleAvatar(
                          backgroundColor: kColorPrimary,
                          child: Image.asset(
                            height: 70,
                            widget.fishType == fishType.tilapia.name ? 'assets/images/tilapia_icon.png' :'assets/images/silure_icon.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 25,
                    ),

                    Text(
                      'water_temperature_at_0800_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _tmpController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText:'required'.tr()),
                        FormBuilderValidators.min(20,errorText: "${'must_between'.tr()} 20-34"),
                        FormBuilderValidators.max(34,errorText: "${'must_between'.tr()} 20-34"),
                      ]),
                    ),
                    SizedBox(height: 15),

                    Text(
                      'average_weight_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_g'.tr(),
                      enabled: false,
                    ),
                    SizedBox(height: 15),
                    (fishGrow.larvae.name == widget.fishGrow) ? Text(
                      'feeding_days_dot'.tr(),
                      style: kInputTextStyle,
                    ) : Container(),
                    (fishGrow.larvae.name == widget.fishGrow) ? CustomTextFormField(
                      controller: _feedindDaysController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: (fishType.catfish.name==widget.fishType)?FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText:'required'.tr() ),
                        FormBuilderValidators.min(1,errorText: "${'must_between'.tr()} 1-20"),
                        FormBuilderValidators.max(20,errorText: "${'must_between'.tr()} 1-20"),
                      ]):FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText:'required'.tr() ),
                      ]),
                    ): Container(),
                    SizedBox(height: 15),
                    Text(
                      'estimated_fish_no_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _fishnoController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText:'required'.tr() ),
                        FormBuilderValidators.min(1,errorText: "${'must_between'.tr()} 1-49999"),
                        FormBuilderValidators.max(49999,errorText: "${'must_between'.tr()} 1-49999"),
                      ]),
                    ),
                  ],
                ),
              ),
            ) ,
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: CustomButton(
            onPressed: () { _calculate();},
            text: 'calculate'.tr(),
          ),
        )
      ],
    );
      
  }

  _calculate(){
    if (_formKey.currentState!.validate()) {

      if(widget.fishType == fishType.tilapia.name){

        if(widget.fishGrow == fishGrow.growout.name) {
          _calcTilapiaGrowOut();
        } else if(widget.fishGrow == fishGrow.intermediate.name) {
          _calcTilapiaItermediate();
        } else {
          _calcTilapiaLarvae();
        }

      }else{

        if(widget.fishGrow == fishGrow.growout.name) {
          _calcCatfishGrowOut();
        } else if(widget.fishGrow == fishGrow.intermediate.name) {
          _calcCatfishItermediate();
        } else {
          _calcCatfishLarvae();
        }

      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage(result: result!,fishType: widget.fishType, fishGrow: widget.fishGrow)),
      );
    }

  }

  Result _calcTilapiaItermediate(){
    int fishNo = int.parse(_fishnoController.text);
    double biomas_g = double.parse(_weightController.text)*double.parse(_fishnoController.text);
    double biomas_kg = double.parse(_weightController.text)*int.parse(_fishnoController.text)/1000;
    double feedingRate = (-1.535*log(double.parse(_weightController.text)) + 8.067);
    double feedWeightDay = ((feedingRate/100) * getTilapiaWtCoef(double.parse(_tmpController.text)) * biomas_g)/1000;
    result = Result(int.parse(_tmpController.text),getTilapiaWtCoef(double.parse(_tmpController.text)),"0.5 - 1mm", 4, widget.fishWeight, feedWeightDay, fishNo,biomas_g.toInt(), feedingRate);
    return result!;
  }

  Result _calcTilapiaGrowOut(){
    int fishNo = int.parse(_fishnoController.text);
    double biomas_g = double.parse(_weightController.text)*double.parse(_fishnoController.text);
    double biomas_kg = double.parse(_weightController.text)*int.parse(_fishnoController.text)/1000;
    double feedingRate = (-0.923*log(double.parse(_weightController.text)) + 7.464);
    double feedWeightDay = ((feedingRate/100) * getTilapiaWtCoef(double.parse(_tmpController.text)) * biomas_g)/1000;
    result = Result(int.parse(_tmpController.text),getTilapiaWtCoef(double.parse(_tmpController.text)),getTilapiaGrowOutFeedSize(widget.fishWeight), 3, widget.fishWeight, feedWeightDay, fishNo,biomas_kg.toInt(), feedingRate);
    return result!;
  }

  Result _calcTilapiaLarvae(){
    int fishNo = int.parse(_fishnoController.text);
    double biomas = double.parse(_weightController.text)*double.parse(_fishnoController.text);
    double feedingRate = 0;
    double feedWeightDay = (35.44*exp(0.0796*int.parse(_feedindDaysController.text)))*(double.parse(_fishnoController.text)/10000);
    result = Result(int.parse(_tmpController.text),getTilapiaWtCoef(double.parse(_tmpController.text)),"-", 8, widget.fishWeight, feedWeightDay, fishNo,biomas.toInt(), feedingRate);
    return result!;
  }

  Result _calcCatfishItermediate(){
    int fishNo = int.parse(_fishnoController.text);
    double biomas_g = double.parse(_weightController.text)*double.parse(_fishnoController.text);
    double biomas_kg = double.parse(_weightController.text)*int.parse(_fishnoController.text)/1000;
    double feedingRate = (-1.013*log(double.parse(_weightController.text)) + 7.9038);
    double feedWeightDay = ((feedingRate/100) * getTilapiaWtCoef(double.parse(_tmpController.text)) * biomas_g)/1000;
    result = Result(int.parse(_tmpController.text),getTilapiaWtCoef(double.parse(_tmpController.text)),getCatfishFeedSize(widget.fishWeight), 4, widget.fishWeight, feedWeightDay, fishNo,biomas_g.toInt(), feedingRate);
    return result!;
  }

  Result _calcCatfishGrowOut(){
    int fishNo = int.parse(_fishnoController.text);
    double biomas_g = double.parse(_weightController.text)*double.parse(_fishnoController.text);
    double biomas_kg = double.parse(_weightController.text)*int.parse(_fishnoController.text)/1000;
    double feedingRate = (-0.985*log(double.parse(_weightController.text)) + 8.2062);
    double feedWeightDay = ((feedingRate/100) * getTilapiaWtCoef(double.parse(_tmpController.text)) * biomas_g)/1000;
    result = Result(int.parse(_tmpController.text),getTilapiaWtCoef(double.parse(_tmpController.text)),getTilapiaGrowOutFeedSize(widget.fishWeight), 2, widget.fishWeight, feedWeightDay, fishNo,biomas_kg.toInt(), feedingRate);
    return result!;
  }

  Result _calcCatfishLarvae(){
    int fishNo = int.parse(_fishnoController.text);
    double biomas = double.parse(_weightController.text)*double.parse(_fishnoController.text);
    double feedingRate = 0;
    double feedWeightDay = (25.479*exp(0.0888*int.parse(_feedindDaysController.text)))*(double.parse(_fishnoController.text)/10000);
    result = Result(int.parse(_tmpController.text),getTilapiaWtCoef(double.parse(_tmpController.text)),"-", 8, widget.fishWeight, feedWeightDay, fishNo,biomas.toInt(), feedingRate);
    return result!;
  }


  double getTilapiaWtCoef(double wt){

    if(20 <= wt && wt < 23) {
      return 0.4;
    }
    if(23 <= wt && wt < 25) {
      return 0.6;
    }
    if(25 <= wt && wt < 26) {
      return 0.8;
    }
    if(26 <= wt && wt < 28) {
      return 1;
    }
    if(28 <= wt && wt < 30) {
      return 1;
    }
    if(30 <= wt && wt < 32) {
      return 1;
    }
    if(32 <= wt && wt < 34) {
      return 0.9;
    }
    if(34 <= wt && wt < 35) {
      return 0.8;
    }

    return 0;
  }

  double getCatfishWtCoef(double wt){

    if(25 <= wt && wt < 26) {
      return 0.8;
    }
    if(26 <= wt && wt < 28) {
      return 0.9;
    }
    if(28 <= wt && wt < 30) {
      return 1;
    }
    if(30 <= wt && wt < 32) {
      return 1;
    }
    if(32 <= wt && wt < 34) {
      return 0.9;
    }
    if(34 <= wt && wt < 35) {
      return 0.8;
    }

    return 0;
  }


  String getTilapiaGrowOutFeedSize(double pm){

    if(2 < pm && pm <= 20) {
      return "1mm";
    }
    if(20 < pm && pm <= 60) {
      return "2 - 3mm";
    }
    if(60 < pm && pm <= 250) {
      return "4 - 4.5mm";
    }
    if(250 < pm) {
      return "6mm";
    }

    return "0mm";

  }

  String getCatfishFeedSize(double pm){

    if(0.2 < pm && pm <= 1) {
      return "0.5 - 1mm";
    }
    if(1 < pm && pm <= 5) {
      return "1 - 1.5mm";
    }
    if(5 < pm && pm <= 20) {
      return "1.5mm";
    }
    if(20 < pm && pm <= 60) {
      return "2 - 3mm";
    }
    if(60 < pm && pm <= 250) {
      return "3 - 4.5mm";
    }
    if(250 < pm) {
      return "6mm";
    }

    return "0mm";

  }

}
