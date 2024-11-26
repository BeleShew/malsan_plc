import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static FontWeight _getFontWeight(int weight) {
    switch (weight) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w300;
      case 500:
        return FontWeight.w400;
      case 600:
        return FontWeight.w500;
      case 700:
        return FontWeight.w600;
      case 800:
        return FontWeight.w700;
      case 900:
        return FontWeight.w900;
    }
    return FontWeight.w400;
  }

  static TextStyle getTextStyle(TextStyle textStyle,
      {int fontWeight = 500,
        bool muted = false,
        bool xMuted = false,
        double letterSpacing = 0.15,
        Color? color,
        TextDecoration decoration = TextDecoration.none,
        double? height,
        double wordSpacing = 0,
        double? fontSize}) {
    double? finalFontSize = fontSize ?? textStyle.fontSize;

    Color? finalColor;
    if (color == null) {
      finalColor = xMuted
          ? textStyle.color!.withAlpha(160)
          : (muted ? textStyle.color!.withAlpha(200) : textStyle.color);
    } else {
      finalColor = xMuted
          ? color.withAlpha(160)
          : (muted ? color.withAlpha(200) : color);
    }

    return GoogleFonts.poppins(
        fontSize: finalFontSize,
        fontWeight: _getFontWeight(fontWeight),
        letterSpacing: letterSpacing,
        color: finalColor,
        decoration: decoration,
        height: height,
        wordSpacing: wordSpacing);
  }

  static final TextTheme appBarTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff495057))),
    displayMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff495057))),
    displaySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff495057))),
    headlineMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff495057))),
    headlineSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff495057))),
    titleLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff495057))),
    titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff495057))),
    titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff495057))),
    bodyLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff495057))),
    bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff495057))),
    labelLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff495057))),
    bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xff495057))),
    labelSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xff495057))),
  );

  static final TextTheme textTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff4A4A4A))),
    displayMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff4A4A4A))),
    displaySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff4A4A4A))),
    headlineMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff4A4A4A))),
    headlineSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff4A4A4A))),
    titleLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff4A4A4A))),
    titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff4A4A4A))),
    titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4A4A4A))),
    bodyLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff4A4A4A))),
    bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff4A4A4A))),
    labelLarge: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4A4A4A))),
    bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xff4A4A4A))),
    labelSmall: GoogleFonts.poppins(
        textStyle: const TextStyle(fontSize: 11, color: Color(0xff4A4A4A))),
  );

  static final ThemeData themeData = ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      primaryColor: const Color(0xFF008080),
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: const Color(0xffffffff),
      appBarTheme: AppBarTheme(
        actionsIconTheme: const IconThemeData(
          color: Color(0xff495057),
        ),
        color: const Color(0xffffffff),
        iconTheme: const IconThemeData(color: Color(0xff495057), size: 24),
        toolbarTextStyle: appBarTextTheme.bodyMedium,
        titleTextStyle: appBarTextTheme.titleLarge,
      ),
      navigationRailTheme: const NavigationRailThemeData(
          selectedIconTheme:
          IconThemeData(color: Color(0xFF008080), opacity: 1, size: 24),
          unselectedIconTheme:
          IconThemeData(color: Color(0xFF008080), opacity: 1, size: 24),
          backgroundColor: Color(0xffffffff),
          elevation: 3,
          selectedLabelTextStyle: TextStyle(color: Color(0xFF008080)),
          unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
      cardTheme: CardTheme(
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.4),
        elevation: 1,
        margin: const EdgeInsets.all(0),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 15, color: Color(0xaa495057)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Color(0xFF008080)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black54),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.black54)),
      ),
      splashColor: Colors.white.withAlpha(100),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: textTheme,
      indicatorColor: Colors.white,
      disabledColor: const Color(0xffdcc7ff),
      highlightColor: Colors.white,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xFF008080),
          splashColor: Colors.white.withAlpha(100),
          highlightElevation: 8,
          elevation: 4,
          focusColor: const Color(0xFF008080),
          hoverColor: const Color(0xFF008080),
          foregroundColor: Colors.white),
      dividerColor: const Color(0xffd1d1d1),
      cardColor: Colors.white,
      popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xffffffff),
        textStyle: textTheme.bodyMedium!
            .merge(const TextStyle(color: Color(0xff495057))),
      ),
      bottomAppBarTheme:
      const BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Color(0xff495057),
        labelColor: Color(0xFF008080),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xFF008080), width: 2.0),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: const Color(0xFF008080),
        inactiveTrackColor: const Color(0xFF008080).withAlpha(140),
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: const Color(0xFF008080),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        inactiveTickMarkColor: Colors.red[100],
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(90, 45)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.grey.withAlpha(100);
              }
              return const Color(0xFF008080);
            }),
            foregroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.black.withAlpha(100);
              }
              return Colors.white;
            }),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)),
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          )),
      //fontFamily: "SFProText",
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(const Color(0xFF008080)),
            backgroundColor: MaterialStateProperty.all(Colors.white),
          )),
      colorScheme: const ColorScheme.light(
          primary: Color(0xFF008080),
          onPrimary: Colors.black,
          secondary: Color(0xffFADD03),
          onSecondary: Color(0xFF008080),
          surface: Color(0xffe2e7f1),
          background: Color(0xfff3f4f7),
          onBackground: Color(0xff495057))
          .copyWith(background: Colors.white)
          .copyWith(error: const Color(0xfff0323c))
          .copyWith(secondary: const Color(0xffFADD03)));

  static ThemeData getTheme() {
    return themeData;
  }
}