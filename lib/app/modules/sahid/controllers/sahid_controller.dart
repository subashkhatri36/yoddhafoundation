import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SahidController extends GetxController {
  //TODO: Implement SahidController

    File? pickedImg;
    

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
