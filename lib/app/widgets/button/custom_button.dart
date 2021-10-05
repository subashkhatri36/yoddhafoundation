import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String btnText;
  final Color color;

  const CustomButton(
      {Key? key,
      required this.onpressed,
      required this.btnText,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // decoration: BoxDecoration(color: color),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .09,
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
