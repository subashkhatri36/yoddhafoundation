import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/utls/validation.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/custom_container.dart';
import 'package:yoddhafoundation/app/widgets/input/input_widget.dart';
import 'package:yoddhafoundation/app/widgets/relation_drop_down_box.dart';

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
                  InputField(
                    hintText: Strings.familymemberName,
                    controller: controller.familyName,
                    validator: (value) => validateIsEmpty(string: value),
                    icon: Icons.person,
                  ),
                  const CustomContainer(
                      child: RealtionDropDownButton(
                    family: true,
                  )),
                  InputField(
                    hintText: Strings.age,
                    controller: controller.age,
                    validator: (value) => validateIsEmpty(string: value),
                    icon: Icons.date_range,
                    textInputType: TextInputType.number,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: appController.width,
                      height: appController.height * .07,
                      child: CustomButton(
                          onpressed: () {
                            controller.saved(argument[0]);
                          },
                          btnText: argument[0] == OPERATION.update
                              ? 'Update'
                              : 'Add'),
                    ),
                  ),
                ],
              )),
        ));
  }
}
