import 'package:get/get.dart';
import 'package:yoddhafoundation/app/data/model/shaid_children.dart';

class ChildrenDashboardController extends GetxController {
  List<ShaidChildren> shaidchildrens = [
    ShaidChildren(
        id: 1,
        shaidId: 1,
        name: 'abc',
        relation: 'adf',
        dob: DateTime.now(),
        educationQualification: 'educationQualification',
        currentlyStudyingLevel: 'currentlyStudyingLevel',
        faculty: 'faculty',
        occupation: 'occupation',
        financialStatus: 'financialStatus',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ShaidChildren(
        id: 1,
        shaidId: 1,
        name: 'abc',
        relation: 'adf',
        dob: DateTime.now(),
        educationQualification: 'educationQualification',
        currentlyStudyingLevel: 'currentlyStudyingLevel',
        faculty: 'faculty',
        occupation: 'occupation',
        financialStatus: 'financialStatus',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ShaidChildren(
        id: 1,
        shaidId: 1,
        name: 'abc',
        relation: 'adf',
        dob: DateTime.now(),
        educationQualification: 'educationQualification',
        currentlyStudyingLevel: 'currentlyStudyingLevel',
        faculty: 'faculty',
        occupation: 'occupation',
        financialStatus: 'financialStatus',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ShaidChildren(
        id: 1,
        shaidId: 1,
        name: 'abc',
        relation: 'adf',
        dob: DateTime.now(),
        educationQualification: 'educationQualification',
        currentlyStudyingLevel: 'currentlyStudyingLevel',
        faculty: 'faculty',
        occupation: 'occupation',
        financialStatus: 'financialStatus',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
  ];

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
