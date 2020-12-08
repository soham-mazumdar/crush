import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

ThemeData getThemeData() {
  return ThemeData(
      primaryColor: AppColors.primary,
      accentColor: AppColors.secondary,
      splashColor: AppColors.primary,
      canvasColor: Colors.white,
      fontFamily: 'Quicksand',
      textTheme: TextTheme(
        // bodyText1: GoogleFonts.comfortaa(fontSize: 14, fontWeight: FontWeight.bold),
        // bodyText2: GoogleFonts.comfortaa(fontSize: 16, fontWeight: FontWeight.w500),
        // button: GoogleFonts.comfortaa(fontSize: 16, fontWeight: FontWeight.normal),
        // headline6: GoogleFonts.tulpenOne(fontSize: 30, fontWeight: FontWeight.w500, letterSpacing: 1),
        // subtitle2: GoogleFonts.comfortaa(fontSize: 16, fontWeight: FontWeight.normal),
      ),
      primaryTextTheme: TextTheme(
        
      )
    );
}



MaterialColor createSwatch(int r, int g, int b, double o){
	Map<int, Color> swatch = {};
	List<int> opacities = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
	for(int opacity in opacities)
		swatch[opacity] = Color.fromRGBO(r, g, b, opacity/1000);
	return MaterialColor(
		Color.fromRGBO(r, g, b, o).value,
		swatch
	);
}

class AppColors{
	static final MaterialColor primary = createSwatch(205, 18, 140, 1);
  static final MaterialColor secondary = createSwatch(22,191,240, 1);
}
