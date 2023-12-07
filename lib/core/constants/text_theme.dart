import 'package:flutter/material.dart';
import 'package:halema/core/constants/constants.dart';

TextStyle headingStyle1({required context, required Color color}) {
  return TextStyle(
    fontFamily: 'Almarai',
    fontSize: screenWidth(context) * 0.05,
    fontWeight: FontWeight.bold,
    color: color,
  );
}

///////////////////////////////////////////////////////////////////////////

TextStyle headingStyle2({required context, required Color color}) {
  return TextStyle(
    fontFamily: 'Almarai',
    fontSize: screenWidth(context) * 0.045,
    fontWeight: FontWeight.w700,
    color: color,
  );
}
////////////////////////////////////////////////////////////////////////

TextStyle headingStyle3({required context, required Color color}) {
  return TextStyle(
    fontFamily: 'Almarai',
    fontSize: screenWidth(context) * 0.04,
    fontWeight: FontWeight.w600,
    color: color,
  );
}
////////////////////////////////////////////////////////////////////////

TextStyle bodyStryle({required context, required Color color}) {
  return TextStyle(
    fontFamily: 'Almarai',
    fontSize: screenWidth(context) * 0.04,
    fontWeight: FontWeight.w400,
    color: color,
  );
}

////////////////////////////////////////////////////////////////////////

TextStyle bodyStryle2({required context, required Color color}) {
  return TextStyle(
    fontFamily: 'Almarai',
    fontSize: screenWidth(context) * 0.035,
    fontWeight: FontWeight.w400,
    color: color,
  );
}
////////////////////////////////////////////////////////////////////////

TextStyle bodyStryle3({required context, required Color color}) {
  return TextStyle(
    fontFamily: 'Almarai',
    fontSize: screenWidth(context) * 0.03,
    fontWeight: FontWeight.w400,
    color: color,
  );
}
