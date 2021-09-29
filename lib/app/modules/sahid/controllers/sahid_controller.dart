import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SahidController extends GetxController {
  RxString genVal='male'.obs;
  File? pickedImg;
  bool firstvalue = false;
  bool secondvalue = false;
  bool thirdvalue = false;
  bool checkedValue = false;

 final TextEditingController sahidName = TextEditingController();
 final TextEditingController gender = TextEditingController();
 final TextEditingController deathDate = TextEditingController();
 final TextEditingController state = TextEditingController();
 final TextEditingController district = TextEditingController();
 final TextEditingController localarea = TextEditingController();
 final TextEditingController oda = TextEditingController();
 final TextEditingController tol = TextEditingController();
 final TextEditingController deathPlace = TextEditingController();
final GlobalKey<FormState> formkey = GlobalKey<FormState>();  

Future<void> pickImageCamera() async {
 final picker = ImagePicker();
 final pickedImage = await picker.pickImage(source: ImageSource.camera);
 final pickedImageFile = File(pickedImage!.path);   
      pickedImg = pickedImageFile;
   
   Get.back();
  }

Future<void> pickImageGallery() async{
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  if(pickedImage!=null){
final pickedImageFile = File(pickedImage.path);
    pickedImg = pickedImageFile;
  }
  
   
   Get.back();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

}
