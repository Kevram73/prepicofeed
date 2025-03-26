import 'package:flutter/material.dart';
import 'package:prepicofeed/utils/constants.dart';

import 'custom_wave_clipper_header.dart';

class WaveHeader extends StatelessWidget {
  final String title;
  final bool showLogoTitle;

  const WaveHeader({Key? key, required this.title, this.showLogoTitle=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = new Size(MediaQuery.of(context).size.width, 350);
    return Container(
      height: 350,
      child: Stack(
        children: <Widget>[
          CustomWaveClipperHeader(
            size: size,
            xOffset: 0,
            yOffset: 0,
          ),
          CustomWaveClipperHeader(
            size: size,
            xOffset: 50,
            yOffset: 10,
            duration: 1500,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  height: 80,
                  'assets/images/poissons_icon.png',
                  color: Colors.white,
                ),
                SizedBox(
                  height: 10,
                ),

                if(showLogoTitle)
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
