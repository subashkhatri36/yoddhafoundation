import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yoddhafoundation/app/widgets/button/custom_button.dart';

import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  final String name = 'Tanka';
  final String email = 'shahitanka1@gmail.com';
  final String role = 'user';

  const UserProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UserProfileView'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: 230,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.lightGreenAccent,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Name: $name',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16),
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email: $email',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16),
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Role:$role',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16),
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Verified:',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16),
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'CreatedAt:',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16),
                  ),
                  const Divider(
                    height: 5,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
