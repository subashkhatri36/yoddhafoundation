import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChildrenController extends GetxController {
  final TextEditingController childName = TextEditingController();
  final TextEditingController dob = TextEditingController();
  final TextEditingController eduQulification = TextEditingController();
  final TextEditingController stuLevel = TextEditingController();
  final TextEditingController faculty = TextEditingController();
  final TextEditingController occupation = TextEditingController();
  final TextEditingController financeStatus = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? childValue;
  List childrenList = ["छोरा", "छोरी"];
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
