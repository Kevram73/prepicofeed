import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prepicofeed/calculation/calculation_page.dart';
import 'package:prepicofeed/components/custom_button.dart';
import 'package:prepicofeed/components/custom_navigation_bar.dart';
import 'package:prepicofeed/components/wave_header.dart';
import 'package:prepicofeed/feedbuyprogram/buy_calculation_page.dart';
import 'package:prepicofeed/home/nav_bar_item_widget.dart';
import 'package:prepicofeed/selectsize/select_size_page.dart';
import 'package:prepicofeed/start/input_widget.dart';
import 'package:prepicofeed/utils/constants.dart';
import 'package:prepicofeed/data/enums.dart';

class FishPage extends StatefulWidget {
  final int menuId;
  const FishPage({Key? key,required this.menuId}) : super(key: key);

  @override
  State<FishPage> createState() => _FishPageState();
}


class _FishPageState extends State<FishPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        dismissOnBackKeyPress: false,
        dismissOnTouchOutside: false,
        headerAnimationLoop: false,
        animType: AnimType.topSlide,
        showCloseIcon: false,
        title: '_warning'.tr(),
        body:  Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'start_warning'.tr(),
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
    });
  }

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
                      title: 'choose_fish'.tr(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [ GestureDetector(
                                    child:  Container(
                                      width: 110,
                                      height: 110,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kColorPrimaryLight,
                                      ),
                                      child: CircleAvatar(
                                        backgroundColor:
                                        kColorSecondary.withOpacity(0.8),
                                        child: Image.asset(
                                          height: 70,
                                          'assets/images/tilapia_icon.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    onTap: () {

                                      if(widget.menuId == 0){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  FishSizePage(fishType: fishType.tilapia.name)),
                                        );
                                      }else if(widget.menuId==1){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  BuyCalculationPage(fishType: fishType.tilapia.name)),
                                        );

                                      }

                                    },
                                  ),

                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'tilapia'.tr(),
                                      style: kTextStyleBigtitle1,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                          width: 110,
                                          height: 110,
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: kColorPrimaryLight,
                                          ),
                                          child: CircleAvatar(
                                            backgroundColor: kColorSecondary.withOpacity(0.8),
                                            child: Image.asset(
                                              height: 60,
                                              'assets/images/silure_icon.png',
                                              fit: BoxFit.contain,
                                            ),
                                          )),
                                      onTap: () {
                                        if(widget.menuId == 0){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  FishSizePage(fishType: fishType.catfish.name)),
                                          );
                                        }else if(widget.menuId==1){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>  BuyCalculationPage(fishType: fishType.catfish.name)),
                                          );

                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'catfish'.tr(),
                                      style: kTextStyleBigtitle1,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
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
