import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/app_color.dart';
import 'package:yoddhafoundation/app/constant/asset_link.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: AppColors.circleAvatarColor,
                      backgroundImage: const AssetImage(AppImage.appLogo),
                      radius: 100.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const CircularProgressIndicator(),
                    const Padding(
                        padding: EdgeInsets.all(Constants.defaultPadding)),
                    Text(controller.loading),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
