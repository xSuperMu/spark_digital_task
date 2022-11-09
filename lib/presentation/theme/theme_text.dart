import 'package:spark_digital/imports.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _cantarellTextTheme => GoogleFonts.cantarellTextTheme();

  static TextStyle get _displayMedium =>
      _cantarellTextTheme.displayMedium!.copyWith(
        color: AppTheme.white,
        fontWeight: FontWeight.bold,
        height: 1.2,
      );

  static TextStyle get _headlineLarge =>
      _cantarellTextTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w700,
        color: AppTheme.black,
      );
  static TextStyle get _headlineMedium =>
      _cantarellTextTheme.headlineMedium!.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.5,
      );
  static TextStyle get _headlineSmall =>
      _cantarellTextTheme.headlineSmall!.copyWith(
        color: AppTheme.black,
      );

  static TextStyle get _titleLarge => _cantarellTextTheme.titleLarge!.copyWith(
        color: AppTheme.black,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get _titleMedium =>
      _cantarellTextTheme.titleMedium!.copyWith(
        color: AppTheme.black,
      );
  static TextStyle get _titleSmall => _cantarellTextTheme.titleSmall!.copyWith(
        color: AppTheme.black,
      );

  static TextStyle get _bodyLarge => _cantarellTextTheme.bodyLarge!.copyWith(
        color: AppTheme.black,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get _bodyMedium => _cantarellTextTheme.bodyMedium!.copyWith(
        color: AppTheme.grey,
      );
  static TextStyle get _bodySmall => _cantarellTextTheme.bodySmall!.copyWith(
        color: AppTheme.black,
      );

  static TextStyle get _labelLarge => _cantarellTextTheme.labelLarge!.copyWith(
        color: AppTheme.black,
      );
  static TextStyle get _labelSmall => _cantarellTextTheme.labelSmall!.copyWith(
        color: AppTheme.black,
      );

  static TextTheme get lightTextTheme => TextTheme(
        displayMedium: _displayMedium,
        headlineLarge: _headlineLarge,
        headlineMedium: _headlineMedium,
        headlineSmall: _headlineSmall,
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
        titleSmall: _titleSmall,
        bodyLarge: _bodyLarge,
        bodyMedium: _bodyMedium,
        bodySmall: _bodySmall,
        labelLarge: _labelLarge,
        labelSmall: _labelSmall,
      );
}
