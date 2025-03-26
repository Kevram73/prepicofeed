import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:prepicofeed/data/pref_manager.dart';

const kColorBlue = Color(0xff2e83f8);
const kColorDarkBlue = Color(0xff1b3a5e);
const kColorRed = Color(0xfffc1234);

const kInputTextStyle = TextStyle(
    fontSize: 15,
    color: Color(0xff868686),
    fontWeight: FontWeight.w300,
    fontFamily: 'NunitoSans');

const kColorPrimary = Color(0xff2e83f8);
const kColorPrimaryDark = Color(0xff1b3a5e);
const kColorPrimaryLight = Color(0x202e83f8);
const kColorSecondary = Color(0xfffc1234);
const kColorSecondaryLight = Color(0x85fc4112);
const kColorDark = Color(0xff121212);
const kColorLight = Color(0xffEBF2F5);

const kBottomPadding = 48.0;

const kTextStyleButton = TextStyle(
  color: kColorPrimary,
  fontSize: 18,
  fontWeight: FontWeight.w500,
  fontFamily: 'NunitoSans',
);

const kTextStyleBigtitle1 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w800,
  fontFamily: 'NunitoSans',
);

const kTextStyleSubtitle1 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontFamily: 'NunitoSans',
);

const kTextStyleSubtitle2 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
  fontFamily: 'NunitoSans',
);

const kTextStyleBody2 = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'NunitoSans',
);

const kTextStyleHeadline6 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  fontFamily: 'NunitoSans',
);

NumberFormat numberFormatter(){
  NumberFormat format;
  switch (Prefs.getString('language', def: 'fr')) {
    case 'fr':
      format = NumberFormat.decimalPatternDigits(locale:"fr_FR",decimalDigits:2);
      break;

    case 'en':
      format = NumberFormat("#,##0.00", "en_US");
      break;

    case 'jp':
      format = NumberFormat("#,##0.00", "en_US");
      break;
    default:
      format = NumberFormat.decimalPatternDigits(locale:"fr_FR",decimalDigits:2);
      break;
  }
  return format;
}

NumberFormat numberFormatter1(){
  NumberFormat format;
  switch (Prefs.getString('language', def: 'fr')) {
    case 'fr':
      format = NumberFormat.decimalPatternDigits(locale:"fr_FR",decimalDigits:1);
      break;

    case 'en':
      format = NumberFormat("#,##0", "en_US");
      break;

    case 'jp':
      format = NumberFormat("#,##0", "en_US");
      break;
    default:
      format = NumberFormat.decimalPatternDigits(locale:"fr_FR",decimalDigits:1);
      break;
  }
  return format;
}

NumberFormat numberFormatter2(){
  NumberFormat format;
  switch (Prefs.getString('language', def: 'fr')) {
    case 'fr':
      format = NumberFormat.decimalPatternDigits(locale:"fr_FR",decimalDigits:0);
      break;

    case 'en':
      format = NumberFormat("#,##0", "en_US");
      break;

    case 'jp':
      format = NumberFormat("#,##0", "en_US");
      break;
    default:
      format = NumberFormat.decimalPatternDigits(locale:"fr_FR",decimalDigits:0);
      break;
  }
  return format;
}

NumberFormat numberFormatter3(){
  NumberFormat format;
  switch (Prefs.getString('language', def: 'fr')) {
    case 'fr':
      format = NumberFormat.decimalPatternDigits(locale:"fr_FR",decimalDigits:3);
      break;

    case 'en':
      format = NumberFormat("#,##0.000", "en_US");
      break;

    case 'jp':
      format = NumberFormat("#,##0.000", "en_US");
      break;
    default:
      format = NumberFormat.decimalPatternDigits(locale:"fr_FR",decimalDigits:3);
      break;
  }
  return format;
}
