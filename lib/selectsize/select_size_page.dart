import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prepicofeed/calculation/calculation_page.dart';
import 'package:prepicofeed/components/custom_button.dart';
import 'package:prepicofeed/components/custom_navigation_bar.dart';
import 'package:prepicofeed/components/text_form_field.dart';
import 'package:prepicofeed/components/wave_header.dart';
import 'package:prepicofeed/home/nav_bar_item_widget.dart';
import 'package:prepicofeed/selectsize/select_size_input_page.dart';
import 'package:prepicofeed/selectsize/size_card_widget.dart';
import 'package:prepicofeed/start/input_widget.dart';
import 'package:prepicofeed/utils/constants.dart';
import 'package:prepicofeed/data/enums.dart';

class FishSizePage extends StatefulWidget {
  final String fishType;

  const FishSizePage({Key? key, required this.fishType}) : super(key: key);

  @override
  State<FishSizePage> createState() => _FishSizePageState();
}

class _FishSizePageState extends State<FishSizePage> {
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 38),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 5,
                                    ),
                                    GestureDetector(
                                      child: SizeCardWidget(
                                          title: 'growout'.tr(),
                                          subtitle: 'PM>5g'.tr(),
                                          image: widget.fishType == fishType.tilapia.name ? 'tilapia_icon.png' :'silure_icon.png',
                                        imagesize: 40,
                                        ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  FishSizeInputPage(fishType: widget.fishType,min:5.1,max:1000000)),
                                        );
                                      },
                                    ),

                                    GestureDetector(
                                      child: SizeCardWidget(
                                          title: 'intermediate'.tr(),
                                          subtitle: '(2<PM=<5g)'.tr(),
                                        image: widget.fishType == fishType.tilapia.name ? 'tilapia_icon.png' :'silure_icon.png',
                                        imagesize: 25,
                                        ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  FishSizeInputPage(fishType: widget.fishType,min:0.21,max:5)),
                                        );
                                      },
                                    ),
                                    GestureDetector(
                                      child: SizeCardWidget(
                                        title: 'larvae'.tr(),
                                        subtitle: '(PM =<0.2 g)'.tr(),
                                        image: widget.fishType == fishType.tilapia.name ? 'tilapia_icon.png' :'silure_icon.png',
                                        imagesize: 15,
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  FishSizeInputPage(fishType: widget.fishType,min:0.01,max:0.2)),
                                        );
                                      },
                                    ),

                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}
