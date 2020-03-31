import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/src/constants/font_constants.dart';
import 'package:flutter_bloc_architecture/src/resources/app_colors.dart';
import 'package:flutter_bloc_architecture/src/resources/dimens.dart';

class AppTextStyles {
  static TextStyle appBarTextStyleTheme(bool isDark) =>
      TextStyle(color: isDark ? AppColors.white : AppColors.black);

  /*-----------------------Text Style BOLD -----------------------*/
  static TextStyle getExtraSmallText(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == FontConstant.kBold
          ? FontConstant.open_sans_bold
          : (fontType == FontConstant.kSemiBold
              ? FontConstant.open_sans_semi_bold
              : (fontType == FontConstant.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.025 < Dimens.px14 ? width * 0.025 : Dimens.px13),
    );
  }

  static TextStyle getSmallText(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == FontConstant.kBold
          ? FontConstant.open_sans_bold
          : (fontType == FontConstant.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == FontConstant.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.038 < Dimens.px18 ? width * 0.038 : Dimens.px17),
    );
  }

  static TextStyle getMediumText(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == FontConstant.kBold
          ? FontConstant.open_sans_bold
          : (fontType == FontConstant.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == FontConstant.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.044 < Dimens.px22 ? width * 0.044 : Dimens.px21),
    );
  }

  static TextStyle getLargeText(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == FontConstant.kBold
          ? FontConstant.open_sans_bold
          : (fontType == FontConstant.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == FontConstant.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.053 < Dimens.px26 ? width * 0.053 : Dimens.px25),
    );
  }

  static TextStyle getExtraLargeText(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == FontConstant.kBold
          ? FontConstant.open_sans_bold
          : (fontType == FontConstant.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == FontConstant.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.062 < Dimens.px30 ? width * 0.062 : Dimens.px29),
    );
  }

  static TextStyle getSmallTextUnderline(
      double width, Color color, int fontType, bool underline) {
    return TextStyle(
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontFamily: (fontType == FontConstant.kBold
          ? FontConstant.open_sans_bold
          : (fontType == FontConstant.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == FontConstant.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.032 < Dimens.px18 ? width * 0.032 : Dimens.px17),
    );
  }

  static TextStyle getMedium1Text(double width, Color color, int fontType) {
    return TextStyle(
      fontFamily: (fontType == FontConstant.kBold
          ? FontConstant.open_sans_bold
          : (fontType == FontConstant.kSemiBold
              ? FontConstant.open_sans_bold
              : (fontType == FontConstant.kRegular
                  ? FontConstant.open_sans_regular
                  : FontConstant.open_sans_light))),
      color: color,
      fontSize: (width * 0.053 < Dimens.px14 ? width * 0.053 : Dimens.px13),
    );
  }
}
