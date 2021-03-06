import 'package:music_player/res/app_styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle get s26fw700White {
    return GoogleFonts.nunito(
      fontSize: 26.0,
      color: AppColors.white,
      fontWeight: FontWeight.w700,
      height: 1.0,
    );
  }

  static TextStyle get s24fw700White {
    return GoogleFonts.roboto(
      fontSize: 24.0,
      color: AppColors.white,
      fontWeight: FontWeight.w700,
      height: 1.0,
    );
  }

  static TextStyle get s14fw500White {
    return GoogleFonts.roboto(
      fontSize: 14.0,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      height: 1.0,
    );
  }

  static TextStyle get s18fw500White {
    return GoogleFonts.roboto(
      fontSize: 18.0,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
      height: 1.0,
    );
  }

  static TextStyle get s12fw400White {
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.white,
      fontWeight: FontWeight.w400,
      height: 1.0,
    );
  }

  static TextStyle get s12fw400GreyLight {
    return GoogleFonts.roboto(
      fontSize: 12.0,
      color: AppColors.greyLight,
      fontWeight: FontWeight.w400,
      height: 1.0,
    );
  }

  static TextStyle get s14fw400Black {
    return GoogleFonts.roboto(
      fontSize: 14.0,
      color: AppColors.black,
      fontWeight: FontWeight.w400,
      height: 1.0,
    );
  }

  static TextStyle get s14fw400Red {
    return GoogleFonts.roboto(
      fontSize: 14.0,
      color: AppColors.red,
      fontWeight: FontWeight.w400,
      height: 1.0,
    );
  }
}
