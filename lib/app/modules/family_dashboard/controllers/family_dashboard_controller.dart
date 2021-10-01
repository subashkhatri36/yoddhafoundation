import 'package:get/get.dart';
import 'package:yoddhafoundation/app/data/model/shaid_family.dart';

class FamilyDashboardController extends GetxController {
  List<ShaidFamily> sahidFamilydata = [
    ShaidFamily(
      id: 1,
      shaidId: 3,
      name: 'surendra',
      relation: 'Father',
      age: 65,
      remarks: 'bvcsgcs',
      financialStatus: 'cgjscgs',
      occupation: 'vghaha',
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    ),
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
