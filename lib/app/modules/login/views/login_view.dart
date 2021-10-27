import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/utls/validation.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/input/input_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: controller.formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "सहिद तथा बेपत्ता योद्धा सन्तती फाउन्डेशन",
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Start to Sign In",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10.0,
                      ),
                      InputField(
                        controller: controller.username,
                        hintText: 'Enter Email',
                        icon: Icons.email,
                        validator: (value) => validateEmail(string: value),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      InputField(
                        controller: controller.password,
                        hintText: 'Enter Password',
                        validator: (value) => validatePassword(string: value),
                        obscureText: true,
                        icon: Icons.lock,
                        suffix: Icons.visibility_off,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        width: appController.width,
                        height: appController.height * .07,
                        child: Obx(
                          () => controller.isloginClick.value
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  onpressed: () {
                                    controller.login(context);
                                    // Get.to(DashboardView());
                                  },
                                  btnText: 'Login',
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
