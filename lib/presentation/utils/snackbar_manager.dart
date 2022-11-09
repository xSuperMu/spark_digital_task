import 'package:spark_digital/imports.dart';

class SnackBarManager {
  const SnackBarManager._();

  static void showSuccessSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: AppTheme.purple,
        content: Text(message),
      ),
    );
  }

  static void showFailureSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppTheme.red,
        content: Text(message),
      ),
    );
  }
}
