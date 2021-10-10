import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/utls/validation.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/custom_container.dart';
import 'package:yoddhafoundation/app/widgets/input/custome_input.dart';

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
                CustomContainer(
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isDense: true,
                        value: controller.childValue.value,
                        onChanged: (value) {
                          controller.childValue.value = value.toString();
                        },
                        hint: const Text(Strings.relationship),
                        items: controller.childrenList.map((value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                CustomeInput(
                    hintText: Strings.birthDate,
                    controller: controller.dob,
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
