import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:prepicofeed/components/text_form_field.dart';
import 'package:prepicofeed/data/pref_manager.dart';
import 'package:prepicofeed/utils/constants.dart';
import 'package:prepicofeed/data/enums.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';


class BuyProgramGrid extends StatefulWidget {
  final String fishType;
  final int bagNo;
  const BuyProgramGrid({Key? key,required this.fishType,required this.bagNo}) : super(key: key);

  @override
  State<BuyProgramGrid> createState() => _BuyProgramGridState();


}

class _BuyProgramGridState extends State<BuyProgramGrid> {

  GlobalKey previewContainer = new GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();



  @override
  void initState(){
    super.initState();
    _nameController.text = Prefs.getString(Prefs.INFRA_NAME);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buy_program_grid'.tr()),

      ),
      body: Column(
        children: [
          Expanded(
            child: RepaintBoundary(
              key: previewContainer,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Row(
                        children: [
                          Text(DateFormat('dd-MM-yyyy').format(DateTime.now())),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: CustomTextFormField(
                                controller: _nameController,
                                keyboardType: TextInputType.name,
                                hintText: 'name_infra'.tr(),
                              )),
                        ],
                      ),
                    ),
                    widget.fishType == fishType.tilapia.name
                        ?Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            width: 520,
                            color: kColorPrimaryLight,
                            child: Text(
                              'Nombre_de_sacs_à_acheter'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
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
                                height: 65,
                                width: 160,
                                color: kColorPrimaryLight,
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 65,
                                width: 90,
                                color: kColorPrimaryLight,
                                child: Text(
                                  '1er_achat'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 65,
                                width: 90,
                                color: kColorPrimaryLight,
                                child: Text(
                                  '2ème_achat'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 65,
                                width: 90,
                                color: kColorPrimaryLight,
                                child: Text(
                                  '3ème_achat'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 65,
                                width: 90,
                                color: kColorPrimaryLight,
                                child: Text(
                                  'Total'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),



                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 160,
                                color: kColorSecondaryLight,
                                child: Text(
                                  'Aliment_2mm'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(3),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                    _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(3),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 160,
                                color: kColorSecondaryLight,
                                child: Text(
                                  'Aliment_3mm'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(6),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(6),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 160,
                                color: kColorSecondaryLight,
                                child: Text(
                                  'Aliment_4.5mm'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(19),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(11),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(30),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 160,
                                color: kColorSecondaryLight,
                                child: Text(
                                  'Aliment_6mm'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(28),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(33),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(61),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    :Container(
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            width: 520,
                            color: kColorPrimaryLight,
                            child: Text(
                              'Nombre_de_sacs_à_acheter'.tr(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
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
                                height: 65,
                                width: 160,
                                color: kColorPrimaryLight,
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 65,
                                width: 90,
                                color: kColorPrimaryLight,
                                child: Text(
                                  '1er_achat'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 65,
                                width: 90,
                                color: kColorPrimaryLight,
                                child: Text(
                                  '2ème_achat'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 65,
                                width: 90,
                                color: kColorPrimaryLight,
                                child: Text(
                                  '3ème_achat'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 65,
                                width: 90,
                                color: kColorPrimaryLight,
                                child: Text(
                                  'Total'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),



                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 160,
                                color: kColorSecondaryLight,
                                child: Text(
                                  'Aliment_2mm'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(4),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(3),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 160,
                                color: kColorSecondaryLight,
                                child: Text(
                                  'Aliment_3mm'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(7),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(6),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 160,
                                color: kColorSecondaryLight,
                                child: Text(
                                  'Aliment_4.5mm'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(7),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(32),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(31),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 160,
                                color: kColorSecondaryLight,
                                child: Text(
                                  'Aliment_6mm'.tr(),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(0),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(7),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(43),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                height: 35,
                                width: 90,
                                color: kColorSecondaryLight,
                                child: Text(
                                  _calcFeedBagNumber(61),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate())
                Prefs.setString(Prefs.INFRA_NAME, _nameController.text);
              ShareFilesAndScreenshotWidgets().shareScreenshot(
                previewContainer,
                820,
                "Screenshot",
                "${DateTime.timestamp()}-prepico.png",
                "image/png",
                text: "Prepicofeed");
            },
            child: CircleAvatar(
              backgroundColor: kColorPrimary,
              child: Icon(
                Icons.screenshot_monitor,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _calcFeedBagNumber( double rate){

    return numberFormatter1().format(double.parse((widget.bagNo*rate/100).toStringAsFixed(1)));
  }
}
