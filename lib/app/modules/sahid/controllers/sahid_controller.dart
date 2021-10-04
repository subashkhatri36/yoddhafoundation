import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
import 'package:yoddhafoundation/app/data/model/shaid_model.dart';
import 'package:yoddhafoundation/app/data/repositories/shaid_repo.dart';
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
  final TextEditingController deathDate = TextEditingController();
  final TextEditingController state = TextEditingController();
  final TextEditingController district = TextEditingController();
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

  Sahid? sahidInfo;

  updateandClose() {
    Sahid sa = Sahid(
        id: sahidInfo!.id,
        name: sahidName.text,
        gender: genVal.value,
        district: district.text,
        state: state.text,
        image: pickedImg!.path,
        deathdate: DateTime.parse(deathDate.text),
        deathplace: deathPlace.text,
        responsible: checkdata(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now());
    shaidRepo.shaidupdate(sa);
    Get.back();
    // appController.coreShaidModel = CoreShaidModel(shaid: sa);
  }

  loadData(Sahid shaid) {
    sahidInfo = shaid;
    sahidName.text = shaid.name;
    deathDate.text = shaid.deathplace;
    state.text = shaid.state;
    district.text = shaid.district;
    deathPlace.text = shaid.deathplace;
    genVal.value = shaid.gender;
    // pickedImg!.path=shaid.image;
    if (shaid.responsible.contains(Strings.other)) {
      thirdvalue.value = true;
    }
    if (shaid.responsible.contains(Strings.armSangathan)) {
      secondvalue.value = true;
    }
    if (shaid.responsible.contains(Strings.partySangathan)) {
      firstvalue.value = true;
    }
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
              name: sahidName.text,
              gender: genVal.value,
              district: district.text,
              state: state.text,
              image: pickedImg!.path,
              deathdate: DateTime.parse(deathDate.text),
              deathplace: deathPlace.text,
              responsible: '',
              createdAt: DateTime.now(),
              updatedAt: DateTime.now());

          appController.coreShaidModel = CoreShaidModel(shaid: sa);
          appController.coreShaidModel!.shaidChildren = [];
          appController.coreShaidModel!.shaidFamily = [];
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

  gotoNexPage() {
    Get.toNamed(Routes.CHILDREN_DASHBOARD, arguments: [OPERATION.insert]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
