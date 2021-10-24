import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';

class CustomeInput extends StatefulWidget {
  const CustomeInput(
      {Key? key,
      this.obstext = false,
      this.validator,
      this.showsuffix = false,
      this.color = Colors.white,
      this.hintText = '',
      this.labeltext = '',
      this.controller,
      this.prefix,
      this.suffix,
      this.keyboardtype,
      this.inputFormatters})
      : super(key: key);
  final Color color;
  final String hintText;
  final bool obstext;
  final String labeltext;
  final TextEditingController? controller;
  final IconData? prefix;
  final IconData? suffix;
  final bool showsuffix;
  // ignore: prefer_typing_uninitialized_variables
  final validator;
  final TextInputType? keyboardtype;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomeInput> createState() => _CustomeInputState();
}

class _CustomeInputState extends State<CustomeInput> {
  bool showpassword = true;

  void show(value) {
    setState(() {
      showpassword = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: Constants.defaultMargin / 2,
          horizontal: Constants.defaultMargin / 2),
      decoration: BoxDecoration(color: widget.color),
      child: TextFormField(
        keyboardType: widget.keyboardtype,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        controller: widget.controller,
        obscureText: widget.obstext == true ? showpassword : widget.obstext,
        decoration: InputDecoration(
          contentPadding: widget.showsuffix
              ? null
              : const EdgeInsets.symmetric(vertical: 25),
          hintText: widget.hintText,
          label: widget.labeltext != '' ? Text(widget.labeltext) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            gapPadding: 0.0,
          ),
          prefixIcon: Icon(widget.prefix),
          suffix: widget.showsuffix
              ? InkWell(
                  onTap: () {
                    showpassword = !showpassword;
                    show(showpassword);
                  },
                  child: showpassword
                      ? Icon(widget.suffix)
                      : const Icon(Icons.visibility))
              : null,
        ),
      ),
    );
  }
}
