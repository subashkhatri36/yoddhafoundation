import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FamilyController extends GetxController {
   String? memberValue;
  final List familymemberList = [
    "आमा",
    "बुबा",
    "श्रीमान / श्रीमती",
    "दाजु",
    "भाई",
    "दिदि",
    "बहिनि"
  ];
  final TextEditingController familyName = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController financialStatus = TextEditingController();
  final TextEditingController remarks = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>(); 

  final count = 0.obs;
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
  void increment() => count.value++;
}
