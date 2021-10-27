import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/modules/children/controllers/children_controller.dart';
import 'package:yoddhafoundation/app/modules/family/controllers/family_controller.dart';

class RealtionDropDownButton extends StatefulWidget {
  final bool family;

  const RealtionDropDownButton({
    Key? key,
    this.family = false,
  }) : super(key: key);

  @override
  _RealtionDropDownButtonState createState() => _RealtionDropDownButtonState();
}

class _RealtionDropDownButtonState extends State<RealtionDropDownButton> {
  String _chosenValue = "नाता";
  // bool family=widget.family;

  final List<String> familymemberList = [
    "आमा",
    "बुबा",
    "श्रीमान / श्रीमती",
    "दाजु",
    "भाई",
    "दिदि",
    "बहिनि"
  ];

  List<String> childrenList = ["छोरा", "छोरी"];

  List<String> dataList = [];

  @override
  void initState() {
    if (widget.family) {
      dataList = familymemberList;
      _chosenValue = Get.find<FamilyController>().memberValue;
    } else {
      dataList = childrenList;
      _chosenValue = Get.find<ChildrenController>().childValue;
    }

    super.initState();
  }

  void selectData() {
    if (widget.family) {
      Get.find<FamilyController>().memberValue = _chosenValue;
    } else {
      dataList = childrenList;
      Get.find<ChildrenController>().childValue = _chosenValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _chosenValue,
      isExpanded: true,
      items: dataList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: const Text(
        "नाता",
        style: TextStyle(
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
      onChanged: (value) {
        setState(() {
          _chosenValue = value.toString();
          selectData();
        });
      },
    );
  }
}
