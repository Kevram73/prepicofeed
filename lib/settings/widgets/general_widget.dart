import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prepicofeed/language/change_laguage_page.dart';
import '../../../utils/constants.dart';

class GeneralWidget extends StatefulWidget {

  const GeneralWidget(
      {Key? key})
      : super(key: key);
  @override
  _GeneralWidgetState createState() => _GeneralWidgetState();
}

class _GeneralWidgetState extends State<GeneralWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          color: Colors.grey[50],
          padding: EdgeInsets.all(15),
          child: Text(
            'general'.tr(),
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ListTile(
          leading: Text(
            'language'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangeLanguagePage()),
            );
          },
        ),
        ListTile(
          leading: Text(
            'about_app'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),

        ListTile(
          leading: Text(
            'help_and_support'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: Text(
            'rate_the_app'.tr(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {},
        ),

      ],
    );
  }
}
