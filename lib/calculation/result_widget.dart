import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prepicofeed/calculation/calcul_info_tile.dart';
import 'package:prepicofeed/calculation/hidden_cmd_page.dart';
import 'package:prepicofeed/calculation/result_model.dart';
import 'package:prepicofeed/data/enums.dart';
import 'package:prepicofeed/utils/constants.dart';

class ResultWidget extends StatefulWidget {
  final Result result;
  final String fishType, fishGrow;
  const ResultWidget(this.result, this.fishType, this.fishGrow);

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
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
            width: 110,
            height: 110,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kColorPrimaryLight,
            ),
            child: GestureDetector(
              onLongPress: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HiddenCommand(
                        fishTyp: widget.fishType, fishGro: widget.fishGrow,wtCoef:widget.result.wtCoef ,wt:widget.result.wt ,fishNo:widget.result.fishNo,weightStart:widget.result.fishAverageWeight)),
              ),
              child: CircleAvatar(
                backgroundColor: kColorPrimary,
                child: Image.asset(
                  height: 70,
                  widget.fishType == fishType.tilapia.name ? 'assets/images/tilapia_icon.png' :'assets/images/silure_icon.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        (fishGrow.larvae.name == widget.fishGrow)
            ? Container()
            : CalculInfoTile(
                title: 'feed_size'.tr(),
                trailing: widget.result.feed_size,
                hint: ''.tr(),
              ),
        CalculInfoTile(
          title: 'fish_no'.tr(),
          trailing: numberFormatter2().format(widget.result.fishNo),
          hint: ''.tr(),
        ),
        (fishGrow.larvae.name == widget.fishGrow)
            ? CalculInfoTile(
          title: 'fish_average_weight_g'.tr(),
          trailing: numberFormatter().format(widget.result.fishAverageWeight),
          hint: ''.tr(),
        ):CalculInfoTile(
          title: 'fish_average_weight_g'.tr(),
          trailing: numberFormatter2().format(widget.result.fishAverageWeight),
          hint: ''.tr(),
        ),
        CalculInfoTile(
          title: 'feeding_frequency'.tr(),
          trailing: widget.result.feeding_frequency.toString(),
          hint: ''.tr(),
        ),

        (fishGrow.larvae.name == widget.fishGrow)
            ? CalculInfoTile(
                title: 'feed_weight_gd'.tr(),
                trailing: numberFormatter().format(widget.result.feedWeightDay),
                hint: ''.tr(),
              )
            : CalculInfoTile(
                title: 'feed_weight_kgd'.tr(),
                trailing: numberFormatter().format(widget.result.feedWeightDay),
                hint: ''.tr(),
              ),

        (fishGrow.growout.name == widget.fishGrow)
            ? CalculInfoTile(
                title: 'estimated_biomas_kg'.tr(),
                trailing: numberFormatter2().format(widget.result.biomas),
                hint: ''.tr(),
              )
            : CalculInfoTile(
                title: 'estimated_biomas_g'.tr(),
                trailing: numberFormatter2().format(widget.result.biomas),
                hint: ''.tr(),
              ),
        /*(fishGrow.larvae.name == widget.fishGrow)
            ? Container()
            : CalculInfoTile(
                title: 'feeding_rate'.tr(),
                trailing: "${numberFormatter().format(widget.result.feedingRate)} %",
                hint: ''.tr(),
              ),*/
      ],
    );
  }
}
