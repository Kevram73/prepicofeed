import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:prepicofeed/calculation/result_model.dart';
import 'package:prepicofeed/calculation/result_page.dart';
import 'package:prepicofeed/components/custom_button.dart';
import 'package:prepicofeed/feedbuyprogram/buy_result_model.dart';
import 'package:prepicofeed/feedbuyprogram/buy_result_page.dart';

import '../../../components/text_form_field.dart';
import '../../../utils/constants.dart';
import 'package:prepicofeed/data/enums.dart';

class BuyEditWidget extends StatefulWidget {
  final String fishType;

  const BuyEditWidget({Key? key, required this.fishType}) : super(key: key);

  @override
  _BuyEditWidgetState createState() => _BuyEditWidgetState();
}

class _BuyEditWidgetState extends State<BuyEditWidget> {

  BuyResult? result;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _areaController = TextEditingController();
  final _densityController = TextEditingController();
  final _pondnoController = TextEditingController();
  final _surveRateController = TextEditingController();
  final _alevinSizeController = TextEditingController();
  final _consommationIndiceController = TextEditingController();
  final _daysNoController = TextEditingController();
  final _averageWeightController = TextEditingController();
  final _bagCapacityController = TextEditingController();
  String _etang = "1";
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

                    SizedBox(height: 15),
                    Material(
                      color:  Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color:  Colors.grey,
                              width: 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            RadioListTile(
                              value: "1",
                              onChanged: (value) {
                                setState(() {
                                  _etang = "1";
                                });
                              },
                              groupValue: _etang,
                              title: Text('etang'.tr()),
                            ),
                            Divider(
                              color:  Colors.grey,
                              height: 1,
                            ),
                            RadioListTile(
                              value: "2",
                              onChanged: (value) {
                                setState(() {
                                  _etang = "2";
                                });
                              },
                              groupValue: _etang,
                              title: Text('cage'.tr()),
                            ),
                            Divider(
                              color:  Colors.grey,
                              height: 1,
                            ),
                            widget.fishType == fishType.catfish.name ? RadioListTile(
                              value: "3",
                              onChanged: (value) {
                                setState(() {
                                  _etang = "3";
                                });
                              },
                              groupValue: _etang,
                              title: Text('tank'.tr()),
                            ):Container(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      _etang=="1"?'Nombre_d_étangs_dot'.tr():_etang=="2"?'Nombre_de_cage_dot'.tr():'Nombre_de_tank_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _pondnoController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: FormBuilderValidators.required(errorText:'required'.tr() ),
                    ),


                    SizedBox(
                      height: 25,
                    ),
                    Text(
    _etang=="1"?'Superficie_de_létang_(m2)_dot'.tr():_etang=="2"?'volume_cage_(m3)_dot'.tr():'volume_tank_(m3)_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _areaController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: FormBuilderValidators.required(errorText:'required'.tr() ),
                    ),

                    SizedBox(height: 15),
                    Text(
                      _etang=="1"?'Densité_(inds_/m2)_dot'.tr():'nombre_individu_(inds_/m3)_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _densityController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: widget.fishType == fishType.tilapia.name?FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText:'required'.tr()),
                        _etang=="1"?FormBuilderValidators.min(1,errorText: "${'must_between'.tr()} 1-3"):FormBuilderValidators.min(1,errorText: "${'must_between'.tr()} 1-99"),
                        _etang=="1"?FormBuilderValidators.max(3,errorText: "${'must_between'.tr()} 1-3"):FormBuilderValidators.max(99,errorText: "${'must_between'.tr()} 1-99"),
                      ]):FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText:'required'.tr()),
                        _etang=="1"?FormBuilderValidators.min(1,errorText: "${'must_between'.tr()} 1-5"):FormBuilderValidators.min(1,errorText: "${'must_between'.tr()} 1-100"),
                        _etang=="1"?FormBuilderValidators.max(5,errorText: "${'must_between'.tr()} 1-5"):FormBuilderValidators.max(99,errorText: "${'must_between'.tr()} 1-100"),
                      ]),
                    ),


                    SizedBox(height: 15),
                    Text(
                      'Taux_de_survie_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _surveRateController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText:'required'.tr()),
                        FormBuilderValidators.min(80,errorText: "${'must_between'.tr()} 80-90"),
                        FormBuilderValidators.max(90,errorText: "${'must_between'.tr()} 80-90"),
                      ]),
                    ),

                    SizedBox(height: 15),
                    Text(
                      'Taille_des_alevins_(g)_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _alevinSizeController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText:'required'.tr()),
                        FormBuilderValidators.min(1,errorText: "${'must_between'.tr()} 1-20"),
                        FormBuilderValidators.max(20,errorText: "${'must_between'.tr()} 1-20"),
                      ]),
                    ),

                    SizedBox(height: 15),
                    Text(
                      'Indice_de_consommation_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _consommationIndiceController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText:'required'.tr()),
                        widget.fishType == fishType.tilapia.name?FormBuilderValidators.min(1.4,errorText: "${'must_between'.tr()} 1.4-1.6"):FormBuilderValidators.min(1.4,errorText: "${'must_between'.tr()} 1-1.4"),
                        widget.fishType == fishType.tilapia.name?FormBuilderValidators.max(1.6,errorText: "${'must_between'.tr()} 1.4-1.6"):FormBuilderValidators.min(1.4,errorText: "${'must_between'.tr()} 1-1.4"),
                      ]),
                    ),

                    SizedBox(height: 15),
                    Text(
                      'Jours_d_élevage_(jours)_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _daysNoController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(errorText:'required'.tr()),
                        FormBuilderValidators.min(100,errorText: "${'must_between'.tr()} 100-200"),
                        FormBuilderValidators.max(200,errorText: "${'must_between'.tr()} 100-200"),
                      ]),
                    ),

                    SizedBox(height: 15),
                    Text(
                      'Poids_moyen_récolté_(g)_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _averageWeightController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: FormBuilderValidators.required(errorText:'required'.tr()),
                    ),

                    SizedBox(height: 15),
                    Text(
                      'Capacite_de_sac_(Kg)_dot'.tr(),
                      style: kInputTextStyle,
                    ),
                    CustomTextFormField(
                      controller: _bagCapacityController,
                      keyboardType: TextInputType.number,
                      hintText: 'in_no'.tr(),
                      validator: FormBuilderValidators.required(errorText:'required'.tr()),
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

_calculateBuy();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BuyResultPage(result: result!,fishType: widget.fishType)),
      );
    }

  }

  BuyResult _calculateBuy(){
    int alevin_size = int.parse(_alevinSizeController.text);
    int days_breeding = int.parse(_daysNoController.text);
    double alevin_no = double.parse(_areaController.text)*double.parse(_densityController.text)*int.parse(_pondnoController.text);
    double production = alevin_no*(double.parse(_surveRateController.text))/100*double.parse(_averageWeightController.text)/1000;
    double feed_quantity = production*double.parse(_consommationIndiceController.text);
    double bag_buy_no = feed_quantity/double.parse(_bagCapacityController.text);
    result = BuyResult(alevin_size.toString(), numberFormatter2().format(alevin_no.ceil()), days_breeding.toString(), numberFormatter2().format(production.ceil()), numberFormatter2().format(feed_quantity.ceil()),numberFormatter2().format(bag_buy_no.ceil()));
    return result!;
  }


}
