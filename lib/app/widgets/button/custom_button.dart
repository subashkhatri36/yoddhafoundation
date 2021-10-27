import 'package:flutter/material.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String btnText;
  final Color color;
  // bool isLoading;
  const CustomButton(
      {Key? key,
      required this.onpressed,
      required this.btnText,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Constants.defaultMargin),
      // decoration: BoxDecoration(color: color),

      height: MediaQuery.of(context).size.height * .06,
      child: ElevatedButton(
        onPressed: onpressed,
        child: Text(
          btnText,
          style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
        ),
      ),
    );
  }
}
