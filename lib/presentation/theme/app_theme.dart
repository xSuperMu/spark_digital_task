import 'package:spark_digital/imports.dart';

class AppTheme {
  const AppTheme._();

  // static const Color orange = Color(0xFFFAB001);
  static const Color purple = Color(0xFF6C25E9);
  static const Color red = Color(0xFFD80000);

  static const Color lightGrey = Color(0xFFF0F4F8);
  static const Color mediumGrey = Color(0xFFACBFCF);
  static const Color grey = Color(0xFF748A9D);

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  static ColorScheme lightColorScheme = ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.light,
    primary: purple,
    secondary: red,
    background: white,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: lightColorScheme.brightness,
      primaryColor: lightColorScheme.primary,
      scaffoldBackgroundColor: lightColorScheme.background,
      unselectedWidgetColor: grey,
      colorScheme: lightColorScheme,
      textTheme: ThemeText.lightTextTheme,
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: ThemeText.lightTextTheme.titleLarge!.copyWith(
          color: white,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          elevation: Sizes.s0,
          textStyle: ThemeText.lightTextTheme.titleLarge,
          padding: const EdgeInsets.all(Sizes.s12),
          fixedSize: const Size.fromHeight(Sizes.s50),
          shape: const StadiumBorder(),
          backgroundColor: purple,
          foregroundColor: white,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: ThemeText.lightTextTheme.titleLarge,
          padding: const EdgeInsets.all(Sizes.s12),
          fixedSize: const Size.fromHeight(Sizes.s50),
          side: const BorderSide(color: mediumGrey),
          shape: const StadiumBorder(),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: grey,
          textStyle: ThemeText.lightTextTheme.titleLarge,
          padding: const EdgeInsets.all(Sizes.s12),
          fixedSize: const Size.fromHeight(Sizes.s50),
          shape: const StadiumBorder(),
        ),
      ),
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        elevation: Sizes.s0,
        scrolledUnderElevation: Sizes.s0,
        backgroundColor: purple,
        foregroundColor: white,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.s4),
        ),
        fillColor: MaterialStateProperty.all(purple),
        checkColor: MaterialStateProperty.all(white),
        visualDensity: VisualDensity.compact,
      ),
      dividerTheme: const DividerThemeData(
        color: lightGrey,
        thickness: Sizes.s1,
        space: Sizes.s32,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        backgroundColor: Colors.transparent,
      ),
      sliderTheme: const SliderThemeData(
        trackHeight: Sizes.s3,
        thumbShape: RoundSliderThumbShape(
          elevation: Sizes.s3,
          enabledThumbRadius: Sizes.s14,
        ),
      ),
    );
  }
}
