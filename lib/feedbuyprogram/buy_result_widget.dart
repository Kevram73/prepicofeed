import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prepicofeed/calculation/calcul_info_tile.dart';
import 'package:prepicofeed/calculation/hidden_cmd_page.dart';
import 'package:prepicofeed/calculation/result_model.dart';
import 'package:prepicofeed/data/enums.dart';
import 'package:prepicofeed/feedbuyprogram/buy_result_model.dart';
import 'package:prepicofeed/utils/constants.dart';

class BuyResultWidget extends StatefulWidget {
  final BuyResult result;
  final String fishType;
  const BuyResultWidget(this.result, this.fishType);

  @override
  State<BuyResultWidget> createState() => _BuyResultWidgetState();
}

class _BuyResultWidgetState extends State<BuyResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 15,
        ),
        Center(
          child: Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kColorPrimaryLight,
            ),
            child: CircleAvatar(
              backgroundColor: kColorPrimary,
              child: Image.asset(
                height: 30,
                widget.fishType == fishType.tilapia.name ? 'assets/images/tilapia_icon.png' :'assets/images/silure_icon.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        CalculInfoTile(
                title: 'Taille_des_alevins_(g)'.tr(),
                trailing: widget.result.alevin_size,
                hint: ''.tr(),
              ),
        CalculInfoTile(
          title: 'Nombre_d_alevins_achetés_(inds.)'.tr(),
          trailing: widget.result.alevin_no,
          hint: ''.tr(),
        ),
        CalculInfoTile(
          title: 'Jours_d_élevage_(jours)'.tr(),
          trailing: widget.result.days_breeding,
          hint: ''.tr(),
        ),
        CalculInfoTile(
          title: 'Production_(kg)'.tr(),
          trailing: widget.result.production,
          hint: ''.tr(),
        ),
        CalculInfoTile(
          title: 'Quantité_d_aliments_donnés_(kg)'.tr(),
          trailing: widget.result.feed_quantity,
          hint: ''.tr(),
        ),
        CalculInfoTile(
          title: 'Nombre_de_sacs_d_aliments_achetés'.tr(),
          trailing: widget.result.bag_buy_no,
          hint: ''.tr(),
        ),

      ],
    );
  }
}
