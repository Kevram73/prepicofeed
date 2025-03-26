import 'dart:io';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prepicofeed/calculation/edit_widget.dart';
import 'package:prepicofeed/calculation/result_model.dart';
import 'package:prepicofeed/calculation/result_widget.dart';
import 'package:prepicofeed/components/custom_button.dart';
import 'package:prepicofeed/components/text_form_field.dart';
import 'package:prepicofeed/data/pref_manager.dart';
import 'package:prepicofeed/feedbuyprogram/buy_program_grid_page.dart';
import 'package:prepicofeed/feedbuyprogram/buy_result_model.dart';
import 'package:prepicofeed/feedbuyprogram/buy_result_widget.dart';
import 'package:prepicofeed/utils/constants.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';

class BuyResultPage extends StatefulWidget {
  final BuyResult result;
  final String fishType;

  const BuyResultPage({Key? key, required this.result, required this.fishType})
      : super(key: key);

  @override
  State<BuyResultPage> createState() => _BuyResultPageState();
}

class _BuyResultPageState extends State<BuyResultPage> {
  GlobalKey previewContainer = new GlobalKey();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void initState() {
    _nameController.text = Prefs.getString(Prefs.INFRA_NAME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('result'.tr() + ' ' + widget.fishType.tr()),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: kColorBlue,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: RepaintBoundary(
              key: previewContainer,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
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
                      BuyResultWidget(widget.result, widget.fishType),
                    ],
                  ),
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
                  800,
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
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BuyProgramGrid(
                            fishType: widget.fishType,
                            bagNo: int.parse(widget.result.bag_buy_no.trim()),
                          )),
                );
              },
              text: 'buy_program'.tr(),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> ShowCapturedWidget(
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Captured widget screenshot"),
        ),
        body: Center(child: Image.memory(capturedImage)),
      ),
    );
  }
}
