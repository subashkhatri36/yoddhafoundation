import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/utls/validation.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/custom_container.dart';
import 'package:yoddhafoundation/app/widgets/input/custome_input.dart';
import '../controllers/sahid_controller.dart';

class SahidView extends GetView<SahidController> {
  final argument = Get.arguments;
  SahidView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (argument[0] == OPERATION.update) {
      controller.loadData(argument[1]);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "सहिद विवरण",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: controller.formkey,
          child: Column(
            children: <Widget>[
              //Profile Upload
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Obx(
                      () => CircleAvatar(
                        radius: 71,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundColor: Colors.green,
                          // backgroundImage: AssetImage('assets/images/download.jpg'),
                          // ignore: unnecessary_null_comparison
                          backgroundImage: !controller.imageselected.value
                              ? null
                              : FileImage(controller.pickedImg!),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 100,
                    child: RawMaterialButton(
                        elevation: 10,
                        fillColor: Colors.purpleAccent,
                        child: const Icon(Icons.add_a_photo),
                        padding: const EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                        onPressed: controller.pickImageGallery),
                  ),
                ],
              ),

              CustomeInput(
                hintText: Strings.sahidName,
                controller: controller.sahidName,
                validator: (value) => validateIsEmpty(string: value),
                prefix: Icons.person,
              ),
              CustomContainer(
                child: Obx(
                  () => Row(
                    children: [
                      Text(
                        Strings.gender,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Radio(
                              value: "male",
                              groupValue: controller.genVal.value,
                              onChanged: (newValue) {
                                controller.genVal.value = newValue.toString();
                              }),
                          title: const Text(Strings.male),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: Radio(
                              value: "female",
                              groupValue: controller.genVal.value,
                              onChanged: (newValue) {
                                controller.genVal.value = newValue.toString();
                              }),
                          title: const Text(Strings.female),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomeInput(
                // inputFormatters: [
                //   // FilteringTextInputFormatter.allow(RegExp("[0-9/]")),
                //   // LengthLimitingTextInputFormatter(10),
                //   //DateFormatter(),
                // ],
                hintText: 'DD-MM-YYYY',
                validator: (value) => validateIsEmpty(string: value),
                controller: controller.deathDate,
                prefix: Icons.calendar_today,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.sahidAddress,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                ),
              ),
              CustomeInput(
                hintText: Strings.state,
                controller: controller.state,
                validator: (value) => validateIsEmpty(string: value),
                prefix: Icons.place,
              ),
              CustomeInput(
                hintText: Strings.district,
                controller: controller.district,
                validator: (value) => validateIsEmpty(string: value),
                prefix: Icons.place,
              ),
              CustomeInput(
                hintText: Strings.deathPlace,
                controller: controller.deathPlace,
                validator: (value) => validateIsEmpty(string: value),
                prefix: Icons.home,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Strings.organizationalResponsibility,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 16.0,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Obx(
                  () => Column(
                    children: [
                      CheckboxListTile(
                        value: controller.firstvalue.value,
                        onChanged: (value) {
                          controller.firstvalue.value = value!;
                        },
                        title: const Text(Strings.partySangathan),
                        selected: controller.checkedValue.value,
                        activeColor: Colors.green,
                      ),
                      CheckboxListTile(
                        value: controller.secondvalue.value,
                        onChanged: (value) {
                          controller.secondvalue.value = value!;
                        },
                        title: const Text(Strings.armSangathan),
                        selected: controller.checkedValue.value,
                        activeColor: Colors.green,
                      ),
                      CheckboxListTile(
                        value: controller.thirdvalue.value,
                        onChanged: (value) {
                          controller.thirdvalue.value = value!;
                        },
                        title: const Text(Strings.other),
                        selected: controller.checkedValue.value,
                        activeColor: Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomButton(
                    onpressed: () {
                      argument[0] == OPERATION.update
                          ? controller.updateandClose()
                          : controller.insertandNext();
                    },
                    btnText:
                        argument[0] == OPERATION.update ? 'Update' : 'Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
