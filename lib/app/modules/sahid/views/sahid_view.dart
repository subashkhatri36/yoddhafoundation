import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/widgets/input/custome_input.dart';

import '../controllers/sahid_controller.dart';

class SahidView extends GetView<SahidController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("सहिद विवरण", style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10.0),
        child: Column(
          children: const<Widget>[
            CustomeInput(
              hintText: 'शाहीदको नाम:',
              prefix: Icons.person,
            ),
            SizedBox(height: 5.0,),
            CustomeInput(
              hintText: "सहादत मिती:",
              prefix: Icons.calendar_today,
            ),
            SizedBox(height: 5.0,),
            CustomeInput(
              hintText: "सहादत मिती:",
              prefix: Icons.calendar_today,
            ),
          ],
        ),
      ),
      ),
    );
  }
}
