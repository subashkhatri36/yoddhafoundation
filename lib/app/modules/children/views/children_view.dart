import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/utls/validation.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/custom_container.dart';
import 'package:yoddhafoundation/app/widgets/input/custome_input.dart';
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
                CustomeInput(
                  hintText: Strings.childName,
                  controller: controller.childName,
                  validator: (value) => validateIsEmpty(string: value),
                  prefix: Icons.person,
                ),
                const CustomContainer(
                  child: RealtionDropDownButton(
                    family: false,
                  ),
                ),
                CustomeInput(
                    hintText: Strings.birthDate,
                    controller: controller.dob,
                    inputFormatters: [
                      // FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                      DateInputFormatter()
                    ],
                    keyboardtype: TextInputType.number,
                    validator: (value) => validateIsEmpty(string: value),
                    prefix: Icons.calendar_today),
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
