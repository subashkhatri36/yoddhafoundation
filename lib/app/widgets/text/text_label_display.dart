import 'package:flutter/material.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            left: Constants.defaultMargin, top: Constants.defaultMargin),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: Constants.defaultFontSize),
        ));
  }
}
