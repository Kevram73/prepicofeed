import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prepicofeed/components/custom_button.dart';
import 'package:prepicofeed/components/custom_navigation_bar.dart';
import 'package:prepicofeed/components/wave_header.dart';
import 'package:prepicofeed/data/enums.dart';
import 'package:prepicofeed/feedbuyprogram/buy_calculation_page.dart';
import 'package:prepicofeed/home/menu_card_widget.dart';
import 'package:prepicofeed/home/nav_bar_item_widget.dart';
import 'package:prepicofeed/selectfish/select_fish_page.dart';
import 'package:prepicofeed/settings/settings_page.dart';
import 'package:prepicofeed/start/input_widget.dart';
import 'package:prepicofeed/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

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
                      title: 'menu'.tr(),
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

                            GestureDetector(
                              child: MenuCardWidget(
                                title: 'calculation_feed'.tr(),
                                subtitle: 'enter_data_for_calculation'.tr(),
                                image: 'calculator_icon.png',
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FishPage(menuId:0)),
                                );
                              },
                            ),
                            GestureDetector(
                              child: MenuCardWidget(
                                title: 'feed_buy_program'.tr(),
                                subtitle: 'enter_data_for_calculation'.tr(),
                                image: 'vender_icon.png',
                              ),
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FishPage(menuId:1) ),
                                );
                              },
                            ),

                            GestureDetector(
                              child: MenuCardWidget(
                                title: 'feed_vender'.tr(),
                                subtitle: 'go_to_web_site'.tr(),
                                image: 'vender_icon.png',
                              ),
                              onTap: () async {
                                const url = 'https://urlz.fr/t3uj';
                                if (await canLaunchUrl(Uri.parse(url))) {
                                  await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
                                } else {
                                  throw 'Impossible d\'ouvrir le lien : $url';
                                }
                              },
                            ),

                            GestureDetector(
                              child: MenuCardWidget(
                                title: 'fry_producer'.tr(),
                                subtitle: 'go_to_web_site'.tr(),
                                image: 'vender_icon.png',
                              ),
                              onTap: () async {
                                const url = 'https://urlz.fr/totJ';
                                if (await canLaunchUrl(Uri.parse(url))) {
                                  await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication);
                                } else {
                                  throw 'Impossible d\'ouvrir le lien : $url';
                                }
                              },
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
      bottomNavigationBar: CustomNavigationBar(
        backgroundColor: Colors.grey.shade100,
        strokeColor: kColorPrimary,
        items: [
          NavBarItemWidget(
            onTap: () {

            },
            image: 'icon_home',
            isSelected: true,
          ),

          NavBarItemWidget(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            image: 'icon_settings',
            isSelected: false,
          ),
        ],
        currentIndex: 0,
        elevation: 0,
      ),
    );
  }
}
