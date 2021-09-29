import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/modules/family/views/family_view.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/utls/validation.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/custom_container.dart';
import 'package:yoddhafoundation/app/widgets/input/custome_input.dart';

import '../controllers/children_controller.dart';

class ChildrenView extends GetView<ChildrenController> {
 String? _childValue;
List childrenList = ["छोरा", "छोरी"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(Strings.childrenDetails,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
        key: controller.formkey,
        child: Column(
          children:  [
             CustomeInput(
              hintText: Strings.childName,
              controller: controller.childName,
              validator: (value) => validateIsEmpty(string: value),
              prefix: Icons.person,
            ),
            CustomContainer(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
              isDense: true,
              value: _childValue,
              onChanged: (value){},
              hint: const Text(Strings.relationship),
              items: childrenList.map((value){
                return DropdownMenuItem(
                  value: value,
                child: Text(value));
              }).toList(),
              ),
            ),
            ),
             CustomeInput(
              hintText: Strings.birthDate,
              controller: controller.dob,
              validator: (value) => validateIsEmpty(string: value),
              prefix: Icons.calendar_today
            ),
              CustomeInput(
              hintText: Strings.educationQualification,
              controller: controller.eduQulification,
              validator: (value) => validateIsEmpty(string: value),
              prefix: Icons.cast_for_education
            ),
              CustomeInput(
              hintText: Strings.studyingLevel,
              controller: controller.stuLevel,
              validator: (value) => validateIsEmpty(string: value),
              prefix: Icons.cast_for_education
            ),
             CustomeInput(
              hintText: Strings.faculty,
              controller: controller.faculty,
              validator: (value) => validateIsEmpty(string: value),
              prefix: Icons.book_online
            ),
             CustomeInput(
              hintText: Strings.occupation,
              controller: controller.occupation,
              validator: (value) => validateIsEmpty(string: value),
              prefix: Icons.work
            ),
             CustomeInput(
              hintText: Strings.financialStatus,
              controller: controller.financeStatus,
              validator: (value) => validateIsEmpty(string: value),
              prefix: Icons.money
            ),
            Padding(
             padding: const EdgeInsets.all(10.0),
             child: CustomButton(
             onpressed: (){
               Get.toNamed(Routes.FAMILY);
             }, 
             btnText:  'Next'),
           ),
          ],
        )
        ),
      ),
    );
  }
}
