import 'package:flutter/material.dart';
import 'package:prepicofeed/components/custom_navigation_bar.dart';
import 'package:prepicofeed/home/home_page.dart';
import 'package:prepicofeed/home/nav_bar_item_widget.dart';
import 'package:prepicofeed/settings/widgets/general_widget.dart';
import '../../utils/constants.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GeneralWidget(),
              SizedBox(
                height: kBottomPadding,
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(
          backgroundColor: Colors.grey.shade100,
          strokeColor: kColorPrimary,
          items: [
            NavBarItemWidget(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              image: 'icon_home',
              isSelected: false,
            ),
            NavBarItemWidget(
              onTap: () {},
              image: 'icon_settings',
              isSelected: true,
            ),
          ],
          currentIndex: 0,
          elevation: 0,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
