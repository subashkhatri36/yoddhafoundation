import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/utls/validation.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/custom_container.dart';
import 'package:yoddhafoundation/app/widgets/input/input_widget.dart';
import 'package:yoddhafoundation/app/widgets/relation_drop_down_box.dart';

import '../controllers/children_controller.dart';

class ChildrenView extends GetView<ChildrenController> {
  final argument = Get.arguments;

  ChildrenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(appController.coreShaidModel!.shaid.name);
    if (argument[0] == OPERATION.update) {
      controller.loadData(argument[1]);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.childrenDetails,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
            key: controller.formkey,
            child: Column(
              children: [
                SizedBox(
                  height: appController.height * 0.02,
                ),
                const TextWidget(
                  text: "Child Name",
                ),
                InputField(
                  hintText: Strings.childName,
                  controller: controller.childName,
                  validator: (value) => validateIsEmpty(string: value),
                  icon: Icons.person,
                ),
                const Padding(
                  padding: EdgeInsets.all(Constants.defaultMargin),
                  child: RealtionDropDownButton(
                    family: false,
                  ),
                ),
                const TextWidget(
                  text: "Date of Birth (DD/MM/YYYY)",
                ),
                InputField(
                    hintText: Strings.birthDate,
                    controller: controller.dob,
                    // inputFormatters: [
                    //   // FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                    //   DateInputFormatter()
                    // ],
                    textInputType: TextInputType.number,
                    validator: (value) => validateIsEmpty(string: value),
                    icon: Icons.calendar_today),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: appController.width,
                    height: appController.height * .07,
                    child: CustomButton(
                        onpressed: () {
                          controller.saved(argument[0]);
                        },
                        btnText:
                            argument[0] == OPERATION.update ? 'Update' : 'Add'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: Constants.defaultMargin),
        alignment: Alignment.centerLeft,
        child: Text(text));
  }
}
