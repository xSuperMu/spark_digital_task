import 'package:spark_digital/imports.dart';

extension WidgetExtensions on Widget {
  Widget clearFocus(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: this,
    );
  }
}
