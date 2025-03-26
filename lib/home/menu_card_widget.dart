import 'package:flutter/material.dart';
import 'package:prepicofeed/utils/constants.dart';

class MenuCardWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const MenuCardWidget({
    Key? key,
    this.image = '',
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: <Widget>[
            Container(
              width: 45,
              height: 45,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kColorSecondary.withOpacity(0.8),
              ),
              child: CircleAvatar(
                backgroundColor:Colors.transparent,
                child: Image.asset(
                  'assets/images/$image',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'NunitoSans',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
