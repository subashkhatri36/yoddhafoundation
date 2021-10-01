import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/modules/children/views/children_view.dart';
import 'package:yoddhafoundation/app/modules/sahid_dashboard/views/sahid_dashboard_view.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/utls/validation.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/custom_container.dart';
import 'package:yoddhafoundation/app/widgets/input/custome_input.dart';
import '../controllers/sahid_controller.dart';

class SahidView extends GetView<SahidController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "सहिद विवरण",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                    child: CircleAvatar(
                      radius: 71,
                      backgroundColor: Colors.green,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.green,
                        // backgroundImage: AssetImage('assets/images/download.jpg'),
                        // ignore: unnecessary_null_comparison
                        backgroundImage: controller.pickedImg == null
                            ? null
                            : FileImage(controller.pickedImg!),
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
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text(
                                    "Choose Option",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.purple),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        InkWell(
                                          onTap: controller.pickImageCamera,
                                          splashColor: Colors.deepPurple,
                                          child: Row(
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.camera,
                                                  color: Colors.purpleAccent,
                                                ),
                                              ),
                                              Text(
                                                "Camera",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: controller.pickImageGallery,
                                          splashColor: Colors.purpleAccent,
                                          child: Row(
                                            children: const [
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Icon(
                                                  Icons.image,
                                                  color: Colors.deepPurple,
                                                ),
                                              ),
                                              Text(
                                                "Gallery",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }),
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
                hintText: Strings.deathDate,
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
                hintText: Strings.localArea,
                controller: controller.localarea,
                validator: (value) => validateIsEmpty(string: value),
                prefix: Icons.place,
              ),
              CustomeInput(
                hintText: Strings.oda,
                controller: controller.oda,
                validator: (value) => validateIsEmpty(string: value),
                prefix: Icons.place,
              ),
              CustomeInput(
                hintText: Strings.tol,
                controller: controller.tol,
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
                      Get.toNamed(Routes.CHILDREN_DASHBOARD);
                    },
                    btnText: 'Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
