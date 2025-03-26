import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:prepicofeed/calculation/calculation_page.dart';
import 'package:prepicofeed/components/custom_button.dart';
import 'package:prepicofeed/components/custom_navigation_bar.dart';
import 'package:prepicofeed/components/text_form_field.dart';
import 'package:prepicofeed/components/wave_header.dart';
import 'package:prepicofeed/home/nav_bar_item_widget.dart';
import 'package:prepicofeed/start/input_widget.dart';
import 'package:prepicofeed/utils/constants.dart';
import 'package:prepicofeed/data/enums.dart';

class FishSizeInputPage extends StatefulWidget {
  final String fishType;
  final double min,max;

  const FishSizeInputPage({Key? key, required this.fishType, required this.min, required this.max}) : super(key: key);

  @override
  State<FishSizeInputPage> createState() => _FishSizeInputPageState();
}

class _FishSizeInputPageState extends State<FishSizeInputPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    WaveHeader(
                      title: 'enter_fish_size'.tr(),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                'average_weight_dot'.tr(),
                                style: kInputTextStyle,
                              ),
                              CustomTextFormField(
                                controller: _weightController,
                                keyboardType: TextInputType.number,
                                hintText: 'in_g'.tr(),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(errorText:'required'.tr()),
                                  FormBuilderValidators.min(widget.min,errorText: "${'must_between'.tr()} ${numberFormatter().format(widget.min)} - ${numberFormatter().format(widget.max)}"),
                                  FormBuilderValidators.max(widget.max,errorText: "${'must_between'.tr()} ${numberFormatter().format(widget.min)} - ${numberFormatter().format(widget.max)}"),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: CustomButton(
                        onPressed: () {
                          _next();
                        },
                        text: '_next'.tr(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _next() {
    if (_formKey.currentState!.validate()) {
      double fishWeight = double.parse(_weightController.text);
      String fishGr = fishGrow.growout.name;

      if (widget.fishType == fishType.tilapia.name) {
        if (fishWeight > 5)
          fishGr = fishGrow.growout.name;
        else if (fishWeight <= 0.2)
          fishGr = fishGrow.larvae.name;
        else
          fishGr = fishGrow.intermediate.name;
      } else {
        if (fishWeight > 5)
          fishGr = fishGrow.growout.name;
        else if (fishWeight <= 0.2)
          fishGr = fishGrow.larvae.name;
        else
          fishGr = fishGrow.intermediate.name;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CalculationPage(
                fishType: widget.fishType,
                fishGrow: fishGr,
                fishWeight: fishWeight)),
      );
    }
  }


}
