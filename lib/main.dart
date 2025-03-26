import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:prepicofeed/data/pref_manager.dart';
import 'package:prepicofeed/home/home_page.dart';
import 'package:prepicofeed/splash_page.dart';
import 'package:prepicofeed/start/start_page.dart';
import 'package:prepicofeed/utils/app_themes.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('fr', 'FR'),
        Locale('en', 'US'),
        Locale('jp', 'JP')
      ],
      path: 'assets/languages',
      fallbackLocale: Locale('fr', 'FR'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PREPICOFEED',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: appThemeData[AppTheme.LightTheme],
      home: SplashPage(),
    );
  }


}


