import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prepicofeed/home/home_page.dart';
import 'package:prepicofeed/start/start_page.dart';

import '../data/pref_manager.dart';
import '../utils/app_themes.dart';
import '../utils/constants.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  String _appVersion = '2.4.2';

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () => {_loadScreen()});
  }

  _loadScreen() async {
    await Prefs.load();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: kColorBlue,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/poissons_icon.png',
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'PREPICO',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'FEED',
                              style: TextStyle(
                                color: kColorRed,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'V $_appVersion',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 150,
              height: 2,
              child: LinearProgressIndicator(
                backgroundColor: kColorBlue,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            Container(
              height: 60,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: kColorLight.withOpacity(0.7),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    height: 50,
                    'assets/images/prepico2.png',
                  ),
                  Image.asset(
                    height: 50,
                    'assets/images/jica.png',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
