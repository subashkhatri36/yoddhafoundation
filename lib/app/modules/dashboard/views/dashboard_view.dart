import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/modules/sahid/views/sahid_view.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardView'),
        centerTitle: true,
      ),
      floatingActionButton:  FloatingActionButton(
          onPressed: (){
            Get.to(SahidView());
          },
          child: const Icon(Icons.add),
          ),
      body: Container(    
        ),  
    );
  }
}
