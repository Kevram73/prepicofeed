import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../data/pref_manager.dart';

enum Language { english, french, japanese }

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeLanguagePageState createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  var _language;

  @override
  void initState() {
    super.initState();
    switch (Prefs.getString('language', def: 'fr')) {
      case 'fr':
        _language = Language.french;
        break;

      case 'en':
        _language = Language.english;
        break;

      case 'jp':
        _language = Language.japanese;
        break;

      default:
        break;
    }
  }

  _changeLanguage(int index) {
    switch (index) {
      case 0:
        _language = Language.french;
        Prefs.setString(Prefs.LANGUAGE, 'fr');
        break;

      case 1:
        _language = Language.english;
        Prefs.setString(Prefs.LANGUAGE, 'en');
        break;

      case 2:
        _language = Language.japanese;
        Prefs.setString(Prefs.LANGUAGE, 'jp');
        break;
    }
    EasyLocalization.of(context)!
        .setLocale(EasyLocalization.of(context)!.supportedLocales[index]);

    print("language" + _language.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'language_settings'.tr(),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RadioListTile(
              value: Language.french,
              onChanged: (value) => _changeLanguage(0),
              groupValue: _language,
              title: Text('french'.tr()),
            ),
            Divider(
              height: 0.5,
              indent: 10,
              endIndent: 10,
            ),
            RadioListTile(
              value: Language.english,
              onChanged: (value) => _changeLanguage(1),
              groupValue: _language,
              title: Text('english'.tr()),
            ),
            Divider(
              height: 0.5,
              indent: 10,
              endIndent: 10,
            ),
            RadioListTile(
              value: Language.japanese,
              onChanged: (value) => _changeLanguage(2),
              groupValue: _language,
              title: Text('japanese'.tr()),
            ),
          ],
        ),
      ),
    );
  }
}
