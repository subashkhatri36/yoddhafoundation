import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/utls/validation.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/custom_container.dart';
import 'package:yoddhafoundation/app/widgets/input/custome_input.dart';

import '../controllers/family_controller.dart';

class FamilyView extends GetView<FamilyController> {
  final argument = Get.arguments;
  FamilyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (argument[0] == OPERATION.update) {
      controller.loadData(argument[1]);
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            Strings.familyDetails,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: controller.formkey,
              child: Column(
                children: [
                  CustomeInput(
                    hintText: Strings.familymemberName,
                    controller: controller.familyName,
                    validator: (value) => validateIsEmpty(string: value),
                    prefix: Icons.person,
                  ),
                  CustomContainer(
                    child: Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isDense: true,
                          value: controller.memberValue.value,
                          onChanged: (value) {
                            controller.memberValue.value = value.toString();
                          },
                          hint: const Text(Strings.relationship),
                          items: controller.familymemberList.map((value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  CustomeInput(
                    hintText: Strings.age,
                    controller: controller.age,
                    validator: (value) => validateIsEmpty(string: value),
                    prefix: Icons.date_range,
                  ),
                  CustomeInput(
                    hintText: Strings.member_occupation,
                    controller: controller.occupation,
                    validator: (value) => validateIsEmpty(string: value),
                    prefix: Icons.work,
                  ),
                  CustomeInput(
                    hintText: Strings.financeCondation,
                    controller: controller.financialStatus,
                    validator: (value) => validateIsEmpty(string: value),
                    prefix: Icons.star_rate,
                  ),
                  CustomeInput(
                    hintText: Strings.remarks,
                    controller: controller.remarks,
                    validator: (value) => validateIsEmpty(string: value),
                    prefix: Icons.stars_sharp,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomButton(
                        onpressed: () {
                          controller.saved(argument[0]);
                        },
                        btnText:
                            argument[0] == OPERATION.update ? 'Update' : 'Add'),
                  ),
                ],
              )),
        ));
  }
}
