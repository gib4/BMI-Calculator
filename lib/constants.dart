import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Results {
    NORMAL,
    OVERWEIGHT,
    UNDERWEIGHT,
}

const kIconSize             = 80.0;
const kBoxSize              = 15.0;
const kTextColor            = Color(0xFF8D8E98);
const kTextFontSize         = 18.0;


const kBottomContainerHeight    = 80.0;
const kBottomContainerColor     = Color(0xFFEB1555);
const kUncheckedContainerColor  = Color(0xFF111328);
const kCheckedContainerColor    = Color(0xFF1D1E33);
const kActiveSliderColor        = Color(0xFFFFFFFF);
const kOverlaySliderColor       = Color(0x29FFFFFF);
const kInactiveSliderColor      = Color(0xFF777777);
const kSliderThumbColor         = Color(0xFFEB1555);

const kButtonColor              = Color(0xFF4C4F5E);

const kLabelTextStyle = TextStyle(
    fontSize: kTextFontSize,
    color:  kTextColor,
);

const kNumberTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.w900
);

const kLargeButtonStyle = TextStyle(
    fontSize: 25.0,
    fontWeight: FontWeight.bold
);

const kTitleTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold
);

const kResultsTextStyle = TextStyle (
    color: Color(0xFF24D876),
    fontSize: 22.0,
    fontWeight: FontWeight.bold
);

const kBMITextStyle = TextStyle (
    fontSize: 100.0,
    fontWeight: FontWeight.bold
);

const kBodyTextStyle = TextStyle (
    fontSize: 22.0,
);
