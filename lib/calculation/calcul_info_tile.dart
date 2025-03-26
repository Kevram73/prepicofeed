import 'package:flutter/material.dart';


class CalculInfoTile extends StatelessWidget {
  final String title;
  final String hint;
  final String? trailing;

  const CalculInfoTile({
    Key? key,
    required this.title,
    required this.hint,
    this.trailing,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Text(
            trailing ?? hint,
            style: TextStyle(
              color: trailing != null
                  ? Colors.black
                  : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Divider(
          height: 0.5,
          color: Colors.grey[200],
          indent: 15,
          endIndent: 15,
        ),
      ],
    );
  }
}
