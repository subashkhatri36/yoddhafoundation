import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/modules/sahid/views/sahid_view.dart';
import 'package:yoddhafoundation/app/widgets/authorized_widet_only.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.count.value = 0;
    return authorizedAccess(
      WillPopScope(
        onWillPop: () async {
          final data = await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Warning !"),
              content: const Text("Do you Want to exit application ?"),
              actions: <Widget>[
                CustomButton(
                    onpressed: () {
                      Navigator.of(context).pop(true);
                    },
                    btnText: 'Yes'),
                CustomButton(
                    onpressed: () {
                      Navigator.of(context).pop(false);
                    },
                    btnText: 'No')
              ],
            ),
          );
          return data;
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(SahidView());
            },
            child: const Icon(Icons.add),
          ),
          body: Container(),
        ),
      ),
    );
  }
}
