import 'package:spark_digital/imports.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final String? hint;
  final String? label;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? textColor;
  final Color? hintColor;
  final EdgeInsetsGeometry padding;
  final bool obscureText;
  final bool enabled;
  final int? maxLength;
  final int maxLines;
  final OutlineInputBorder border;
  final OutlineInputBorder? disabledBorder;

  final List<TextInputFormatter>? inputFormatters;

  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  const CustomInputField({
    Key? key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.autoFocus = false,
    this.keyboardType,
    this.hint,
    this.label,
    this.suffixIcon,
    this.fillColor,
    this.textColor,
    this.hintColor,
    this.padding =
        const EdgeInsets.symmetric(vertical: Sizes.s12, horizontal: Sizes.s28),
    this.obscureText = false,
    this.enabled = true,
    this.maxLength,
    this.maxLines = 1,
    this.border = CustomInputBorder.outlineBorder,
    this.disabledBorder,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.next,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      autofocus: autoFocus,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: textColor,
          ),
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,
      obscureText: obscureText,
      textInputAction: textInputAction,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: padding,
        filled: false,
        fillColor: fillColor ?? AppTheme.lightGrey,
        suffixIcon: suffixIcon,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: hintColor ?? AppTheme.grey,
              fontWeight: FontWeight.bold,
            ),
        label: label != null
            ? Text(
                label!,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: textColor ?? AppTheme.grey,
                      fontWeight: FontWeight.bold,
                    ),
              )
            : null,
        errorStyle:
            Theme.of(context).textTheme.caption!.copyWith(color: AppTheme.red),
        border: border,
        enabledBorder: border,
        disabledBorder: disabledBorder ?? border,
        errorBorder: CustomInputBorder.outlineErrorBorder,
        focusedBorder: border,
      ),
    );
  }
}

abstract class CustomInputBorder {
  static const flatBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(Sizes.s12)),
      borderSide: BorderSide(width: Sizes.s0, color: Colors.transparent));

  static const outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(Sizes.s50)),
    borderSide: BorderSide(
      width: Sizes.s1,
      color: AppTheme.mediumGrey,
    ),
  );

  static const outlineErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(Sizes.s50)),
    borderSide: BorderSide(
      width: Sizes.s1,
      color: AppTheme.red,
    ),
  );
}
