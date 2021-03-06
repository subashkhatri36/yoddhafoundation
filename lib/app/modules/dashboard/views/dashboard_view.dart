import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/constant/constants.dart';
import 'package:yoddhafoundation/app/constant/controller.dart';
import 'package:yoddhafoundation/app/constant/db_name.dart';
import 'package:yoddhafoundation/app/constant/enum.dart';
import 'package:yoddhafoundation/app/constant/string.dart';
import 'package:yoddhafoundation/app/constant/themes.dart';
import 'package:yoddhafoundation/app/core/service/storage_service/shared_preference.dart';
import 'package:yoddhafoundation/app/data/model/shaid_core_model.dart';
import 'package:yoddhafoundation/app/routes/app_pages.dart';
import 'package:yoddhafoundation/app/widgets/authorized_widet_only.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';
import 'package:yoddhafoundation/app/widgets/drawer.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return authorizedAccess(
      WillPopScope(
        onWillPop: () async {
          final data = await showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                      title: const Text("Warning !"),
                      content: const Text("Do you Want to Exit Application ?"),
                      actions: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton(
                                  onpressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  btnText: 'No'),
                              const SizedBox(
                                width: 10,
                              ),
                              CustomButton(
                                  onpressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  btnText: 'Yes'),
                            ])
                      ]));
          return data;
        },
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.shaid, arguments: [OPERATION.insert]);
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: const Text(Strings.appName),
            actions: [
              IconButton(
                  onPressed: () async {
                    controller.onlineSyn();
                   

                    //  controller.onlineSyn();
                  },
                  icon: const Icon(Icons.upload)),
            ],
          ),
          drawer: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: drawer(context)),
          body: SafeArea(
              child: Obx(() => appController.shaidDataOffline.isFalse
                  ? Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text('Loading...'),
                        CircularProgressIndicator(),
                      ],
                    ))
                  : appController.offlineShaidModel.isEmpty
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.all(Constants.defaultPadding),
                          child: Text(
                            '???????????? ???????????? ???????????? ???,??????????????? ???????????? ???????????? ?????? (+) ?????????????????? ??????????????? ???????????????????????????',
                            textAlign: TextAlign.center,
                          ),
                        ))
                      : Padding(
                          padding:
                              const EdgeInsets.all(Constants.defaultPadding),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        appController.offlineShaidModel.length,
                                    itemBuilder: (context, index) {
                                      CoreShaidModel e = appController
                                          .offlineShaidModel[index];

                                      return Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal:
                                                  Constants.defaultMargin,
                                              vertical:
                                                  Constants.defaultMargin /
                                                      2.5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal:
                                                  Constants.defaultPadding / 2,
                                              vertical:
                                                  Constants.defaultPadding / 3),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Themes.black),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Constants.defaultRadius)),
                                          child: ListTile(
                                            onLongPress: () async {
                                              final data = await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (ctx) => AlertDialog(
                                                  title:
                                                      const Text("Warning !"),
                                                  content: const Text(
                                                      "Do you Want to Delete Information of Shaid ?"),
                                                  actions: <Widget>[
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        CustomButton(
                                                            onpressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(false);
                                                            },
                                                            btnText: 'No'),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        CustomButton(
                                                            onpressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(true);
                                                            },
                                                            btnText: 'Yes'),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              );
                                              if (data) {
                                                appController.offlineShaidModel
                                                    .removeAt(index);
                                                shareprefrence.save(
                                                    DBname.shaid,
                                                    appController
                                                        .offlineShaidModel
                                                        .toJson());
                                              }
                                            },
                                            onTap: () {
                                              appController.index = index;
                                              Get.toNamed(Routes.shaidOverview,
                                                  arguments: [
                                                    OPERATION.update,
                                                  ]);
                                            },
                                            title: Text(e.shaid.name),
                                            leading: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                child: Image.file(
                                                  File(e.shaid.image),
                                                  fit: BoxFit.fill,
                                                  height: 100,
                                                  width: 60,
                                                )),
                                            // trailing: const Icon(
                                            //     Icons.keyboard_arrow_right),
                                          ));
                                    }),
                              ),
                            ],
                          ),
                        ))),
        ),
      ),
    );
  }
}
