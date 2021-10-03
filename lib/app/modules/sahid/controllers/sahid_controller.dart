import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/widgets/custom_snackbar.dart';

class SahidController extends GetxController {
  RxString genVal = 'male'.obs;
  File? pickedImg;
  RxBool firstvalue = false.obs;
  RxBool secondvalue = false.obs;
  RxBool thirdvalue = false.obs;
  RxBool checkedValue = false.obs;

  final TextEditingController sahidName = TextEditingController();
// final TextEditingController gender = TextEditingController();
  final TextEditingController deathDate = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController district = TextEditingController();
  final TextEditingController localarea = TextEditingController();
  final TextEditingController oda = TextEditingController();
  final TextEditingController tol = TextEditingController();
  final TextEditingController deathPlace = TextEditingController();

//for image
  RxBool imageselected = false.obs;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> pickImageCamera() async {
    imageselected.value = false;
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    pickedImg = pickedImageFile;
    if (pickedImg != null) {
      imageselected.value = true;
    }

    Get.back();
  }

  Future<void> pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final pickedImageFile = File(pickedImage.path);
      pickedImg = pickedImageFile;
    }

    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
  }

  insertandNext() {
    if (formkey.currentState!.validate()) {
      if (!imageselected.value) {
        customSnackbar(message: 'Please Select Shaid Image');
      } else {
//now working with checkbox
        if (checkdata().isNotEmpty) {
          //now saved
          Sahid sa = Sahid(
              name: 'name',
              gender: 'gender',
              district: 'district',
              state: 'state',
              image: '',
              deathdate: DateTime.now(),
              deathplace: '',
              responsible: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now());
          Get.toNamed(Routes.CHILDREN_DASHBOARD);
          appController.coreShaidModel = CoreShaidModel(shaid: sa);
          // appController.coreShaidModel!.shaid = sa;
          gotoNexPage();
        } else {
          customSnackbar(message: 'Please Selec checkbox');
        }
      }
    } else {
      customSnackbar(message: 'Please Complete all fields');
    }
  }

  String checkdata() {
    if (firstvalue.value && secondvalue.value && thirdvalue.value) {
      //1
      return '${Strings.partySangathan},${Strings.armSangathan},${Strings.other}';
    } else if (firstvalue.value && secondvalue.value) {
      //2
      return '${Strings.partySangathan},${Strings.armSangathan}';
    } else if (firstvalue.value && thirdvalue.value) {
      //3
      return '${Strings.partySangathan},${Strings.other} ';
    } else if (secondvalue.value && thirdvalue.value) {
      //4
      return '${Strings.armSangathan},${Strings.other}';
    } else if (firstvalue.value && secondvalue.value) {
      //5
      return '${Strings.partySangathan},${Strings.armSangathan} ';
    } else {
      return '';
    }
  }

  gotoNexPage() {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
