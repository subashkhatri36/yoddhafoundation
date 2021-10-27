import 'package:flutter/material.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';

/// custom text input field widget
class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      this.label,
      this.hintText,
      this.obscureText = false,
      this.textInputType = TextInputType.text,
      this.icon,
      this.validator,
      this.onFieldSubmitted,
      this.onChanged,
      this.controller,
      this.suffix,
      this.iconColor,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.borderRadius = 0,
      this.maxline = 1,
      this.maxlength,
      this.color = Colors.transparent})
      : super(key: key);

  final IconData? icon;
  final String? hintText;
  final TextInputType textInputType;
  final bool obscureText;
  // ignore: prefer_typing_uninitialized_variables
  final validator;
  final IconData? suffix;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final String? label;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  // ignore: prefer_typing_uninitialized_variables
  final autovalidateMode;
  final double borderRadius;
  final Color color;
  final Color? iconColor;
  final int? maxlength;
  final int maxline;

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  ///toggle status for passsword eye
  bool showPassword = false;
  bool checkdata = true;

  /// toggle status for password field
  bool shownPassword = false;

  @override
  void initState() {
    super.initState();
    shownPassword = widget.obscureText;
  }

  /// toggle password view
  void togglePassword() {
    setState(() {
      showPassword = !showPassword;
      shownPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: Constants.defaultPadding,
        vertical: Constants.defaultPadding / 4,
      ),

      child: TextFormField(
        controller: widget.controller,
        autovalidateMode: widget.autovalidateMode,
        maxLines: widget.maxline,
        maxLength: widget.maxlength,
        decoration: InputDecoration(
          fillColor: widget.color,
          contentPadding: widget.icon != null
              ? const EdgeInsets.fromLTRB(20, 5, 20, 0)
              : const EdgeInsets.fromLTRB(10, 5, 10, 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          labelText: widget.label,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: Constants.defaultFontSize,
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () => togglePassword(),
                  icon: Icon(
                      showPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: widget.iconColor ?? Colors.grey),
                  splashRadius: 0.1,
                )
              : widget.suffix != null
                  ? Icon(checkdata ? widget.suffix : Icons.close,
                      color: widget.iconColor ?? Colors.red)
                  : null,
        ),
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        obscureText: shownPassword,
        keyboardType: widget.textInputType,
      ),
    );
  }
}
