import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prepicofeed/calculation/edit_widget.dart';
import 'package:prepicofeed/calculation/result_model.dart';
import 'package:prepicofeed/calculation/result_widget.dart';
import 'package:prepicofeed/components/custom_button.dart';
import 'package:prepicofeed/data/enums.dart';
import 'package:prepicofeed/utils/constants.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class CalculationPage extends StatefulWidget {



  final String fishType,fishGrow ;
  final double fishWeight;
  const CalculationPage({Key? key, required this.fishType, required this.fishGrow, required this.fishWeight}) : super(key: key);

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
       showWarning();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('calculation'.tr()),

      ),
      body: EditWidget(fishType: widget.fishType, fishGrow: widget.fishGrow, fishWeight: widget.fishWeight),
    );
  }

  showWarning(){
    if(widget.fishType == fishType.tilapia.name){
      if(widget.fishGrow == fishGrow.intermediate.name) {
        warningDialog('tilapia_intermediate_warning'.tr());
      }else if(widget.fishGrow == fishGrow.growout.name){
        warningDialog('tilapia_growout_warning'.tr());
      }else{
        warningDialog('tilapia_larvae_warning'.tr());
      }
    }

  }

  warningDialog( String warning){
      AwesomeDialog(
        context: context,
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        dialogType: DialogType.warning,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        showCloseIcon: false,
        title: '_warning'.tr(),
        body:  Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              warning,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        onDismissCallback: (type) {
          debugPrint('Dialog Dismiss from callback $type');
        },
        btnOkOnPress: () {},
        btnOkColor: kColorPrimary,
      ).show();
  }

}
