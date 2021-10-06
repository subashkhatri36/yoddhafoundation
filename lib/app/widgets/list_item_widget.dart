import 'package:flutter/material.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';

class ListItemWidget extends StatelessWidget {
  final String field;
  final String value;
  const ListItemWidget({
    Key? key,
    required this.field,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: appController.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$field : ',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
